let
  template = {  }:
  allDeps:
    {
      key = { name = "plugin-proposal-class-properties"; scope = "babel"; };
      version = "7.10.4";
      nodeBuildInputs = let
        a = allDeps;
      in [
        (a."@babel/helper-plugin-utils@^7.10.4")
        (a."@babel/helper-create-class-features-plugin@^7.10.4")
        (a."@babel/helper-plugin-test-runner@^7.10.4")
        (a."@babel/core@^7.10.4")
        ];
      meta = {
        description = "This plugin transforms static class properties as well as properties declared with the property initializer syntax";
        license = "MIT";
        homepage = "";
        };
      };
in
import ./generic.nix {
  inherit template;
  depsPath = ./deps/babel-plugin-proposal-class-properties.nix;

  pname = "@babel/plugin-proposal-class-properties";
  version = "7.10.4";
  sha256 = "1zi7vzrvjn597kzpaalp2wy06p2zqc4bgylsl65xgm1zrkcwdrvj";
}
