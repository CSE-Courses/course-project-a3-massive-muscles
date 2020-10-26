let
  template = {  }:
  allDeps:
    {
      key = { name = "selenium-webdriver"; scope = ""; };
      version = "4.0.0-alpha.7";
      nodeBuildInputs = let
        a = allDeps;
      in [
        (a."serve-index@^1.9.1")
        (a."multer@^1.4.2")
        (a."jasmine@^3.5.0")
        (a."jszip@^3.2.2")
        (a."mocha@^5.2.0")
        (a."tmp@0.0.30")
        (a."express@^4.17.1")
        (a."sinon@^7.5.0")
        (a."rimraf@^2.7.1")
        ];
      meta = {
        description = "The official WebDriver JavaScript bindings from the Selenium project";
        license = "Apache-2.0";
        homepage = "https://github.com/SeleniumHQ/selenium";
        };
      };
in
import ./generic.nix {
  inherit template;
  depsPath = ./deps/selenium-webdriver.nix;

  pname = "selenium-webdriver";
  version = "4.0.0-alpha.7";
  sha256 = "11snc5rbwy0wk3w7phvshrj55aqji0ar7bi7agqnbzs2pkp8v0d0";
}
