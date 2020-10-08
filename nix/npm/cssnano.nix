let
  template = {  }:
  allDeps:
    {
      key = { name = "cssnano"; scope = ""; };
      version = "4.1.10";
      nodeBuildInputs = let
        a = allDeps;
      in [
        (a."cssnano-preset-default@^4.0.7")
        (a."postcss@^7.0.0")
        (a."babel-cli@^6.0.0")
        (a."cross-env@^5.0.0")
        (a."cssnano-preset-advanced@^4.0.7")
        (a."cosmiconfig@^5.0.0")
        (a."babel-loader@^7.0.0")
        (a."is-resolvable@^1.0.0")
        (a."postcss-font-magician@^2.0.0")
        (a."webpack-bundle-size-analyzer@^2.0.0")
        (a."array-to-sentence@^2.0.0")
        (a."babel-core@^6.0.0")
        (a."webpack@^2.0.0")
        ];
      meta = {
        description = "A modular minifier, built on top of the PostCSS ecosystem.";
        license = "MIT";
        homepage = "https://github.com/cssnano/cssnano";
        };
      };
in
import ./generic.nix {
  inherit template;
  depsPath = ./deps/cssnano.nix;

  pname = "cssnano";
  version = "4.1.10";
  sha256 = "0ir6lv5a0mwmjlnw3w361wx8f7sq02i0nj8av0wla3m96jd17q0n";
}
