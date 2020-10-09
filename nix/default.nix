{ stdenv, runCommand
, html-minifier, postcss-cli
, cssnano, postcss-preset-env
, babel-cli, babel-core, babel-preset-env
, babel-plugin-proposal-class-properties, uglify-js
}:

{ src }:
let
  node_modules = runCommand "a3-massive-muscles-node_modules" {} ''
    mkdir -p $out
    ln -s ${cssnano} $out/cssnano
    ln -s ${postcss-preset-env} $out/postcss-preset-env

    mkdir -p "$out/@babel"
    ln -s ${babel-core} "$out/@babel/core"
    ln -s ${babel-preset-env} "$out/@babel/preset-env"
    ln -s ${babel-plugin-proposal-class-properties} "$out/@babel/plugin-proposal-class-properties"
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

    # Babel seems to not look at NODE_PATH so we plug it in as well
    ln -s ${node_modules} node_modules
  '';

  nativeBuildInputs = [
    html-minifier postcss-cli
    babel-cli uglify-js
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
    # Minify HTML
    html-minifier --file-ext html --input-dir $out --output-dir $out \
      --collapse-whitespace --decode-entities --minify-css --minify-js \
      --remove-comments --remove-optional-tags --remove-redundant-attributes \
      --remove-script-type-attributes --remove-style-link-type-attributes --use-short-doctype \
      --trim-custom-fragments --ignore-custom-fragments '/<script> <\/script>/'

    # Compress and polyfill CSS
    postcss "$out/**/*.css" \
      --replace --no-map --verbose \
      --use cssnano --use postcss-preset-env

    # Transpile Javascript for maximum compatibility
    babel.js $out/JS --out-dir $out/JS

    # Compress Javascript
    find $out/JS -type f -name '*.js' -exec uglifyjs "{}" --compress --mangle --output "{}" \;
  '';
}
