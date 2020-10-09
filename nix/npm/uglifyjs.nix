let
  template = {  }:
  allDeps:
    {
      key = { name = "uglify-js"; scope = ""; };
      version = "3.11.1";
      nodeBuildInputs = let
        a = allDeps;
      in [ (a."semver@~6.3.0") (a."acorn@~7.1.0") ];
      meta = {
        description = "JavaScript parser, mangler/compressor and beautifier toolkit";
        license = "BSD-2-Clause";
        homepage = "";
        };
      };
in
import ./generic.nix {
  inherit template;
  depsPath = ./deps/uglifyjs.nix;

  pname = "uglify-js";
  version = "3.11.1";
  sha256 = "0n87yncjhxxy8zvy26zlrd5aa0wyrahd0am3q4mmg2r2iyhwjwvy";
}
