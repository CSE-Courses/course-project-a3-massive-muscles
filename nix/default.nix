{ stdenv, runCommand
, html-minifier, postcss-cli
, cssnano, postcss-preset-env, selenium-webdriver
, babel-cli, babel-core, babel-preset-env
, babel-plugin-proposal-class-properties, uglify-js
}:

{ src }:
let
  node_modules = runCommand "a3-massive-muscles-node_modules" {} ''
    mkdir -p $out
    ln -s ${cssnano} $out/cssnano
    ln -s ${postcss-preset-env} $out/postcss-preset-env
    ln -s ${selenium-webdriver} $out/selenium-webdriver

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

  dontBuild = true;

  installPhase = ''
    # Workaround for https://github.com/actions/upload-artifact/issues/92
    mkdir -p $out/dist

    mv --verbose * $out/dist
    # Remove definite extra baggage from release
    rm -rf $out/dist/{node_modules,.github,doc,nix,test}
  '';

  fixupPhase = ''
    # Compress and polyfill CSS
    find $out -name '*.css' | while read -r file; do
      postcss "$file" --replace --no-map --verbose --use cssnano --use postcss-preset-env
    done

    # Transpile Javascript for maximum compatibility
    babel.js $out --out-dir $out

    # Compress Javascript
    # find $out -type f -name '*.js' -exec uglifyjs "{}" --compress --mangle --output "{}" \;
  '';

  passthru = {
    inherit node_modules;
  };
}
