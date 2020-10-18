let
  template = {  }:
  allDeps:
    {
      key = { name = "cli"; scope = "babel"; };
      version = "7.11.6";
      nodeBuildInputs = let
        a = allDeps;
      in [
        (a."fs-readdir-recursive@^1.1.0")
        (a."slash@^2.0.0")
        (a."make-dir@^2.1.0")
        (a."@babel/helper-fixtures@^7.10.5")
        (a."convert-source-map@^1.1.0")
        (a."source-map@^0.5.0")
        (a."@babel/core@^7.11.6")
        (a."lodash@^4.17.19")
        (a."commander@^4.0.1")
        (a."rimraf@^3.0.0")
        (a."glob@^7.0.0")
        ];
      meta = {
        description = "Babel command line.";
        license = "MIT";
        homepage = "https://babeljs.io/";
        };
      };
in
import ./generic.nix {
  inherit template;
  depsPath = ./deps/babel-cli.nix;

  pname = "@babel/cli";
  version = "7.11.6";
  sha256 = "13k7md051shrlalqii7amr9x4minwbb8x4nsv9f3jmkgjbcdlz6p";
}
