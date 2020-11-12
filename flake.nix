{
  description = "a3-massive-muscles flake";

  # Nixpkgs / NixOS version to use.
  inputs.nixpkgs = { type = "github"; owner = "NixOS"; repo = "nixpkgs"; ref = "nixos-20.09"; };

  # Flake compatability shim
  inputs.flake-compat = { type = "github"; owner = "edolstra"; repo = "flake-compat"; flake = false; };

  # Tools
  inputs.yarn2nix-src = { type = "github"; owner = "Profpatsch"; repo = "yarn2nix"; flake = false; };
  inputs.yarn2nix-nixpkgs = { type = "github"; owner = "NixOS"; repo = "nixpkgs"; rev = "c438ce12a858f24c1a2479213eaab751da45fa50"; flake = false; };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      # Helper function to map across all inputs, excluding nixpkgs
      forAllInputs = f: nixpkgs.lib.mapAttrs f (nixpkgs.lib.removeAttrs inputs [ "nixpkgs" ]);

      # Generate a user-friendly version numer.
      versions = forAllInputs (_: input: builtins.substring 0 8 input.lastModifiedDate);

      # System types to support.
      supportedSystems = [ "x86_64-linux" ];

      # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);

      # Nixpkgs instantiated for supported system types.
      nixpkgsFor = forAllSystems (system: import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
        overlays = [
          self.overlay
        ];
      });

    in
    {

      # A Nixpkgs overlay.
      overlay = final: prev:
        with final;
        {

          yarn2nix = import inputs.yarn2nix-src
            { pkgs = import inputs.yarn2nix-nixpkgs { inherit system; config = { }; }; };

          babel-cli = callPackage ./nix/npm/babel-cli.nix { };
          babel-core = callPackage ./nix/npm/babel-core.nix { };
          babel-preset-env = callPackage ./nix/npm/babel-preset-env.nix { };
          babel-plugin-proposal-class-properties = callPackage ./nix/npm/babel-plugin-proposal-class-properties.nix { };
          cssnano = callPackage ./nix/npm/cssnano.nix { inherit (final) yarn2nix; };
          postcss-cli = callPackage ./nix/npm/postcss-cli.nix { };
          postcss-preset-env = callPackage ./nix/npm/postcss-preset-env.nix { };
          uglifyjs = callPackage ./nix/npm/uglifyjs.nix { };
          uglify-js = uglifyjs; # Compatibility with node package name
          selenium-webdriver = callPackage ./nix/npm/selenium-webdriver.nix { };

          interpreter = python3.withPackages (ps:
            with ps;
            [
              pip pytz jinja2 werkzeug itsdangerous click numpy setuptools markupsafe
              pandas dateutil six openpyxl jdcal attrs jsonschema pyrsistent
              colour flask gunicorn flask_sqlalchemy flask_wtf wtforms email_validator
              bcrypt flask-bcrypt flask_login
              # missing `StyleFrame~=3.0.5` but shit is just a big clump of random dependencies anyway
            ]);

          a3-massive-muscles = callPackage ./nix {
            inherit (nodePackages) html-minifier;
          } {
            src = ./.;
          };

        };

      # Provide some binary packages for selected system types.
      packages = forAllSystems (system:
        with nixpkgsFor.${system};
        {

          inherit
            yarn2nix
            cssnano postcss-cli postcss-preset-env
            babel-cli babel-core babel-preset-env
            babel-plugin-proposal-class-properties uglifyjs
            selenium-webdriver
            interpreter
            a3-massive-muscles;

          inherit (nodePackages)
            html-minifier;

        });

      defaultPackage = forAllSystems (system: self.packages.${system}.a3-massive-muscles);

      # NixOS system configuration, if applicable
      # nix build -L .#nixosConfigurations.a3-massive-muscles.config.system.build.vm
      nixosConfigurations.a3-massive-muscles = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; # Hardcoded
        modules = [
          ({ modulesPath, pkgs, ... }: {
            imports = [ (modulesPath + "/virtualisation/qemu-vm.nix") ];
            virtualisation.qemu.options = [ "-m 2G" "-vga virtio" ];

            networking.networkmanager.enable = true;
            services.xserver.enable = true;
            services.xserver.layout = "us";
            services.xserver.windowManager.i3.enable = true;
            services.xserver.displayManager.lightdm.enable = true;

            users.mutableUsers = false;
            users.users.whothis = {
              password = "whothis"; # yes, very secure, I know
              createHome = true;
              isNormalUser = true;
              extraGroups = [ "wheel" ];
            };

            nixpkgs.overlays = [ self.overlay ];
            nixpkgs.config.allowUnfree = true;
            environment.variables.CHROME_BINARY = pkgs.google-chrome + "/bin/google-chrome-stable";
            environment.variables.NODE_PATH = pkgs.a3-massive-muscles.node_modules.outPath;
            environment.variables.PROJECT_SRC = toString pkgs.a3-massive-muscles.src;
            environment.variables.PROJECT_INTERPRETER = pkgs.interpreter + "/bin/python";
            environment.shellAliases.a3-massive-muscles =
              let
                script = pkgs.writeShellScriptBin "a3-massive-muscles" ''
                  [ -d a3-massive-muscles ] && rm -rf a3-massive-muscles
                  cp -r --no-preserve=all ${pkgs.a3-massive-muscles}/dist/ a3-massive-muscles
                  $PROJECT_INTERPRETER a3-massive-muscles/main.py
                '';
              in "${script}/bin/a3-massive-muscles";
            environment.systemPackages = with pkgs; [
              nodejs chromedriver
              vim curl chromium sqlite-analyzer sqlitebrowser
            ];
          })
        ];
      };

      # Tests run by 'nix flake check' and by Hydra.
      checks = forAllSystems (system:
        let
          pkgs = nixpkgsFor.${system};
        in
        with pkgs;
        with self.packages.${system};
        with import (nixpkgs + "/nixos/lib/testing-python.nix") { inherit system; };
        self.packages.${system} // {

          # Additional tests, if applicable.
          frontend-timer =
            makeTest {
              nodes.default = { ... }: {
                imports =
                  [
                    # X11 support
                    (nixpkgs + "/nixos/tests/common/x11.nix")
                  ];

                environment.systemPackages = [ nodejs chromedriver ];
                environment.variables.CHROME_BINARY = google-chrome + "/bin/google-chrome-stable";
                environment.variables.NODE_PATH = a3-massive-muscles.node_modules.outPath;
              };

              testScript = ''
                start_all()

                default.wait_for_x()
                default.succeed(
                    "SOURCE_DIR=${a3-massive-muscles.src} node ${a3-massive-muscles.src}/test/frontend/timer.js"
                )

                default.shutdown()
              '';
            };

      });
    };
}
