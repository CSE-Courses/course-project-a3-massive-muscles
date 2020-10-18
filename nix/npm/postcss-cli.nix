let
  template = {  }:
  allDeps:
    {
      key = { name = "postcss-cli"; scope = ""; };
      version = "8.0.0";
      nodeBuildInputs = let
        a = allDeps;
      in [
        (a."pretty-hrtime@^1.0.3")
        (a."nyc@^15.0.0")
        (a."coveralls@^3.0.0")
        (a."get-stdin@^8.0.0")
        (a."postcss-load-config@^2.1.1")
        (a."sugarss@^3.0.0")
        (a."fs-extra@^9.0.0")
        (a."chalk@^4.0.0")
        (a."globby@^11.0.0")
        (a."uuid@^8.0.0")
        (a."postcss@^8.0.4")
        (a."postcss-import@^12.0.0")
        (a."eslint-config-problems@5.0.0")
        (a."read-cache@^1.0.0")
        (a."yargs@^16.0.0")
        (a."eslint@^7.8.0")
        (a."chokidar@^3.3.0")
        (a."postcss-reporter@^7.0.0")
        (a."ava@^3.1.0")
        (a."dependency-graph@^0.9.0")
        (a."prettier@~2.1.0")
        ];
      meta = {
        description = "CLI for PostCSS";
        license = "MIT";
        homepage = "https://github.com/postcss/postcss-cli#readme";
        };
      };
in
import ./generic.nix {
  inherit template;
  depsPath = ./deps/postcss-cli.nix;

  pname = "postcss-cli";
  version = "8.0.0";
  sha256 = "05471wkmrvsbj58bnykvya366i3gn6jikqr1mrn3l6hvs4zgn7wk";
}
