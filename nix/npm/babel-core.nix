let
  template = {  }:
  allDeps:
    {
      key = { name = "core"; scope = "babel"; };
      version = "7.11.6";
      nodeBuildInputs = let
        a = allDeps;
      in [
        (a."@babel/helper-module-transforms@^7.11.0")
        (a."@babel/generator@^7.11.6")
        (a."gensync@^1.0.0-beta.1")
        (a."convert-source-map@^1.7.0")
        (a."debug@^4.1.0")
        (a."source-map@^0.5.0")
        (a."resolve@^1.3.2")
        (a."@babel/types@^7.11.5")
        (a."@babel/template@^7.10.4")
        (a."@babel/traverse@^7.11.5")
        (a."semver@^5.4.1")
        (a."@babel/helper-transform-fixture-test-runner@^7.11.6")
        (a."@babel/helpers@^7.10.4")
        (a."@babel/code-frame@^7.10.4")
        (a."lodash@^4.17.19")
        (a."json5@^2.1.2")
        (a."@babel/parser@^7.11.5")
        ];
      meta = {
        description = "Babel compiler core.";
        license = "MIT";
        homepage = "https://babeljs.io/";
        };
      };
in
import ./generic.nix {
  inherit template;
  depsPath = ./deps/babel-core.nix;

  pname = "@babel/core";
  version = "7.11.6";
  sha256 = "1z01dby772hi7fym814bs6jbyiprxl84bq06yk4cb5i14l8fdrac";
}
