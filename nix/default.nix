{ stdenv, runCommand
, postcss-cli
, postcss-preset-env
}:

{ src }:
let
  node_modules = runCommand "a3-massive-muscles-node_modules" {} ''
    mkdir -p $out
    ln -s ${postcss-preset-env} $out/postcss-preset-env
  '';

  # Basically like a LD_LIBRARY_PATH for Node.js if you don't know
  NODE_PATH = stdenv.lib.concatStringsSep ":" (map
    (drv: drv.out)
    [ node_modules ]);
in
stdenv.mkDerivation {
  name = "a3-massive-muscles";
  inherit src;

  configurePhase = ''
    export NODE_PATH="${NODE_PATH}''${NODE_PATH:+:}$NODE_PATH"
  '';

  nativeBuildInputs = [
    postcss-cli
  ];

  buildPhase = ''
    # Copy over assets
    mkdir -p public
    cp *.html public
    cp -r CSS JS public
  '';

  installPhase = ''
    mv --verbose --no-target-directory public $out
  '';

  fixupPhase = ''
    postcss "$out/**/*.css" \
      --replace --no-map --verbose \
      --use postcss-preset-env
  '';
}
