{ stdenv, runCommand
, html-minifier, postcss-cli
, cssnano, postcss-preset-env
}:

{ src }:
let
  node_modules = runCommand "a3-massive-muscles-node_modules" {} ''
    mkdir -p $out
    ln -s ${cssnano} $out/cssnano
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
    html-minifier postcss-cli
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
    html-minifier --file-ext html --input-dir $out --output-dir $out \
      --collapse-whitespace --decode-entities --minify-css --minify-js \
      --remove-comments --remove-optional-tags --remove-redundant-attributes \
      --remove-script-type-attributes --remove-style-link-type-attributes --use-short-doctype \
      --trim-custom-fragments --ignore-custom-fragments '/<script> <\/script>/'

    postcss "$out/**/*.css" \
      --replace --no-map --verbose \
      --use cssnano --use postcss-preset-env
  '';
}
