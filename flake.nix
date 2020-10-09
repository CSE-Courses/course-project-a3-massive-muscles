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
        config = { };
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
            babel-plugin-proposal-class-properties
            a3-massive-muscles;

          inherit (nodePackages)
            html-minifier;

        });

      defaultPackage = forAllSystems (system: self.packages.${system}.a3-massive-muscles);

      checks = forAllSystems (system: self.packages.${system});

    };
}
