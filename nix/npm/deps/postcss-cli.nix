{ fetchurl, fetchgit }:
  self:
    super:
      let
        registries = {
          yarn = n:
            v:
              "https://registry.yarnpkg.com/${n}/-/${n}-${v}.tgz";
          npm = n:
            v:
              "https://registry.npmjs.org/${n}/-/${n}-${v}.tgz";
          };
        nodeFilePackage = key:
          version:
            registry:
              sha1:
                deps:
                  super._buildNodePackage {
                    inherit key version;
                    src = fetchurl {
                      url = registry key version;
                      inherit sha1;
                      };
                    nodeBuildInputs = deps;
                    };
        nodeFileLocalPackage = key:
          version:
            path:
              sha1:
                deps:
                  super._buildNodePackage {
                    inherit key version;
                    src = builtins.path { inherit path; };
                    nodeBuildInputs = deps;
                    };
        nodeGitPackage = key:
          version:
            url:
              rev:
                sha256:
                  deps:
                    super._buildNodePackage {
                      inherit key version;
                      src = fetchgit { inherit url rev sha256; };
                      nodeBuildInputs = deps;
                      };
        identityRegistry = url:
          _:
            _:
              url;
        scopedName = scope:
          name:
            { inherit scope name; };
        ir = identityRegistry;
        l = nodeFileLocalPackage;
        f = nodeFilePackage;
        g = nodeGitPackage;
        n = registries.npm;
        y = registries.yarn;
        sc = scopedName;
        s = self;
      in {
        "@babel/code-frame@7.10.4" = f (sc "babel" "code-frame") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.10.4.tgz") "168da1a36e90da68ae8d49c0f1b48c7c6249213a" [
          (s."@babel/highlight@^7.10.4")
          ];
        "@babel/code-frame@^7.0.0" = s."@babel/code-frame@7.10.4";
        "@babel/code-frame@^7.10.4" = s."@babel/code-frame@7.10.4";
        "@babel/core@7.11.6" = f (sc "babel" "core") "7.11.6" (ir "https://registry.yarnpkg.com/@babel/core/-/core-7.11.6.tgz") "3a9455dc7387ff1bac45770650bc13ba04a15651" [
          (s."@babel/code-frame@^7.10.4")
          (s."@babel/generator@^7.11.6")
          (s."@babel/helper-module-transforms@^7.11.0")
          (s."@babel/helpers@^7.10.4")
          (s."@babel/parser@^7.11.5")
          (s."@babel/template@^7.10.4")
          (s."@babel/traverse@^7.11.5")
          (s."@babel/types@^7.11.5")
          (s."convert-source-map@^1.7.0")
          (s."debug@^4.1.0")
          (s."gensync@^1.0.0-beta.1")
          (s."json5@^2.1.2")
          (s."lodash@^4.17.19")
          (s."resolve@^1.3.2")
          (s."semver@^5.4.1")
          (s."source-map@^0.5.0")
          ];
        "@babel/core@^7.7.5" = s."@babel/core@7.11.6";
        "@babel/generator@7.11.6" = f (sc "babel" "generator") "7.11.6" (ir "https://registry.yarnpkg.com/@babel/generator/-/generator-7.11.6.tgz") "b868900f81b163b4d464ea24545c61cbac4dc620" [
          (s."@babel/types@^7.11.5")
          (s."jsesc@^2.5.1")
          (s."source-map@^0.5.0")
          ];
        "@babel/generator@^7.11.5" = s."@babel/generator@7.11.6";
        "@babel/generator@^7.11.6" = s."@babel/generator@7.11.6";
        "@babel/helper-function-name@7.10.4" = f (sc "babel" "helper-function-name") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helper-function-name/-/helper-function-name-7.10.4.tgz") "d2d3b20c59ad8c47112fa7d2a94bc09d5ef82f1a" [
          (s."@babel/helper-get-function-arity@^7.10.4")
          (s."@babel/template@^7.10.4")
          (s."@babel/types@^7.10.4")
          ];
        "@babel/helper-function-name@^7.10.4" = s."@babel/helper-function-name@7.10.4";
        "@babel/helper-get-function-arity@7.10.4" = f (sc "babel" "helper-get-function-arity") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helper-get-function-arity/-/helper-get-function-arity-7.10.4.tgz") "98c1cbea0e2332f33f9a4661b8ce1505b2c19ba2" [
          (s."@babel/types@^7.10.4")
          ];
        "@babel/helper-get-function-arity@^7.10.4" = s."@babel/helper-get-function-arity@7.10.4";
        "@babel/helper-member-expression-to-functions@7.11.0" = f (sc "babel" "helper-member-expression-to-functions") "7.11.0" (ir "https://registry.yarnpkg.com/@babel/helper-member-expression-to-functions/-/helper-member-expression-to-functions-7.11.0.tgz") "ae69c83d84ee82f4b42f96e2a09410935a8f26df" [
          (s."@babel/types@^7.11.0")
          ];
        "@babel/helper-member-expression-to-functions@^7.10.4" = s."@babel/helper-member-expression-to-functions@7.11.0";
        "@babel/helper-module-imports@7.10.4" = f (sc "babel" "helper-module-imports") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helper-module-imports/-/helper-module-imports-7.10.4.tgz") "4c5c54be04bd31670a7382797d75b9fa2e5b5620" [
          (s."@babel/types@^7.10.4")
          ];
        "@babel/helper-module-imports@^7.10.4" = s."@babel/helper-module-imports@7.10.4";
        "@babel/helper-module-transforms@7.11.0" = f (sc "babel" "helper-module-transforms") "7.11.0" (ir "https://registry.yarnpkg.com/@babel/helper-module-transforms/-/helper-module-transforms-7.11.0.tgz") "b16f250229e47211abdd84b34b64737c2ab2d359" [
          (s."@babel/helper-module-imports@^7.10.4")
          (s."@babel/helper-replace-supers@^7.10.4")
          (s."@babel/helper-simple-access@^7.10.4")
          (s."@babel/helper-split-export-declaration@^7.11.0")
          (s."@babel/template@^7.10.4")
          (s."@babel/types@^7.11.0")
          (s."lodash@^4.17.19")
          ];
        "@babel/helper-module-transforms@^7.11.0" = s."@babel/helper-module-transforms@7.11.0";
        "@babel/helper-optimise-call-expression@7.10.4" = f (sc "babel" "helper-optimise-call-expression") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helper-optimise-call-expression/-/helper-optimise-call-expression-7.10.4.tgz") "50dc96413d594f995a77905905b05893cd779673" [
          (s."@babel/types@^7.10.4")
          ];
        "@babel/helper-optimise-call-expression@^7.10.4" = s."@babel/helper-optimise-call-expression@7.10.4";
        "@babel/helper-replace-supers@7.10.4" = f (sc "babel" "helper-replace-supers") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helper-replace-supers/-/helper-replace-supers-7.10.4.tgz") "d585cd9388ea06e6031e4cd44b6713cbead9e6cf" [
          (s."@babel/helper-member-expression-to-functions@^7.10.4")
          (s."@babel/helper-optimise-call-expression@^7.10.4")
          (s."@babel/traverse@^7.10.4")
          (s."@babel/types@^7.10.4")
          ];
        "@babel/helper-replace-supers@^7.10.4" = s."@babel/helper-replace-supers@7.10.4";
        "@babel/helper-simple-access@7.10.4" = f (sc "babel" "helper-simple-access") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helper-simple-access/-/helper-simple-access-7.10.4.tgz") "0f5ccda2945277a2a7a2d3a821e15395edcf3461" [
          (s."@babel/template@^7.10.4")
          (s."@babel/types@^7.10.4")
          ];
        "@babel/helper-simple-access@^7.10.4" = s."@babel/helper-simple-access@7.10.4";
        "@babel/helper-split-export-declaration@7.11.0" = f (sc "babel" "helper-split-export-declaration") "7.11.0" (ir "https://registry.yarnpkg.com/@babel/helper-split-export-declaration/-/helper-split-export-declaration-7.11.0.tgz") "f8a491244acf6a676158ac42072911ba83ad099f" [
          (s."@babel/types@^7.11.0")
          ];
        "@babel/helper-split-export-declaration@^7.11.0" = s."@babel/helper-split-export-declaration@7.11.0";
        "@babel/helper-validator-identifier@7.10.4" = f (sc "babel" "helper-validator-identifier") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helper-validator-identifier/-/helper-validator-identifier-7.10.4.tgz") "a78c7a7251e01f616512d31b10adcf52ada5e0d2" [];
        "@babel/helper-validator-identifier@^7.10.4" = s."@babel/helper-validator-identifier@7.10.4";
        "@babel/helpers@7.10.4" = f (sc "babel" "helpers") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helpers/-/helpers-7.10.4.tgz") "2abeb0d721aff7c0a97376b9e1f6f65d7a475044" [
          (s."@babel/template@^7.10.4")
          (s."@babel/traverse@^7.10.4")
          (s."@babel/types@^7.10.4")
          ];
        "@babel/helpers@^7.10.4" = s."@babel/helpers@7.10.4";
        "@babel/highlight@7.10.4" = f (sc "babel" "highlight") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.10.4.tgz") "7d1bdfd65753538fabe6c38596cdb76d9ac60143" [
          (s."@babel/helper-validator-identifier@^7.10.4")
          (s."chalk@^2.0.0")
          (s."js-tokens@^4.0.0")
          ];
        "@babel/highlight@^7.10.4" = s."@babel/highlight@7.10.4";
        "@babel/parser@7.11.5" = f (sc "babel" "parser") "7.11.5" (ir "https://registry.yarnpkg.com/@babel/parser/-/parser-7.11.5.tgz") "c7ff6303df71080ec7a4f5b8c003c58f1cf51037" [];
        "@babel/parser@^7.10.4" = s."@babel/parser@7.11.5";
        "@babel/parser@^7.11.5" = s."@babel/parser@7.11.5";
        "@babel/template@7.10.4" = f (sc "babel" "template") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/template/-/template-7.10.4.tgz") "3251996c4200ebc71d1a8fc405fba940f36ba278" [
          (s."@babel/code-frame@^7.10.4")
          (s."@babel/parser@^7.10.4")
          (s."@babel/types@^7.10.4")
          ];
        "@babel/template@^7.10.4" = s."@babel/template@7.10.4";
        "@babel/traverse@7.11.5" = f (sc "babel" "traverse") "7.11.5" (ir "https://registry.yarnpkg.com/@babel/traverse/-/traverse-7.11.5.tgz") "be777b93b518eb6d76ee2e1ea1d143daa11e61c3" [
          (s."@babel/code-frame@^7.10.4")
          (s."@babel/generator@^7.11.5")
          (s."@babel/helper-function-name@^7.10.4")
          (s."@babel/helper-split-export-declaration@^7.11.0")
          (s."@babel/parser@^7.11.5")
          (s."@babel/types@^7.11.5")
          (s."debug@^4.1.0")
          (s."globals@^11.1.0")
          (s."lodash@^4.17.19")
          ];
        "@babel/traverse@^7.10.4" = s."@babel/traverse@7.11.5";
        "@babel/traverse@^7.11.5" = s."@babel/traverse@7.11.5";
        "@babel/types@7.11.5" = f (sc "babel" "types") "7.11.5" (ir "https://registry.yarnpkg.com/@babel/types/-/types-7.11.5.tgz") "d9de577d01252d77c6800cee039ee64faf75662d" [
          (s."@babel/helper-validator-identifier@^7.10.4")
          (s."lodash@^4.17.19")
          (s."to-fast-properties@^2.0.0")
          ];
        "@babel/types@^7.10.4" = s."@babel/types@7.11.5";
        "@babel/types@^7.11.0" = s."@babel/types@7.11.5";
        "@babel/types@^7.11.5" = s."@babel/types@7.11.5";
        "@concordance/react@2.0.0" = f (sc "concordance" "react") "2.0.0" (ir "https://registry.yarnpkg.com/@concordance/react/-/react-2.0.0.tgz") "aef913f27474c53731f4fd79cc2f54897de90fde" [
          (s."arrify@^1.0.1")
          ];
        "@concordance/react@^2.0.0" = s."@concordance/react@2.0.0";
        "@eslint/eslintrc@0.1.3" = f (sc "eslint" "eslintrc") "0.1.3" (ir "https://registry.yarnpkg.com/@eslint/eslintrc/-/eslintrc-0.1.3.tgz") "7d1a2b2358552cc04834c0979bd4275362e37085" [
          (s."ajv@^6.12.4")
          (s."debug@^4.1.1")
          (s."espree@^7.3.0")
          (s."globals@^12.1.0")
          (s."ignore@^4.0.6")
          (s."import-fresh@^3.2.1")
          (s."js-yaml@^3.13.1")
          (s."lodash@^4.17.19")
          (s."minimatch@^3.0.4")
          (s."strip-json-comments@^3.1.1")
          ];
        "@eslint/eslintrc@^0.1.3" = s."@eslint/eslintrc@0.1.3";
        "@istanbuljs/load-nyc-config@1.1.0" = f (sc "istanbuljs" "load-nyc-config") "1.1.0" (ir "https://registry.yarnpkg.com/@istanbuljs/load-nyc-config/-/load-nyc-config-1.1.0.tgz") "fd3db1d59ecf7cf121e80650bb86712f9b55eced" [
          (s."camelcase@^5.3.1")
          (s."find-up@^4.1.0")
          (s."get-package-type@^0.1.0")
          (s."js-yaml@^3.13.1")
          (s."resolve-from@^5.0.0")
          ];
        "@istanbuljs/load-nyc-config@^1.0.0" = s."@istanbuljs/load-nyc-config@1.1.0";
        "@istanbuljs/schema@0.1.2" = f (sc "istanbuljs" "schema") "0.1.2" (ir "https://registry.yarnpkg.com/@istanbuljs/schema/-/schema-0.1.2.tgz") "26520bf09abe4a5644cd5414e37125a8954241dd" [];
        "@istanbuljs/schema@^0.1.2" = s."@istanbuljs/schema@0.1.2";
        "@nodelib/fs.scandir@2.1.3" = f (sc "nodelib" "fs.scandir") "2.1.3" (ir "https://registry.yarnpkg.com/@nodelib/fs.scandir/-/fs.scandir-2.1.3.tgz") "3a582bdb53804c6ba6d146579c46e52130cf4a3b" [
          (s."@nodelib/fs.stat@2.0.3")
          (s."run-parallel@^1.1.9")
          ];
        "@nodelib/fs.stat@2.0.3" = f (sc "nodelib" "fs.stat") "2.0.3" (ir "https://registry.yarnpkg.com/@nodelib/fs.stat/-/fs.stat-2.0.3.tgz") "34dc5f4cabbc720f4e60f75a747e7ecd6c175bd3" [];
        "@nodelib/fs.stat@^2.0.2" = s."@nodelib/fs.stat@2.0.3";
        "@nodelib/fs.walk@1.2.4" = f (sc "nodelib" "fs.walk") "1.2.4" (ir "https://registry.yarnpkg.com/@nodelib/fs.walk/-/fs.walk-1.2.4.tgz") "011b9202a70a6366e436ca5c065844528ab04976" [
          (s."@nodelib/fs.scandir@2.1.3")
          (s."fastq@^1.6.0")
          ];
        "@nodelib/fs.walk@^1.2.3" = s."@nodelib/fs.walk@1.2.4";
        "@sindresorhus/is@0.14.0" = f (sc "sindresorhus" "is") "0.14.0" (ir "https://registry.yarnpkg.com/@sindresorhus/is/-/is-0.14.0.tgz") "9fb3a3cf3132328151f353de4632e01e52102bea" [];
        "@sindresorhus/is@^0.14.0" = s."@sindresorhus/is@0.14.0";
        "@szmarczak/http-timer@1.1.2" = f (sc "szmarczak" "http-timer") "1.1.2" (ir "https://registry.yarnpkg.com/@szmarczak/http-timer/-/http-timer-1.1.2.tgz") "b1665e2c461a2cd92f4c1bbf50d5454de0d4b421" [
          (s."defer-to-connect@^1.0.1")
          ];
        "@szmarczak/http-timer@^1.1.2" = s."@szmarczak/http-timer@1.1.2";
        "@types/normalize-package-data@2.4.0" = f (sc "types" "normalize-package-data") "2.4.0" (ir "https://registry.yarnpkg.com/@types/normalize-package-data/-/normalize-package-data-2.4.0.tgz") "e486d0d97396d79beedd0a6e33f4534ff6b4973e" [];
        "@types/normalize-package-data@^2.4.0" = s."@types/normalize-package-data@2.4.0";
        "acorn-jsx@5.3.1" = f "acorn-jsx" "5.3.1" y "fc8661e11b7ac1539c47dbfea2e72b3af34d267b" [];
        "acorn-jsx@^5.2.0" = s."acorn-jsx@5.3.1";
        "acorn-walk@8.0.0" = f "acorn-walk" "8.0.0" y "56ae4c0f434a45fff4a125e7ea95fa9c98f67a16" [];
        "acorn-walk@^8.0.0" = s."acorn-walk@8.0.0";
        "acorn@7.4.1" = f "acorn" "7.4.1" y "feaed255973d2e77555b83dbc08851a6c63520fa" [];
        "acorn@8.0.4" = f "acorn" "8.0.4" y "7a3ae4191466a6984eee0fe3407a4f3aa9db8354" [];
        "acorn@^7.4.0" = s."acorn@7.4.1";
        "acorn@^8.0.1" = s."acorn@8.0.4";
        "aggregate-error@3.1.0" = f "aggregate-error" "3.1.0" y "92670ff50f5359bdb7a3e0d40d0ec30c5737687a" [
          (s."clean-stack@^2.0.0")
          (s."indent-string@^4.0.0")
          ];
        "aggregate-error@^3.0.0" = s."aggregate-error@3.1.0";
        "ajv@6.12.5" = f "ajv" "6.12.5" y "19b0e8bae8f476e5ba666300387775fb1a00a4da" [
          (s."fast-deep-equal@^3.1.1")
          (s."fast-json-stable-stringify@^2.0.0")
          (s."json-schema-traverse@^0.4.1")
          (s."uri-js@^4.2.2")
          ];
        "ajv@^6.10.0" = s."ajv@6.12.5";
        "ajv@^6.10.2" = s."ajv@6.12.5";
        "ajv@^6.12.3" = s."ajv@6.12.5";
        "ajv@^6.12.4" = s."ajv@6.12.5";
        "ansi-align@3.0.0" = f "ansi-align" "3.0.0" y "b536b371cf687caaef236c18d3e21fe3797467cb" [
          (s."string-width@^3.0.0")
          ];
        "ansi-align@^3.0.0" = s."ansi-align@3.0.0";
        "ansi-colors@4.1.1" = f "ansi-colors" "4.1.1" y "cbb9ae256bf750af1eab344f229aa27fe94ba348" [];
        "ansi-colors@^4.1.1" = s."ansi-colors@4.1.1";
        "ansi-regex@3.0.0" = f "ansi-regex" "3.0.0" y "ed0317c322064f79466c02966bddb605ab37d998" [];
        "ansi-regex@4.1.0" = f "ansi-regex" "4.1.0" y "8b9f8f08cf1acb843756a839ca8c7e3168c51997" [];
        "ansi-regex@5.0.0" = f "ansi-regex" "5.0.0" y "388539f55179bf39339c81af30a654d69f87cb75" [];
        "ansi-regex@^3.0.0" = s."ansi-regex@3.0.0";
        "ansi-regex@^4.1.0" = s."ansi-regex@4.1.0";
        "ansi-regex@^5.0.0" = s."ansi-regex@5.0.0";
        "ansi-styles@3.2.1" = f "ansi-styles" "3.2.1" y "41fbb20243e50b12be0f04b8dedbf07520ce841d" [
          (s."color-convert@^1.9.0")
          ];
        "ansi-styles@4.3.0" = f "ansi-styles" "4.3.0" y "edd803628ae71c04c85ae7a0906edad34b648937" [
          (s."color-convert@^2.0.1")
          ];
        "ansi-styles@^3.2.0" = s."ansi-styles@3.2.1";
        "ansi-styles@^3.2.1" = s."ansi-styles@3.2.1";
        "ansi-styles@^4.0.0" = s."ansi-styles@4.3.0";
        "ansi-styles@^4.1.0" = s."ansi-styles@4.3.0";
        "ansi-styles@^4.2.1" = s."ansi-styles@4.3.0";
        "anymatch@3.1.1" = f "anymatch" "3.1.1" y "c55ecf02185e2469259399310c173ce31233b142" [
          (s."normalize-path@^3.0.0")
          (s."picomatch@^2.0.4")
          ];
        "anymatch@~3.1.1" = s."anymatch@3.1.1";
        "append-transform@2.0.0" = f "append-transform" "2.0.0" y "99d9d29c7b38391e6f428d28ce136551f0b77e12" [
          (s."default-require-extensions@^3.0.0")
          ];
        "append-transform@^2.0.0" = s."append-transform@2.0.0";
        "archy@1.0.0" = f "archy" "1.0.0" y "f9c8c13757cc1dd7bc379ac77b2c62a5c2868c40" [];
        "archy@^1.0.0" = s."archy@1.0.0";
        "argparse@1.0.10" = f "argparse" "1.0.10" y "bcd6791ea5ae09725e17e5ad988134cd40b3d911" [
          (s."sprintf-js@~1.0.2")
          ];
        "argparse@^1.0.7" = s."argparse@1.0.10";
        "array-find-index@1.0.2" = f "array-find-index" "1.0.2" y "df010aa1287e164bbda6f9723b0a96a1ec4187a1" [];
        "array-find-index@^1.0.1" = s."array-find-index@1.0.2";
        "array-union@2.1.0" = f "array-union" "2.1.0" y "b798420adbeb1de828d84acd8a2e23d3efe85e8d" [];
        "array-union@^2.1.0" = s."array-union@2.1.0";
        "arrgv@1.0.2" = f "arrgv" "1.0.2" y "025ed55a6a433cad9b604f8112fc4292715a6ec0" [];
        "arrgv@^1.0.2" = s."arrgv@1.0.2";
        "arrify@1.0.1" = f "arrify" "1.0.1" y "898508da2226f380df904728456849c1501a4b0d" [];
        "arrify@2.0.1" = f "arrify" "2.0.1" y "c9655e9331e0abcd588d2a7cad7e9956f66701fa" [];
        "arrify@^1.0.1" = s."arrify@1.0.1";
        "arrify@^2.0.1" = s."arrify@2.0.1";
        "asn1@0.2.4" = f "asn1" "0.2.4" y "8d2475dfab553bb33e77b54e59e880bb8ce23136" [
          (s."safer-buffer@~2.1.0")
          ];
        "asn1@~0.2.3" = s."asn1@0.2.4";
        "assert-plus@1.0.0" = f "assert-plus" "1.0.0" y "f12e0f3c5d77b0b1cdd9146942e4e96c1e4dd525" [];
        "assert-plus@^1.0.0" = s."assert-plus@1.0.0";
        "astral-regex@1.0.0" = f "astral-regex" "1.0.0" y "6c8c3fb827dd43ee3918f27b82782ab7658a6fd9" [];
        "astral-regex@2.0.0" = f "astral-regex" "2.0.0" y "483143c567aeed4785759c0865786dc77d7d2e31" [];
        "astral-regex@^1.0.0" = s."astral-regex@1.0.0";
        "astral-regex@^2.0.0" = s."astral-regex@2.0.0";
        "asynckit@0.4.0" = f "asynckit" "0.4.0" y "c79ed97f7f34cb8f2ba1bc9790bcc366474b4b79" [];
        "asynckit@^0.4.0" = s."asynckit@0.4.0";
        "at-least-node@1.0.0" = f "at-least-node" "1.0.0" y "602cd4b46e844ad4effc92a8011a3c46e0238dc2" [];
        "at-least-node@^1.0.0" = s."at-least-node@1.0.0";
        "ava@3.13.0" = f "ava" "3.13.0" y "df789d71ace66db99b213395338288d6d4322690" [
          (s."@concordance/react@^2.0.0")
          (s."acorn@^8.0.1")
          (s."acorn-walk@^8.0.0")
          (s."ansi-styles@^4.2.1")
          (s."arrgv@^1.0.2")
          (s."arrify@^2.0.1")
          (s."callsites@^3.1.0")
          (s."chalk@^4.1.0")
          (s."chokidar@^3.4.2")
          (s."chunkd@^2.0.1")
          (s."ci-info@^2.0.0")
          (s."ci-parallel-vars@^1.0.1")
          (s."clean-yaml-object@^0.1.0")
          (s."cli-cursor@^3.1.0")
          (s."cli-truncate@^2.1.0")
          (s."code-excerpt@^3.0.0")
          (s."common-path-prefix@^3.0.0")
          (s."concordance@^5.0.1")
          (s."convert-source-map@^1.7.0")
          (s."currently-unhandled@^0.4.1")
          (s."debug@^4.2.0")
          (s."del@^6.0.0")
          (s."emittery@^0.7.1")
          (s."equal-length@^1.0.0")
          (s."figures@^3.2.0")
          (s."globby@^11.0.1")
          (s."ignore-by-default@^2.0.0")
          (s."import-local@^3.0.2")
          (s."indent-string@^4.0.0")
          (s."is-error@^2.2.2")
          (s."is-plain-object@^5.0.0")
          (s."is-promise@^4.0.0")
          (s."lodash@^4.17.20")
          (s."matcher@^3.0.0")
          (s."md5-hex@^3.0.1")
          (s."mem@^6.1.1")
          (s."ms@^2.1.2")
          (s."ora@^5.1.0")
          (s."p-event@^4.2.0")
          (s."p-map@^4.0.0")
          (s."picomatch@^2.2.2")
          (s."pkg-conf@^3.1.0")
          (s."plur@^4.0.0")
          (s."pretty-ms@^7.0.1")
          (s."read-pkg@^5.2.0")
          (s."resolve-cwd@^3.0.0")
          (s."slash@^3.0.0")
          (s."source-map-support@^0.5.19")
          (s."stack-utils@^2.0.2")
          (s."strip-ansi@^6.0.0")
          (s."supertap@^1.0.0")
          (s."temp-dir@^2.0.0")
          (s."trim-off-newlines@^1.0.1")
          (s."update-notifier@^4.1.1")
          (s."write-file-atomic@^3.0.3")
          (s."yargs@^16.0.3")
          ];
        "ava@^3.1.0" = s."ava@3.13.0";
        "aws-sign2@0.7.0" = f "aws-sign2" "0.7.0" y "b46e890934a9591f2d2f6f86d7e6a9f1b3fe76a8" [];
        "aws-sign2@~0.7.0" = s."aws-sign2@0.7.0";
        "aws4@1.10.1" = f "aws4" "1.10.1" y "e1e82e4f3e999e2cfd61b161280d16a111f86428" [];
        "aws4@^1.8.0" = s."aws4@1.10.1";
        "balanced-match@1.0.0" = f "balanced-match" "1.0.0" y "89b4d199ab2bee49de164ea02b89ce462d71b767" [];
        "balanced-match@^1.0.0" = s."balanced-match@1.0.0";
        "bcrypt-pbkdf@1.0.2" = f "bcrypt-pbkdf" "1.0.2" y "a4301d389b6a43f9b67ff3ca11a3f6637e360e9e" [
          (s."tweetnacl@^0.14.3")
          ];
        "bcrypt-pbkdf@^1.0.0" = s."bcrypt-pbkdf@1.0.2";
        "binary-extensions@2.1.0" = f "binary-extensions" "2.1.0" y "30fa40c9e7fe07dbc895678cd287024dea241dd9" [];
        "binary-extensions@^2.0.0" = s."binary-extensions@2.1.0";
        "blueimp-md5@2.18.0" = f "blueimp-md5" "2.18.0" y "1152be1335f0c6b3911ed9e36db54f3e6ac52935" [];
        "blueimp-md5@^2.10.0" = s."blueimp-md5@2.18.0";
        "boxen@4.2.0" = f "boxen" "4.2.0" y "e411b62357d6d6d36587c8ac3d5d974daa070e64" [
          (s."ansi-align@^3.0.0")
          (s."camelcase@^5.3.1")
          (s."chalk@^3.0.0")
          (s."cli-boxes@^2.2.0")
          (s."string-width@^4.1.0")
          (s."term-size@^2.1.0")
          (s."type-fest@^0.8.1")
          (s."widest-line@^3.1.0")
          ];
        "boxen@^4.2.0" = s."boxen@4.2.0";
        "brace-expansion@1.1.11" = f "brace-expansion" "1.1.11" y "3c7fcbf529d87226f3d2f52b966ff5271eb441dd" [
          (s."balanced-match@^1.0.0")
          (s."concat-map@0.0.1")
          ];
        "brace-expansion@^1.1.7" = s."brace-expansion@1.1.11";
        "braces@3.0.2" = f "braces" "3.0.2" y "3454e1a462ee8d599e236df336cd9ea4f8afe107" [
          (s."fill-range@^7.0.1")
          ];
        "braces@^3.0.1" = s."braces@3.0.2";
        "braces@~3.0.2" = s."braces@3.0.2";
        "buffer-from@1.1.1" = f "buffer-from" "1.1.1" y "32713bc028f75c02fdb710d7c7bcec1f2c6070ef" [];
        "buffer-from@^1.0.0" = s."buffer-from@1.1.1";
        "cacheable-request@6.1.0" = f "cacheable-request" "6.1.0" y "20ffb8bd162ba4be11e9567d823db651052ca912" [
          (s."clone-response@^1.0.2")
          (s."get-stream@^5.1.0")
          (s."http-cache-semantics@^4.0.0")
          (s."keyv@^3.0.0")
          (s."lowercase-keys@^2.0.0")
          (s."normalize-url@^4.1.0")
          (s."responselike@^1.0.2")
          ];
        "cacheable-request@^6.0.0" = s."cacheable-request@6.1.0";
        "caching-transform@4.0.0" = f "caching-transform" "4.0.0" y "00d297a4206d71e2163c39eaffa8157ac0651f0f" [
          (s."hasha@^5.0.0")
          (s."make-dir@^3.0.0")
          (s."package-hash@^4.0.0")
          (s."write-file-atomic@^3.0.0")
          ];
        "caching-transform@^4.0.0" = s."caching-transform@4.0.0";
        "caller-callsite@2.0.0" = f "caller-callsite" "2.0.0" y "847e0fce0a223750a9a027c54b33731ad3154134" [
          (s."callsites@^2.0.0")
          ];
        "caller-callsite@^2.0.0" = s."caller-callsite@2.0.0";
        "caller-path@2.0.0" = f "caller-path" "2.0.0" y "468f83044e369ab2010fac5f06ceee15bb2cb1f4" [
          (s."caller-callsite@^2.0.0")
          ];
        "caller-path@^2.0.0" = s."caller-path@2.0.0";
        "callsites@2.0.0" = f "callsites" "2.0.0" y "06eb84f00eea413da86affefacbffb36093b3c50" [];
        "callsites@3.1.0" = f "callsites" "3.1.0" y "b3630abd8943432f54b3f0519238e33cd7df2f73" [];
        "callsites@^2.0.0" = s."callsites@2.0.0";
        "callsites@^3.0.0" = s."callsites@3.1.0";
        "callsites@^3.1.0" = s."callsites@3.1.0";
        "camelcase@5.3.1" = f "camelcase" "5.3.1" y "e3c9b31569e106811df242f715725a1f4c494320" [];
        "camelcase@^5.0.0" = s."camelcase@5.3.1";
        "camelcase@^5.3.1" = s."camelcase@5.3.1";
        "caseless@0.12.0" = f "caseless" "0.12.0" y "1b681c21ff84033c826543090689420d187151dc" [];
        "caseless@~0.12.0" = s."caseless@0.12.0";
        "chalk@2.4.2" = f "chalk" "2.4.2" y "cd42541677a54333cf541a49108c1432b44c9424" [
          (s."ansi-styles@^3.2.1")
          (s."escape-string-regexp@^1.0.5")
          (s."supports-color@^5.3.0")
          ];
        "chalk@3.0.0" = f "chalk" "3.0.0" y "3f73c2bf526591f574cc492c51e2456349f844e4" [
          (s."ansi-styles@^4.1.0")
          (s."supports-color@^7.1.0")
          ];
        "chalk@4.1.0" = f "chalk" "4.1.0" y "4e14870a618d9e2edd97dd8345fd9d9dc315646a" [
          (s."ansi-styles@^4.1.0")
          (s."supports-color@^7.1.0")
          ];
        "chalk@^2.0.0" = s."chalk@2.4.2";
        "chalk@^2.4.2" = s."chalk@2.4.2";
        "chalk@^3.0.0" = s."chalk@3.0.0";
        "chalk@^4.0.0" = s."chalk@4.1.0";
        "chalk@^4.1.0" = s."chalk@4.1.0";
        "chokidar@3.4.2" = f "chokidar" "3.4.2" y "38dc8e658dec3809741eb3ef7bb0a47fe424232d" [
          (s."anymatch@~3.1.1")
          (s."braces@~3.0.2")
          (s."glob-parent@~5.1.0")
          (s."is-binary-path@~2.1.0")
          (s."is-glob@~4.0.1")
          (s."normalize-path@~3.0.0")
          (s."readdirp@~3.4.0")
          (s."fsevents@~2.1.2")
          ];
        "chokidar@^3.3.0" = s."chokidar@3.4.2";
        "chokidar@^3.4.2" = s."chokidar@3.4.2";
        "chunkd@2.0.1" = f "chunkd" "2.0.1" y "49cd1d7b06992dc4f7fccd962fe2a101ee7da920" [];
        "chunkd@^2.0.1" = s."chunkd@2.0.1";
        "ci-info@2.0.0" = f "ci-info" "2.0.0" y "67a9e964be31a51e15e5010d58e6f12834002f46" [];
        "ci-info@^2.0.0" = s."ci-info@2.0.0";
        "ci-parallel-vars@1.0.1" = f "ci-parallel-vars" "1.0.1" y "e87ff0625ccf9d286985b29b4ada8485ca9ffbc2" [];
        "ci-parallel-vars@^1.0.1" = s."ci-parallel-vars@1.0.1";
        "clean-stack@2.2.0" = f "clean-stack" "2.2.0" y "ee8472dbb129e727b31e8a10a427dee9dfe4008b" [];
        "clean-stack@^2.0.0" = s."clean-stack@2.2.0";
        "clean-yaml-object@0.1.0" = f "clean-yaml-object" "0.1.0" y "63fb110dc2ce1a84dc21f6d9334876d010ae8b68" [];
        "clean-yaml-object@^0.1.0" = s."clean-yaml-object@0.1.0";
        "cli-boxes@2.2.1" = f "cli-boxes" "2.2.1" y "ddd5035d25094fce220e9cab40a45840a440318f" [];
        "cli-boxes@^2.2.0" = s."cli-boxes@2.2.1";
        "cli-cursor@3.1.0" = f "cli-cursor" "3.1.0" y "264305a7ae490d1d03bf0c9ba7c925d1753af307" [
          (s."restore-cursor@^3.1.0")
          ];
        "cli-cursor@^3.1.0" = s."cli-cursor@3.1.0";
        "cli-spinners@2.4.0" = f "cli-spinners" "2.4.0" y "c6256db216b878cfba4720e719cec7cf72685d7f" [];
        "cli-spinners@^2.4.0" = s."cli-spinners@2.4.0";
        "cli-truncate@2.1.0" = f "cli-truncate" "2.1.0" y "c39e28bf05edcde5be3b98992a22deed5a2b93c7" [
          (s."slice-ansi@^3.0.0")
          (s."string-width@^4.2.0")
          ];
        "cli-truncate@^2.1.0" = s."cli-truncate@2.1.0";
        "cliui@6.0.0" = f "cliui" "6.0.0" y "511d702c0c4e41ca156d7d0e96021f23e13225b1" [
          (s."string-width@^4.2.0")
          (s."strip-ansi@^6.0.0")
          (s."wrap-ansi@^6.2.0")
          ];
        "cliui@7.0.1" = f "cliui" "7.0.1" y "a4cb67aad45cd83d8d05128fc9f4d8fbb887e6b3" [
          (s."string-width@^4.2.0")
          (s."strip-ansi@^6.0.0")
          (s."wrap-ansi@^7.0.0")
          ];
        "cliui@^6.0.0" = s."cliui@6.0.0";
        "cliui@^7.0.0" = s."cliui@7.0.1";
        "clone-response@1.0.2" = f "clone-response" "1.0.2" y "d1dc973920314df67fbeb94223b4ee350239e96b" [
          (s."mimic-response@^1.0.0")
          ];
        "clone-response@^1.0.2" = s."clone-response@1.0.2";
        "clone@1.0.4" = f "clone" "1.0.4" y "da309cc263df15994c688ca902179ca3c7cd7c7e" [];
        "clone@^1.0.2" = s."clone@1.0.4";
        "code-excerpt@3.0.0" = f "code-excerpt" "3.0.0" y "fcfb6748c03dba8431c19f5474747fad3f250f10" [
          (s."convert-to-spaces@^1.0.1")
          ];
        "code-excerpt@^3.0.0" = s."code-excerpt@3.0.0";
        "color-convert@1.9.3" = f "color-convert" "1.9.3" y "bb71850690e1f136567de629d2d5471deda4c1e8" [
          (s."color-name@1.1.3")
          ];
        "color-convert@2.0.1" = f "color-convert" "2.0.1" y "72d3a68d598c9bdb3af2ad1e84f21d896abd4de3" [
          (s."color-name@~1.1.4")
          ];
        "color-convert@^1.9.0" = s."color-convert@1.9.3";
        "color-convert@^2.0.1" = s."color-convert@2.0.1";
        "color-name@1.1.3" = f "color-name" "1.1.3" y "a7d0558bd89c42f795dd42328f740831ca53bc25" [];
        "color-name@1.1.4" = f "color-name" "1.1.4" y "c2a09a87acbde69543de6f63fa3995c826c536a2" [];
        "color-name@~1.1.4" = s."color-name@1.1.4";
        "colorette@1.2.1" = f "colorette" "1.2.1" y "4d0b921325c14faf92633086a536db6e89564b1b" [];
        "colorette@^1.2.1" = s."colorette@1.2.1";
        "combined-stream@1.0.8" = f "combined-stream" "1.0.8" y "c3d45a8b34fd730631a110a8a2520682b31d5a7f" [
          (s."delayed-stream@~1.0.0")
          ];
        "combined-stream@^1.0.6" = s."combined-stream@1.0.8";
        "combined-stream@~1.0.6" = s."combined-stream@1.0.8";
        "common-path-prefix@3.0.0" = f "common-path-prefix" "3.0.0" y "7d007a7e07c58c4b4d5f433131a19141b29f11e0" [];
        "common-path-prefix@^3.0.0" = s."common-path-prefix@3.0.0";
        "commondir@1.0.1" = f "commondir" "1.0.1" y "ddd800da0c66127393cca5950ea968a3aaf1253b" [];
        "commondir@^1.0.1" = s."commondir@1.0.1";
        "concat-map@0.0.1" = f "concat-map" "0.0.1" y "d8a96bd77fd68df7793a73036a3ba0d5405d477b" [];
        "concordance@5.0.1" = f "concordance" "5.0.1" y "7a248aca8b286125d1d76f77b03320acf3f4ac63" [
          (s."date-time@^3.1.0")
          (s."esutils@^2.0.3")
          (s."fast-diff@^1.2.0")
          (s."js-string-escape@^1.0.1")
          (s."lodash@^4.17.15")
          (s."md5-hex@^3.0.1")
          (s."semver@^7.3.2")
          (s."well-known-symbols@^2.0.0")
          ];
        "concordance@^5.0.1" = s."concordance@5.0.1";
        "configstore@5.0.1" = f "configstore" "5.0.1" y "d365021b5df4b98cdd187d6a3b0e3f6a7cc5ed96" [
          (s."dot-prop@^5.2.0")
          (s."graceful-fs@^4.1.2")
          (s."make-dir@^3.0.0")
          (s."unique-string@^2.0.0")
          (s."write-file-atomic@^3.0.0")
          (s."xdg-basedir@^4.0.0")
          ];
        "configstore@^5.0.1" = s."configstore@5.0.1";
        "convert-source-map@1.7.0" = f "convert-source-map" "1.7.0" y "17a2cb882d7f77d3490585e2ce6c524424a3a442" [
          (s."safe-buffer@~5.1.1")
          ];
        "convert-source-map@^1.7.0" = s."convert-source-map@1.7.0";
        "convert-to-spaces@1.0.2" = f "convert-to-spaces" "1.0.2" y "7e3e48bbe6d997b1417ddca2868204b4d3d85715" [];
        "convert-to-spaces@^1.0.1" = s."convert-to-spaces@1.0.2";
        "core-util-is@1.0.2" = f "core-util-is" "1.0.2" y "b5fd54220aa2bc5ab57aab7140c940754503c1a7" [];
        "cosmiconfig@5.2.1" = f "cosmiconfig" "5.2.1" y "040f726809c591e77a17c0a3626ca45b4f168b1a" [
          (s."import-fresh@^2.0.0")
          (s."is-directory@^0.3.1")
          (s."js-yaml@^3.13.1")
          (s."parse-json@^4.0.0")
          ];
        "cosmiconfig@^5.0.0" = s."cosmiconfig@5.2.1";
        "coveralls@3.1.0" = f "coveralls" "3.1.0" y "13c754d5e7a2dd8b44fe5269e21ca394fb4d615b" [
          (s."js-yaml@^3.13.1")
          (s."lcov-parse@^1.0.0")
          (s."log-driver@^1.2.7")
          (s."minimist@^1.2.5")
          (s."request@^2.88.2")
          ];
        "coveralls@^3.0.0" = s."coveralls@3.1.0";
        "cross-spawn@7.0.3" = f "cross-spawn" "7.0.3" y "f73a85b9d5d41d045551c177e2882d4ac85728a6" [
          (s."path-key@^3.1.0")
          (s."shebang-command@^2.0.0")
          (s."which@^2.0.1")
          ];
        "cross-spawn@^7.0.0" = s."cross-spawn@7.0.3";
        "cross-spawn@^7.0.2" = s."cross-spawn@7.0.3";
        "crypto-random-string@2.0.0" = f "crypto-random-string" "2.0.0" y "ef2a7a966ec11083388369baa02ebead229b30d5" [];
        "crypto-random-string@^2.0.0" = s."crypto-random-string@2.0.0";
        "currently-unhandled@0.4.1" = f "currently-unhandled" "0.4.1" y "988df33feab191ef799a61369dd76c17adf957ea" [
          (s."array-find-index@^1.0.1")
          ];
        "currently-unhandled@^0.4.1" = s."currently-unhandled@0.4.1";
        "dashdash@1.14.1" = f "dashdash" "1.14.1" y "853cfa0f7cbe2fed5de20326b8dd581035f6e2f0" [
          (s."assert-plus@^1.0.0")
          ];
        "dashdash@^1.12.0" = s."dashdash@1.14.1";
        "date-time@3.1.0" = f "date-time" "3.1.0" y "0d1e934d170579f481ed8df1e2b8ff70ee845e1e" [
          (s."time-zone@^1.0.0")
          ];
        "date-time@^3.1.0" = s."date-time@3.1.0";
        "debug@4.2.0" = f "debug" "4.2.0" y "7f150f93920e94c58f5574c2fd01a3110effe7f1" [
          (s."ms@2.1.2")
          ];
        "debug@^4.0.1" = s."debug@4.2.0";
        "debug@^4.1.0" = s."debug@4.2.0";
        "debug@^4.1.1" = s."debug@4.2.0";
        "debug@^4.2.0" = s."debug@4.2.0";
        "decamelize@1.2.0" = f "decamelize" "1.2.0" y "f6534d15148269b20352e7bee26f501f9a191290" [];
        "decamelize@^1.2.0" = s."decamelize@1.2.0";
        "decompress-response@3.3.0" = f "decompress-response" "3.3.0" y "80a4dd323748384bfa248083622aedec982adff3" [
          (s."mimic-response@^1.0.0")
          ];
        "decompress-response@^3.3.0" = s."decompress-response@3.3.0";
        "deep-extend@0.6.0" = f "deep-extend" "0.6.0" y "c4fa7c95404a17a9c3e8ca7e1537312b736330ac" [];
        "deep-extend@^0.6.0" = s."deep-extend@0.6.0";
        "deep-is@0.1.3" = f "deep-is" "0.1.3" y "b369d6fb5dbc13eecf524f91b070feedc357cf34" [];
        "deep-is@^0.1.3" = s."deep-is@0.1.3";
        "default-require-extensions@3.0.0" = f "default-require-extensions" "3.0.0" y "e03f93aac9b2b6443fc52e5e4a37b3ad9ad8df96" [
          (s."strip-bom@^4.0.0")
          ];
        "default-require-extensions@^3.0.0" = s."default-require-extensions@3.0.0";
        "defaults@1.0.3" = f "defaults" "1.0.3" y "c656051e9817d9ff08ed881477f3fe4019f3ef7d" [
          (s."clone@^1.0.2")
          ];
        "defaults@^1.0.3" = s."defaults@1.0.3";
        "defer-to-connect@1.1.3" = f "defer-to-connect" "1.1.3" y "331ae050c08dcf789f8c83a7b81f0ed94f4ac591" [];
        "defer-to-connect@^1.0.1" = s."defer-to-connect@1.1.3";
        "del@6.0.0" = f "del" "6.0.0" y "0b40d0332cea743f1614f818be4feb717714c952" [
          (s."globby@^11.0.1")
          (s."graceful-fs@^4.2.4")
          (s."is-glob@^4.0.1")
          (s."is-path-cwd@^2.2.0")
          (s."is-path-inside@^3.0.2")
          (s."p-map@^4.0.0")
          (s."rimraf@^3.0.2")
          (s."slash@^3.0.0")
          ];
        "del@^6.0.0" = s."del@6.0.0";
        "delayed-stream@1.0.0" = f "delayed-stream" "1.0.0" y "df3ae199acadfb7d440aaae0b29e2272b24ec619" [];
        "delayed-stream@~1.0.0" = s."delayed-stream@1.0.0";
        "dependency-graph@0.9.0" = f "dependency-graph" "0.9.0" y "11aed7e203bc8b00f48356d92db27b265c445318" [];
        "dependency-graph@^0.9.0" = s."dependency-graph@0.9.0";
        "dir-glob@3.0.1" = f "dir-glob" "3.0.1" y "56dbf73d992a4a93ba1584f4534063fd2e41717f" [
          (s."path-type@^4.0.0")
          ];
        "dir-glob@^3.0.1" = s."dir-glob@3.0.1";
        "doctrine@3.0.0" = f "doctrine" "3.0.0" y "addebead72a6574db783639dc87a121773973961" [
          (s."esutils@^2.0.2")
          ];
        "doctrine@^3.0.0" = s."doctrine@3.0.0";
        "dot-prop@5.3.0" = f "dot-prop" "5.3.0" y "90ccce708cd9cd82cc4dc8c3ddd9abdd55b20e88" [
          (s."is-obj@^2.0.0")
          ];
        "dot-prop@^5.2.0" = s."dot-prop@5.3.0";
        "duplexer3@0.1.4" = f "duplexer3" "0.1.4" y "ee01dd1cac0ed3cbc7fdbea37dc0a8f1ce002ce2" [];
        "duplexer3@^0.1.4" = s."duplexer3@0.1.4";
        "ecc-jsbn@0.1.2" = f "ecc-jsbn" "0.1.2" y "3a83a904e54353287874c564b7549386849a98c9" [
          (s."jsbn@~0.1.0")
          (s."safer-buffer@^2.1.0")
          ];
        "ecc-jsbn@~0.1.1" = s."ecc-jsbn@0.1.2";
        "emittery@0.7.1" = f "emittery" "0.7.1" y "c02375a927a40948c0345cc903072597f5270451" [];
        "emittery@^0.7.1" = s."emittery@0.7.1";
        "emoji-regex@7.0.3" = f "emoji-regex" "7.0.3" y "933a04052860c85e83c122479c4748a8e4c72156" [];
        "emoji-regex@8.0.0" = f "emoji-regex" "8.0.0" y "e818fd69ce5ccfcb404594f842963bf53164cc37" [];
        "emoji-regex@^7.0.1" = s."emoji-regex@7.0.3";
        "emoji-regex@^8.0.0" = s."emoji-regex@8.0.0";
        "end-of-stream@1.4.4" = f "end-of-stream" "1.4.4" y "5ae64a5f45057baf3626ec14da0ca5e4b2431eb0" [
          (s."once@^1.4.0")
          ];
        "end-of-stream@^1.1.0" = s."end-of-stream@1.4.4";
        "enquirer@2.3.6" = f "enquirer" "2.3.6" y "2a7fe5dd634a1e4125a975ec994ff5456dc3734d" [
          (s."ansi-colors@^4.1.1")
          ];
        "enquirer@^2.3.5" = s."enquirer@2.3.6";
        "equal-length@1.0.1" = f "equal-length" "1.0.1" y "21ca112d48ab24b4e1e7ffc0e5339d31fdfc274c" [];
        "equal-length@^1.0.0" = s."equal-length@1.0.1";
        "error-ex@1.3.2" = f "error-ex" "1.3.2" y "b4ac40648107fdcdcfae242f428bea8a14d4f1bf" [
          (s."is-arrayish@^0.2.1")
          ];
        "error-ex@^1.3.1" = s."error-ex@1.3.2";
        "es6-error@4.1.1" = f "es6-error" "4.1.1" y "9e3af407459deed47e9a91f9b885a84eb05c561d" [];
        "es6-error@^4.0.1" = s."es6-error@4.1.1";
        "escalade@3.1.0" = f "escalade" "3.1.0" y "e8e2d7c7a8b76f6ee64c2181d6b8151441602d4e" [];
        "escalade@^3.0.2" = s."escalade@3.1.0";
        "escape-goat@2.1.1" = f "escape-goat" "2.1.1" y "1b2dc77003676c457ec760b2dc68edb648188675" [];
        "escape-goat@^2.0.0" = s."escape-goat@2.1.1";
        "escape-string-regexp@1.0.5" = f "escape-string-regexp" "1.0.5" y "1b61c0562190a8dff6ae3bb2cf0200ca130b86d4" [];
        "escape-string-regexp@2.0.0" = f "escape-string-regexp" "2.0.0" y "a30304e99daa32e23b2fd20f51babd07cffca344" [];
        "escape-string-regexp@4.0.0" = f "escape-string-regexp" "4.0.0" y "14ba83a5d373e3d311e5afca29cf5bfad965bf34" [];
        "escape-string-regexp@^1.0.5" = s."escape-string-regexp@1.0.5";
        "escape-string-regexp@^2.0.0" = s."escape-string-regexp@2.0.0";
        "escape-string-regexp@^4.0.0" = s."escape-string-regexp@4.0.0";
        "eslint-config-problems@5.0.0" = f "eslint-config-problems" "5.0.0" y "5dda1c5413ffe14d0d402af992452bbbd08d98f6" [];
        "eslint-scope@5.1.1" = f "eslint-scope" "5.1.1" y "e786e59a66cb92b3f6c1fb0d508aab174848f48c" [
          (s."esrecurse@^4.3.0")
          (s."estraverse@^4.1.1")
          ];
        "eslint-scope@^5.1.1" = s."eslint-scope@5.1.1";
        "eslint-utils@2.1.0" = f "eslint-utils" "2.1.0" y "d2de5e03424e707dc10c74068ddedae708741b27" [
          (s."eslint-visitor-keys@^1.1.0")
          ];
        "eslint-utils@^2.1.0" = s."eslint-utils@2.1.0";
        "eslint-visitor-keys@1.3.0" = f "eslint-visitor-keys" "1.3.0" y "30ebd1ef7c2fdff01c3a4f151044af25fab0523e" [];
        "eslint-visitor-keys@^1.1.0" = s."eslint-visitor-keys@1.3.0";
        "eslint-visitor-keys@^1.3.0" = s."eslint-visitor-keys@1.3.0";
        "eslint@7.10.0" = f "eslint" "7.10.0" y "494edb3e4750fb791133ca379e786a8f648c72b9" [
          (s."@babel/code-frame@^7.0.0")
          (s."@eslint/eslintrc@^0.1.3")
          (s."ajv@^6.10.0")
          (s."chalk@^4.0.0")
          (s."cross-spawn@^7.0.2")
          (s."debug@^4.0.1")
          (s."doctrine@^3.0.0")
          (s."enquirer@^2.3.5")
          (s."eslint-scope@^5.1.1")
          (s."eslint-utils@^2.1.0")
          (s."eslint-visitor-keys@^1.3.0")
          (s."espree@^7.3.0")
          (s."esquery@^1.2.0")
          (s."esutils@^2.0.2")
          (s."file-entry-cache@^5.0.1")
          (s."functional-red-black-tree@^1.0.1")
          (s."glob-parent@^5.0.0")
          (s."globals@^12.1.0")
          (s."ignore@^4.0.6")
          (s."import-fresh@^3.0.0")
          (s."imurmurhash@^0.1.4")
          (s."is-glob@^4.0.0")
          (s."js-yaml@^3.13.1")
          (s."json-stable-stringify-without-jsonify@^1.0.1")
          (s."levn@^0.4.1")
          (s."lodash@^4.17.19")
          (s."minimatch@^3.0.4")
          (s."natural-compare@^1.4.0")
          (s."optionator@^0.9.1")
          (s."progress@^2.0.0")
          (s."regexpp@^3.1.0")
          (s."semver@^7.2.1")
          (s."strip-ansi@^6.0.0")
          (s."strip-json-comments@^3.1.0")
          (s."table@^5.2.3")
          (s."text-table@^0.2.0")
          (s."v8-compile-cache@^2.0.3")
          ];
        "eslint@^7.8.0" = s."eslint@7.10.0";
        "espree@7.3.0" = f "espree" "7.3.0" y "dc30437cf67947cf576121ebd780f15eeac72348" [
          (s."acorn@^7.4.0")
          (s."acorn-jsx@^5.2.0")
          (s."eslint-visitor-keys@^1.3.0")
          ];
        "espree@^7.3.0" = s."espree@7.3.0";
        "esprima@4.0.1" = f "esprima" "4.0.1" y "13b04cdb3e6c5d19df91ab6987a8695619b0aa71" [];
        "esprima@^4.0.0" = s."esprima@4.0.1";
        "esquery@1.3.1" = f "esquery" "1.3.1" y "b78b5828aa8e214e29fb74c4d5b752e1c033da57" [
          (s."estraverse@^5.1.0")
          ];
        "esquery@^1.2.0" = s."esquery@1.3.1";
        "esrecurse@4.3.0" = f "esrecurse" "4.3.0" y "7ad7964d679abb28bee72cec63758b1c5d2c9921" [
          (s."estraverse@^5.2.0")
          ];
        "esrecurse@^4.3.0" = s."esrecurse@4.3.0";
        "estraverse@4.3.0" = f "estraverse" "4.3.0" y "398ad3f3c5a24948be7725e83d11a7de28cdbd1d" [];
        "estraverse@5.2.0" = f "estraverse" "5.2.0" y "307df42547e6cc7324d3cf03c155d5cdb8c53880" [];
        "estraverse@^4.1.1" = s."estraverse@4.3.0";
        "estraverse@^5.1.0" = s."estraverse@5.2.0";
        "estraverse@^5.2.0" = s."estraverse@5.2.0";
        "esutils@2.0.3" = f "esutils" "2.0.3" y "74d2eb4de0b8da1293711910d50775b9b710ef64" [];
        "esutils@^2.0.2" = s."esutils@2.0.3";
        "esutils@^2.0.3" = s."esutils@2.0.3";
        "extend@3.0.2" = f "extend" "3.0.2" y "f8b1136b4071fbd8eb140aff858b1019ec2915fa" [];
        "extend@~3.0.2" = s."extend@3.0.2";
        "extsprintf@1.3.0" = f "extsprintf" "1.3.0" y "96918440e3041a7a414f8c52e3c574eb3c3e1e05" [];
        "extsprintf@1.4.0" = f "extsprintf" "1.4.0" y "e2689f8f356fad62cca65a3a91c5df5f9551692f" [];
        "extsprintf@^1.2.0" = s."extsprintf@1.4.0";
        "fast-deep-equal@3.1.3" = f "fast-deep-equal" "3.1.3" y "3a7d56b559d6cbc3eb512325244e619a65c6c525" [];
        "fast-deep-equal@^3.1.1" = s."fast-deep-equal@3.1.3";
        "fast-diff@1.2.0" = f "fast-diff" "1.2.0" y "73ee11982d86caaf7959828d519cfe927fac5f03" [];
        "fast-diff@^1.2.0" = s."fast-diff@1.2.0";
        "fast-glob@3.2.4" = f "fast-glob" "3.2.4" y "d20aefbf99579383e7f3cc66529158c9b98554d3" [
          (s."@nodelib/fs.stat@^2.0.2")
          (s."@nodelib/fs.walk@^1.2.3")
          (s."glob-parent@^5.1.0")
          (s."merge2@^1.3.0")
          (s."micromatch@^4.0.2")
          (s."picomatch@^2.2.1")
          ];
        "fast-glob@^3.1.1" = s."fast-glob@3.2.4";
        "fast-json-stable-stringify@2.1.0" = f "fast-json-stable-stringify" "2.1.0" y "874bf69c6f404c2b5d99c481341399fd55892633" [];
        "fast-json-stable-stringify@^2.0.0" = s."fast-json-stable-stringify@2.1.0";
        "fast-levenshtein@2.0.6" = f "fast-levenshtein" "2.0.6" y "3d8a5c66883a16a30ca8643e851f19baa7797917" [];
        "fast-levenshtein@^2.0.6" = s."fast-levenshtein@2.0.6";
        "fastq@1.8.0" = f "fastq" "1.8.0" y "550e1f9f59bbc65fe185cb6a9b4d95357107f481" [
          (s."reusify@^1.0.4")
          ];
        "fastq@^1.6.0" = s."fastq@1.8.0";
        "figures@3.2.0" = f "figures" "3.2.0" y "625c18bd293c604dc4a8ddb2febf0c88341746af" [
          (s."escape-string-regexp@^1.0.5")
          ];
        "figures@^3.2.0" = s."figures@3.2.0";
        "file-entry-cache@5.0.1" = f "file-entry-cache" "5.0.1" y "ca0f6efa6dd3d561333fb14515065c2fafdf439c" [
          (s."flat-cache@^2.0.1")
          ];
        "file-entry-cache@^5.0.1" = s."file-entry-cache@5.0.1";
        "fill-range@7.0.1" = f "fill-range" "7.0.1" y "1919a6a7c75fe38b2c7c77e5198535da9acdda40" [
          (s."to-regex-range@^5.0.1")
          ];
        "fill-range@^7.0.1" = s."fill-range@7.0.1";
        "find-cache-dir@3.3.1" = f "find-cache-dir" "3.3.1" y "89b33fad4a4670daa94f855f7fbe31d6d84fe880" [
          (s."commondir@^1.0.1")
          (s."make-dir@^3.0.2")
          (s."pkg-dir@^4.1.0")
          ];
        "find-cache-dir@^3.2.0" = s."find-cache-dir@3.3.1";
        "find-up@3.0.0" = f "find-up" "3.0.0" y "49169f1d7993430646da61ecc5ae355c21c97b73" [
          (s."locate-path@^3.0.0")
          ];
        "find-up@4.1.0" = f "find-up" "4.1.0" y "97afe7d6cdc0bc5928584b7c8d7b16e8a9aa5d19" [
          (s."locate-path@^5.0.0")
          (s."path-exists@^4.0.0")
          ];
        "find-up@^3.0.0" = s."find-up@3.0.0";
        "find-up@^4.0.0" = s."find-up@4.1.0";
        "find-up@^4.1.0" = s."find-up@4.1.0";
        "flat-cache@2.0.1" = f "flat-cache" "2.0.1" y "5d296d6f04bda44a4630a301413bdbc2ec085ec0" [
          (s."flatted@^2.0.0")
          (s."rimraf@2.6.3")
          (s."write@1.0.3")
          ];
        "flat-cache@^2.0.1" = s."flat-cache@2.0.1";
        "flatted@2.0.2" = f "flatted" "2.0.2" y "4575b21e2bcee7434aa9be662f4b7b5f9c2b5138" [];
        "flatted@^2.0.0" = s."flatted@2.0.2";
        "foreground-child@2.0.0" = f "foreground-child" "2.0.0" y "71b32800c9f15aa8f2f83f4a6bd9bff35d861a53" [
          (s."cross-spawn@^7.0.0")
          (s."signal-exit@^3.0.2")
          ];
        "foreground-child@^2.0.0" = s."foreground-child@2.0.0";
        "forever-agent@0.6.1" = f "forever-agent" "0.6.1" y "fbc71f0c41adeb37f96c577ad1ed42d8fdacca91" [];
        "forever-agent@~0.6.1" = s."forever-agent@0.6.1";
        "form-data@2.3.3" = f "form-data" "2.3.3" y "dcce52c05f644f298c6a7ab936bd724ceffbf3a6" [
          (s."asynckit@^0.4.0")
          (s."combined-stream@^1.0.6")
          (s."mime-types@^2.1.12")
          ];
        "form-data@~2.3.2" = s."form-data@2.3.3";
        "fromentries@1.2.1" = f "fromentries" "1.2.1" y "64c31665630479bc993cd800d53387920dc61b4d" [];
        "fromentries@^1.2.0" = s."fromentries@1.2.1";
        "fs-extra@9.0.1" = f "fs-extra" "9.0.1" y "910da0062437ba4c39fedd863f1675ccfefcb9fc" [
          (s."at-least-node@^1.0.0")
          (s."graceful-fs@^4.2.0")
          (s."jsonfile@^6.0.1")
          (s."universalify@^1.0.0")
          ];
        "fs-extra@^9.0.0" = s."fs-extra@9.0.1";
        "fs.realpath@1.0.0" = f "fs.realpath" "1.0.0" y "1504ad2523158caa40db4a2787cb01411994ea4f" [];
        "fs.realpath@^1.0.0" = s."fs.realpath@1.0.0";
        "fsevents@2.1.3" = f "fsevents" "2.1.3" y "fb738703ae8d2f9fe900c33836ddebee8b97f23e" [];
        "fsevents@~2.1.2" = s."fsevents@2.1.3";
        "functional-red-black-tree@1.0.1" = f "functional-red-black-tree" "1.0.1" y "1b0ab3bd553b2a0d6399d29c0e3ea0b252078327" [];
        "functional-red-black-tree@^1.0.1" = s."functional-red-black-tree@1.0.1";
        "gensync@1.0.0-beta.1" = f "gensync" "1.0.0-beta.1" y "58f4361ff987e5ff6e1e7a210827aa371eaac269" [];
        "gensync@^1.0.0-beta.1" = s."gensync@1.0.0-beta.1";
        "get-caller-file@2.0.5" = f "get-caller-file" "2.0.5" y "4f94412a82db32f36e3b0b9741f8a97feb031f7e" [];
        "get-caller-file@^2.0.1" = s."get-caller-file@2.0.5";
        "get-caller-file@^2.0.5" = s."get-caller-file@2.0.5";
        "get-package-type@0.1.0" = f "get-package-type" "0.1.0" y "8de2d803cff44df3bc6c456e6668b36c3926e11a" [];
        "get-package-type@^0.1.0" = s."get-package-type@0.1.0";
        "get-stdin@8.0.0" = f "get-stdin" "8.0.0" y "cbad6a73feb75f6eeb22ba9e01f89aa28aa97a53" [];
        "get-stdin@^8.0.0" = s."get-stdin@8.0.0";
        "get-stream@4.1.0" = f "get-stream" "4.1.0" y "c1b255575f3dc21d59bfc79cd3d2b46b1c3a54b5" [
          (s."pump@^3.0.0")
          ];
        "get-stream@5.2.0" = f "get-stream" "5.2.0" y "4966a1795ee5ace65e706c4b7beb71257d6e22d3" [
          (s."pump@^3.0.0")
          ];
        "get-stream@^4.1.0" = s."get-stream@4.1.0";
        "get-stream@^5.1.0" = s."get-stream@5.2.0";
        "getpass@0.1.7" = f "getpass" "0.1.7" y "5eff8e3e684d569ae4cb2b1282604e8ba62149fa" [
          (s."assert-plus@^1.0.0")
          ];
        "getpass@^0.1.1" = s."getpass@0.1.7";
        "glob-parent@5.1.1" = f "glob-parent" "5.1.1" y "b6c1ef417c4e5663ea498f1c45afac6916bbc229" [
          (s."is-glob@^4.0.1")
          ];
        "glob-parent@^5.0.0" = s."glob-parent@5.1.1";
        "glob-parent@^5.1.0" = s."glob-parent@5.1.1";
        "glob-parent@~5.1.0" = s."glob-parent@5.1.1";
        "glob@7.1.6" = f "glob" "7.1.6" y "141f33b81a7c2492e125594307480c46679278a6" [
          (s."fs.realpath@^1.0.0")
          (s."inflight@^1.0.4")
          (s."inherits@2")
          (s."minimatch@^3.0.4")
          (s."once@^1.3.0")
          (s."path-is-absolute@^1.0.0")
          ];
        "glob@^7.1.3" = s."glob@7.1.6";
        "glob@^7.1.4" = s."glob@7.1.6";
        "glob@^7.1.6" = s."glob@7.1.6";
        "global-dirs@2.0.1" = f "global-dirs" "2.0.1" y "acdf3bb6685bcd55cb35e8a052266569e9469201" [
          (s."ini@^1.3.5")
          ];
        "global-dirs@^2.0.1" = s."global-dirs@2.0.1";
        "globals@11.12.0" = f "globals" "11.12.0" y "ab8795338868a0babd8525758018c2a7eb95c42e" [];
        "globals@12.4.0" = f "globals" "12.4.0" y "a18813576a41b00a24a97e7f815918c2e19925f8" [
          (s."type-fest@^0.8.1")
          ];
        "globals@^11.1.0" = s."globals@11.12.0";
        "globals@^12.1.0" = s."globals@12.4.0";
        "globby@11.0.1" = f "globby" "11.0.1" y "9a2bf107a068f3ffeabc49ad702c79ede8cfd357" [
          (s."array-union@^2.1.0")
          (s."dir-glob@^3.0.1")
          (s."fast-glob@^3.1.1")
          (s."ignore@^5.1.4")
          (s."merge2@^1.3.0")
          (s."slash@^3.0.0")
          ];
        "globby@^11.0.0" = s."globby@11.0.1";
        "globby@^11.0.1" = s."globby@11.0.1";
        "got@9.6.0" = f "got" "9.6.0" y "edf45e7d67f99545705de1f7bbeeeb121765ed85" [
          (s."@sindresorhus/is@^0.14.0")
          (s."@szmarczak/http-timer@^1.1.2")
          (s."cacheable-request@^6.0.0")
          (s."decompress-response@^3.3.0")
          (s."duplexer3@^0.1.4")
          (s."get-stream@^4.1.0")
          (s."lowercase-keys@^1.0.1")
          (s."mimic-response@^1.0.1")
          (s."p-cancelable@^1.0.0")
          (s."to-readable-stream@^1.0.0")
          (s."url-parse-lax@^3.0.0")
          ];
        "got@^9.6.0" = s."got@9.6.0";
        "graceful-fs@4.2.4" = f "graceful-fs" "4.2.4" y "2256bde14d3632958c465ebc96dc467ca07a29fb" [];
        "graceful-fs@^4.1.15" = s."graceful-fs@4.2.4";
        "graceful-fs@^4.1.2" = s."graceful-fs@4.2.4";
        "graceful-fs@^4.1.6" = s."graceful-fs@4.2.4";
        "graceful-fs@^4.2.0" = s."graceful-fs@4.2.4";
        "graceful-fs@^4.2.4" = s."graceful-fs@4.2.4";
        "har-schema@2.0.0" = f "har-schema" "2.0.0" y "a94c2224ebcac04782a0d9035521f24735b7ec92" [];
        "har-schema@^2.0.0" = s."har-schema@2.0.0";
        "har-validator@5.1.5" = f "har-validator" "5.1.5" y "1f0803b9f8cb20c0fa13822df1ecddb36bde1efd" [
          (s."ajv@^6.12.3")
          (s."har-schema@^2.0.0")
          ];
        "har-validator@~5.1.3" = s."har-validator@5.1.5";
        "has-flag@3.0.0" = f "has-flag" "3.0.0" y "b5d454dc2199ae225699f3467e5a07f3b955bafd" [];
        "has-flag@4.0.0" = f "has-flag" "4.0.0" y "944771fd9c81c81265c4d6941860da06bb59479b" [];
        "has-flag@^3.0.0" = s."has-flag@3.0.0";
        "has-flag@^4.0.0" = s."has-flag@4.0.0";
        "has-yarn@2.1.0" = f "has-yarn" "2.1.0" y "137e11354a7b5bf11aa5cb649cf0c6f3ff2b2e77" [];
        "has-yarn@^2.1.0" = s."has-yarn@2.1.0";
        "hasha@5.2.1" = f "hasha" "5.2.1" y "0e5b492aa40de3819e80955f221d2fccef55b5aa" [
          (s."is-stream@^2.0.0")
          (s."type-fest@^0.8.0")
          ];
        "hasha@^5.0.0" = s."hasha@5.2.1";
        "hosted-git-info@2.8.8" = f "hosted-git-info" "2.8.8" y "7539bd4bc1e0e0a895815a2e0262420b12858488" [];
        "hosted-git-info@^2.1.4" = s."hosted-git-info@2.8.8";
        "html-escaper@2.0.2" = f "html-escaper" "2.0.2" y "dfd60027da36a36dfcbe236262c00a5822681453" [];
        "html-escaper@^2.0.0" = s."html-escaper@2.0.2";
        "http-cache-semantics@4.1.0" = f "http-cache-semantics" "4.1.0" y "49e91c5cbf36c9b94bcfcd71c23d5249ec74e390" [];
        "http-cache-semantics@^4.0.0" = s."http-cache-semantics@4.1.0";
        "http-signature@1.2.0" = f "http-signature" "1.2.0" y "9aecd925114772f3d95b65a60abb8f7c18fbace1" [
          (s."assert-plus@^1.0.0")
          (s."jsprim@^1.2.2")
          (s."sshpk@^1.7.0")
          ];
        "http-signature@~1.2.0" = s."http-signature@1.2.0";
        "ignore-by-default@2.0.0" = f "ignore-by-default" "2.0.0" y "537092018540640459569fe7c8c7a408af581146" [];
        "ignore-by-default@^2.0.0" = s."ignore-by-default@2.0.0";
        "ignore@4.0.6" = f "ignore" "4.0.6" y "750e3db5862087b4737ebac8207ffd1ef27b25fc" [];
        "ignore@5.1.8" = f "ignore" "5.1.8" y "f150a8b50a34289b33e22f5889abd4d8016f0e57" [];
        "ignore@^4.0.6" = s."ignore@4.0.6";
        "ignore@^5.1.4" = s."ignore@5.1.8";
        "import-cwd@2.1.0" = f "import-cwd" "2.1.0" y "aa6cf36e722761285cb371ec6519f53e2435b0a9" [
          (s."import-from@^2.1.0")
          ];
        "import-cwd@^2.0.0" = s."import-cwd@2.1.0";
        "import-fresh@2.0.0" = f "import-fresh" "2.0.0" y "d81355c15612d386c61f9ddd3922d4304822a546" [
          (s."caller-path@^2.0.0")
          (s."resolve-from@^3.0.0")
          ];
        "import-fresh@3.2.1" = f "import-fresh" "3.2.1" y "633ff618506e793af5ac91bf48b72677e15cbe66" [
          (s."parent-module@^1.0.0")
          (s."resolve-from@^4.0.0")
          ];
        "import-fresh@^2.0.0" = s."import-fresh@2.0.0";
        "import-fresh@^3.0.0" = s."import-fresh@3.2.1";
        "import-fresh@^3.2.1" = s."import-fresh@3.2.1";
        "import-from@2.1.0" = f "import-from" "2.1.0" y "335db7f2a7affd53aaa471d4b8021dee36b7f3b1" [
          (s."resolve-from@^3.0.0")
          ];
        "import-from@^2.1.0" = s."import-from@2.1.0";
        "import-lazy@2.1.0" = f "import-lazy" "2.1.0" y "05698e3d45c88e8d7e9d92cb0584e77f096f3e43" [];
        "import-lazy@^2.1.0" = s."import-lazy@2.1.0";
        "import-local@3.0.2" = f "import-local" "3.0.2" y "a8cfd0431d1de4a2199703d003e3e62364fa6db6" [
          (s."pkg-dir@^4.2.0")
          (s."resolve-cwd@^3.0.0")
          ];
        "import-local@^3.0.2" = s."import-local@3.0.2";
        "imurmurhash@0.1.4" = f "imurmurhash" "0.1.4" y "9218b9b2b928a238b13dc4fb6b6d576f231453ea" [];
        "imurmurhash@^0.1.4" = s."imurmurhash@0.1.4";
        "indent-string@3.2.0" = f "indent-string" "3.2.0" y "4a5fd6d27cc332f37e5419a504dbb837105c9289" [];
        "indent-string@4.0.0" = f "indent-string" "4.0.0" y "624f8f4497d619b2d9768531d58f4122854d7251" [];
        "indent-string@^3.2.0" = s."indent-string@3.2.0";
        "indent-string@^4.0.0" = s."indent-string@4.0.0";
        "inflight@1.0.6" = f "inflight" "1.0.6" y "49bd6331d7d02d0c09bc910a1075ba8165b56df9" [
          (s."once@^1.3.0")
          (s."wrappy@1")
          ];
        "inflight@^1.0.4" = s."inflight@1.0.6";
        "inherits@2" = s."inherits@2.0.4";
        "inherits@2.0.4" = f "inherits" "2.0.4" y "0fa2c64f932917c3433a0ded55363aae37416b7c" [];
        "ini@1.3.5" = f "ini" "1.3.5" y "eee25f56db1c9ec6085e0c22778083f596abf927" [];
        "ini@^1.3.5" = s."ini@1.3.5";
        "ini@~1.3.0" = s."ini@1.3.5";
        "irregular-plurals@3.2.0" = f "irregular-plurals" "3.2.0" y "b19c490a0723798db51b235d7e39add44dab0822" [];
        "irregular-plurals@^3.2.0" = s."irregular-plurals@3.2.0";
        "is-arrayish@0.2.1" = f "is-arrayish" "0.2.1" y "77c99840527aa8ecb1a8ba697b80645a7a926a9d" [];
        "is-arrayish@^0.2.1" = s."is-arrayish@0.2.1";
        "is-binary-path@2.1.0" = f "is-binary-path" "2.1.0" y "ea1f7f3b80f064236e83470f86c09c254fb45b09" [
          (s."binary-extensions@^2.0.0")
          ];
        "is-binary-path@~2.1.0" = s."is-binary-path@2.1.0";
        "is-ci@2.0.0" = f "is-ci" "2.0.0" y "6bc6334181810e04b5c22b3d589fdca55026404c" [
          (s."ci-info@^2.0.0")
          ];
        "is-ci@^2.0.0" = s."is-ci@2.0.0";
        "is-directory@0.3.1" = f "is-directory" "0.3.1" y "61339b6f2475fc772fd9c9d83f5c8575dc154ae1" [];
        "is-directory@^0.3.1" = s."is-directory@0.3.1";
        "is-error@2.2.2" = f "is-error" "2.2.2" y "c10ade187b3c93510c5470a5567833ee25649843" [];
        "is-error@^2.2.2" = s."is-error@2.2.2";
        "is-extglob@2.1.1" = f "is-extglob" "2.1.1" y "a88c02535791f02ed37c76a1b9ea9773c833f8c2" [];
        "is-extglob@^2.1.1" = s."is-extglob@2.1.1";
        "is-fullwidth-code-point@2.0.0" = f "is-fullwidth-code-point" "2.0.0" y "a3b30a5c4f199183167aaab93beefae3ddfb654f" [];
        "is-fullwidth-code-point@3.0.0" = f "is-fullwidth-code-point" "3.0.0" y "f116f8064fe90b3f7844a38997c0b75051269f1d" [];
        "is-fullwidth-code-point@^2.0.0" = s."is-fullwidth-code-point@2.0.0";
        "is-fullwidth-code-point@^3.0.0" = s."is-fullwidth-code-point@3.0.0";
        "is-glob@4.0.1" = f "is-glob" "4.0.1" y "7567dbe9f2f5e2467bc77ab83c4a29482407a5dc" [
          (s."is-extglob@^2.1.1")
          ];
        "is-glob@^4.0.0" = s."is-glob@4.0.1";
        "is-glob@^4.0.1" = s."is-glob@4.0.1";
        "is-glob@~4.0.1" = s."is-glob@4.0.1";
        "is-installed-globally@0.3.2" = f "is-installed-globally" "0.3.2" y "fd3efa79ee670d1187233182d5b0a1dd00313141" [
          (s."global-dirs@^2.0.1")
          (s."is-path-inside@^3.0.1")
          ];
        "is-installed-globally@^0.3.1" = s."is-installed-globally@0.3.2";
        "is-interactive@1.0.0" = f "is-interactive" "1.0.0" y "cea6e6ae5c870a7b0a0004070b7b587e0252912e" [];
        "is-interactive@^1.0.0" = s."is-interactive@1.0.0";
        "is-npm@4.0.0" = f "is-npm" "4.0.0" y "c90dd8380696df87a7a6d823c20d0b12bbe3c84d" [];
        "is-npm@^4.0.0" = s."is-npm@4.0.0";
        "is-number@7.0.0" = f "is-number" "7.0.0" y "7535345b896734d5f80c4d06c50955527a14f12b" [];
        "is-number@^7.0.0" = s."is-number@7.0.0";
        "is-obj@2.0.0" = f "is-obj" "2.0.0" y "473fb05d973705e3fd9620545018ca8e22ef4982" [];
        "is-obj@^2.0.0" = s."is-obj@2.0.0";
        "is-path-cwd@2.2.0" = f "is-path-cwd" "2.2.0" y "67d43b82664a7b5191fd9119127eb300048a9fdb" [];
        "is-path-cwd@^2.2.0" = s."is-path-cwd@2.2.0";
        "is-path-inside@3.0.2" = f "is-path-inside" "3.0.2" y "f5220fc82a3e233757291dddc9c5877f2a1f3017" [];
        "is-path-inside@^3.0.1" = s."is-path-inside@3.0.2";
        "is-path-inside@^3.0.2" = s."is-path-inside@3.0.2";
        "is-plain-object@5.0.0" = f "is-plain-object" "5.0.0" y "4427f50ab3429e9025ea7d52e9043a9ef4159344" [];
        "is-plain-object@^5.0.0" = s."is-plain-object@5.0.0";
        "is-promise@4.0.0" = f "is-promise" "4.0.0" y "42ff9f84206c1991d26debf520dd5c01042dd2f3" [];
        "is-promise@^4.0.0" = s."is-promise@4.0.0";
        "is-stream@2.0.0" = f "is-stream" "2.0.0" y "bde9c32680d6fae04129d6ac9d921ce7815f78e3" [];
        "is-stream@^2.0.0" = s."is-stream@2.0.0";
        "is-typedarray@1.0.0" = f "is-typedarray" "1.0.0" y "e479c80858df0c1b11ddda6940f96011fcda4a9a" [];
        "is-typedarray@^1.0.0" = s."is-typedarray@1.0.0";
        "is-typedarray@~1.0.0" = s."is-typedarray@1.0.0";
        "is-windows@1.0.2" = f "is-windows" "1.0.2" y "d1850eb9791ecd18e6182ce12a30f396634bb19d" [];
        "is-windows@^1.0.2" = s."is-windows@1.0.2";
        "is-yarn-global@0.3.0" = f "is-yarn-global" "0.3.0" y "d502d3382590ea3004893746754c89139973e232" [];
        "is-yarn-global@^0.3.0" = s."is-yarn-global@0.3.0";
        "isarray@1.0.0" = f "isarray" "1.0.0" y "bb935d48582cba168c06834957a54a3e07124f11" [];
        "isarray@^1.0.0" = s."isarray@1.0.0";
        "isexe@2.0.0" = f "isexe" "2.0.0" y "e8fbf374dc556ff8947a10dcb0572d633f2cfa10" [];
        "isexe@^2.0.0" = s."isexe@2.0.0";
        "isobject@2.1.0" = f "isobject" "2.1.0" y "f065561096a3f1da2ef46272f815c840d87e0c89" [
          (s."isarray@1.0.0")
          ];
        "isobject@^2.0.0" = s."isobject@2.1.0";
        "isstream@0.1.2" = f "isstream" "0.1.2" y "47e63f7af55afa6f92e1500e690eb8b8529c099a" [];
        "isstream@~0.1.2" = s."isstream@0.1.2";
        "istanbul-lib-coverage@3.0.0" = f "istanbul-lib-coverage" "3.0.0" y "f5944a37c70b550b02a78a5c3b2055b280cec8ec" [];
        "istanbul-lib-coverage@^3.0.0" = s."istanbul-lib-coverage@3.0.0";
        "istanbul-lib-coverage@^3.0.0-alpha.1" = s."istanbul-lib-coverage@3.0.0";
        "istanbul-lib-hook@3.0.0" = f "istanbul-lib-hook" "3.0.0" y "8f84c9434888cc6b1d0a9d7092a76d239ebf0cc6" [
          (s."append-transform@^2.0.0")
          ];
        "istanbul-lib-hook@^3.0.0" = s."istanbul-lib-hook@3.0.0";
        "istanbul-lib-instrument@4.0.3" = f "istanbul-lib-instrument" "4.0.3" y "873c6fff897450118222774696a3f28902d77c1d" [
          (s."@babel/core@^7.7.5")
          (s."@istanbuljs/schema@^0.1.2")
          (s."istanbul-lib-coverage@^3.0.0")
          (s."semver@^6.3.0")
          ];
        "istanbul-lib-instrument@^4.0.0" = s."istanbul-lib-instrument@4.0.3";
        "istanbul-lib-processinfo@2.0.2" = f "istanbul-lib-processinfo" "2.0.2" y "e1426514662244b2f25df728e8fd1ba35fe53b9c" [
          (s."archy@^1.0.0")
          (s."cross-spawn@^7.0.0")
          (s."istanbul-lib-coverage@^3.0.0-alpha.1")
          (s."make-dir@^3.0.0")
          (s."p-map@^3.0.0")
          (s."rimraf@^3.0.0")
          (s."uuid@^3.3.3")
          ];
        "istanbul-lib-processinfo@^2.0.2" = s."istanbul-lib-processinfo@2.0.2";
        "istanbul-lib-report@3.0.0" = f "istanbul-lib-report" "3.0.0" y "7518fe52ea44de372f460a76b5ecda9ffb73d8a6" [
          (s."istanbul-lib-coverage@^3.0.0")
          (s."make-dir@^3.0.0")
          (s."supports-color@^7.1.0")
          ];
        "istanbul-lib-report@^3.0.0" = s."istanbul-lib-report@3.0.0";
        "istanbul-lib-source-maps@4.0.0" = f "istanbul-lib-source-maps" "4.0.0" y "75743ce6d96bb86dc7ee4352cf6366a23f0b1ad9" [
          (s."debug@^4.1.1")
          (s."istanbul-lib-coverage@^3.0.0")
          (s."source-map@^0.6.1")
          ];
        "istanbul-lib-source-maps@^4.0.0" = s."istanbul-lib-source-maps@4.0.0";
        "istanbul-reports@3.0.2" = f "istanbul-reports" "3.0.2" y "d593210e5000683750cb09fc0644e4b6e27fd53b" [
          (s."html-escaper@^2.0.0")
          (s."istanbul-lib-report@^3.0.0")
          ];
        "istanbul-reports@^3.0.2" = s."istanbul-reports@3.0.2";
        "js-string-escape@1.0.1" = f "js-string-escape" "1.0.1" y "e2625badbc0d67c7533e9edc1068c587ae4137ef" [];
        "js-string-escape@^1.0.1" = s."js-string-escape@1.0.1";
        "js-tokens@4.0.0" = f "js-tokens" "4.0.0" y "19203fb59991df98e3a287050d4647cdeaf32499" [];
        "js-tokens@^4.0.0" = s."js-tokens@4.0.0";
        "js-yaml@3.14.0" = f "js-yaml" "3.14.0" y "a7a34170f26a21bb162424d8adacb4113a69e482" [
          (s."argparse@^1.0.7")
          (s."esprima@^4.0.0")
          ];
        "js-yaml@^3.10.0" = s."js-yaml@3.14.0";
        "js-yaml@^3.13.1" = s."js-yaml@3.14.0";
        "jsbn@0.1.1" = f "jsbn" "0.1.1" y "a5e654c2e5a2deb5f201d96cefbca80c0ef2f513" [];
        "jsbn@~0.1.0" = s."jsbn@0.1.1";
        "jsesc@2.5.2" = f "jsesc" "2.5.2" y "80564d2e483dacf6e8ef209650a67df3f0c283a4" [];
        "jsesc@^2.5.1" = s."jsesc@2.5.2";
        "json-buffer@3.0.0" = f "json-buffer" "3.0.0" y "5b1f397afc75d677bde8bcfc0e47e1f9a3d9a898" [];
        "json-parse-better-errors@1.0.2" = f "json-parse-better-errors" "1.0.2" y "bb867cfb3450e69107c131d1c514bab3dc8bcaa9" [];
        "json-parse-better-errors@^1.0.1" = s."json-parse-better-errors@1.0.2";
        "json-parse-even-better-errors@2.3.1" = f "json-parse-even-better-errors" "2.3.1" y "7c47805a94319928e05777405dc12e1f7a4ee02d" [];
        "json-parse-even-better-errors@^2.3.0" = s."json-parse-even-better-errors@2.3.1";
        "json-schema-traverse@0.4.1" = f "json-schema-traverse" "0.4.1" y "69f6a87d9513ab8bb8fe63bdb0979c448e684660" [];
        "json-schema-traverse@^0.4.1" = s."json-schema-traverse@0.4.1";
        "json-schema@0.2.3" = f "json-schema" "0.2.3" y "b480c892e59a2f05954ce727bd3f2a4e882f9e13" [];
        "json-stable-stringify-without-jsonify@1.0.1" = f "json-stable-stringify-without-jsonify" "1.0.1" y "9db7b59496ad3f3cfef30a75142d2d930ad72651" [];
        "json-stable-stringify-without-jsonify@^1.0.1" = s."json-stable-stringify-without-jsonify@1.0.1";
        "json-stringify-safe@5.0.1" = f "json-stringify-safe" "5.0.1" y "1296a2d58fd45f19a0f6ce01d65701e2c735b6eb" [];
        "json-stringify-safe@~5.0.1" = s."json-stringify-safe@5.0.1";
        "json5@2.1.3" = f "json5" "2.1.3" y "c9b0f7fa9233bfe5807fe66fcf3a5617ed597d43" [
          (s."minimist@^1.2.5")
          ];
        "json5@^2.1.2" = s."json5@2.1.3";
        "jsonfile@6.0.1" = f "jsonfile" "6.0.1" y "98966cba214378c8c84b82e085907b40bf614179" [
          (s."universalify@^1.0.0")
          (s."graceful-fs@^4.1.6")
          ];
        "jsonfile@^6.0.1" = s."jsonfile@6.0.1";
        "jsprim@1.4.1" = f "jsprim" "1.4.1" y "313e66bc1e5cc06e438bc1b7499c2e5c56acb6a2" [
          (s."assert-plus@1.0.0")
          (s."extsprintf@1.3.0")
          (s."json-schema@0.2.3")
          (s."verror@1.10.0")
          ];
        "jsprim@^1.2.2" = s."jsprim@1.4.1";
        "keyv@3.1.0" = f "keyv" "3.1.0" y "ecc228486f69991e49e9476485a5be1e8fc5c4d9" [
          (s."json-buffer@3.0.0")
          ];
        "keyv@^3.0.0" = s."keyv@3.1.0";
        "latest-version@5.1.0" = f "latest-version" "5.1.0" y "119dfe908fe38d15dfa43ecd13fa12ec8832face" [
          (s."package-json@^6.3.0")
          ];
        "latest-version@^5.0.0" = s."latest-version@5.1.0";
        "lcov-parse@1.0.0" = f "lcov-parse" "1.0.0" y "eb0d46b54111ebc561acb4c408ef9363bdc8f7e0" [];
        "lcov-parse@^1.0.0" = s."lcov-parse@1.0.0";
        "levn@0.4.1" = f "levn" "0.4.1" y "ae4562c007473b932a6200d403268dd2fffc6ade" [
          (s."prelude-ls@^1.2.1")
          (s."type-check@~0.4.0")
          ];
        "levn@^0.4.1" = s."levn@0.4.1";
        "line-column@1.0.2" = f "line-column" "1.0.2" y "d25af2936b6f4849172b312e4792d1d987bc34a2" [
          (s."isarray@^1.0.0")
          (s."isobject@^2.0.0")
          ];
        "line-column@^1.0.2" = s."line-column@1.0.2";
        "lines-and-columns@1.1.6" = f "lines-and-columns" "1.1.6" y "1c00c743b433cd0a4e80758f7b64a57440d9ff00" [];
        "lines-and-columns@^1.1.6" = s."lines-and-columns@1.1.6";
        "load-json-file@5.3.0" = f "load-json-file" "5.3.0" y "4d3c1e01fa1c03ea78a60ac7af932c9ce53403f3" [
          (s."graceful-fs@^4.1.15")
          (s."parse-json@^4.0.0")
          (s."pify@^4.0.1")
          (s."strip-bom@^3.0.0")
          (s."type-fest@^0.3.0")
          ];
        "load-json-file@^5.2.0" = s."load-json-file@5.3.0";
        "locate-path@3.0.0" = f "locate-path" "3.0.0" y "dbec3b3ab759758071b58fe59fc41871af21400e" [
          (s."p-locate@^3.0.0")
          (s."path-exists@^3.0.0")
          ];
        "locate-path@5.0.0" = f "locate-path" "5.0.0" y "1afba396afd676a6d42504d0a67a3a7eb9f62aa0" [
          (s."p-locate@^4.1.0")
          ];
        "locate-path@^3.0.0" = s."locate-path@3.0.0";
        "locate-path@^5.0.0" = s."locate-path@5.0.0";
        "lodash.difference@4.5.0" = f "lodash.difference" "4.5.0" y "9ccb4e505d486b91651345772885a2df27fd017c" [];
        "lodash.difference@^4.5.0" = s."lodash.difference@4.5.0";
        "lodash.flattendeep@4.4.0" = f "lodash.flattendeep" "4.4.0" y "fb030917f86a3134e5bc9bec0d69e0013ddfedb2" [];
        "lodash.flattendeep@^4.4.0" = s."lodash.flattendeep@4.4.0";
        "lodash.forown@4.4.0" = f "lodash.forown" "4.4.0" y "85115cf04f73ef966eced52511d3893cc46683af" [];
        "lodash.forown@^4.4.0" = s."lodash.forown@4.4.0";
        "lodash.get@4.4.2" = f "lodash.get" "4.4.2" y "2d177f652fa31e939b4438d5341499dfa3825e99" [];
        "lodash.get@^4.4.2" = s."lodash.get@4.4.2";
        "lodash.groupby@4.6.0" = f "lodash.groupby" "4.6.0" y "0b08a1dcf68397c397855c3239783832df7403d1" [];
        "lodash.groupby@^4.6.0" = s."lodash.groupby@4.6.0";
        "lodash.sortby@4.7.0" = f "lodash.sortby" "4.7.0" y "edd14c824e2cc9c1e0b0a1b42bb5210516a42438" [];
        "lodash.sortby@^4.7.0" = s."lodash.sortby@4.7.0";
        "lodash@4.17.20" = f "lodash" "4.17.20" y "b44a9b6297bcb698f1c51a3545a2b3b368d59c52" [];
        "lodash@^4.17.14" = s."lodash@4.17.20";
        "lodash@^4.17.15" = s."lodash@4.17.20";
        "lodash@^4.17.19" = s."lodash@4.17.20";
        "lodash@^4.17.20" = s."lodash@4.17.20";
        "log-driver@1.2.7" = f "log-driver" "1.2.7" y "63b95021f0702fedfa2c9bb0a24e7797d71871d8" [];
        "log-driver@^1.2.7" = s."log-driver@1.2.7";
        "log-symbols@4.0.0" = f "log-symbols" "4.0.0" y "69b3cc46d20f448eccdb75ea1fa733d9e821c920" [
          (s."chalk@^4.0.0")
          ];
        "log-symbols@^4.0.0" = s."log-symbols@4.0.0";
        "lowercase-keys@1.0.1" = f "lowercase-keys" "1.0.1" y "6f9e30b47084d971a7c820ff15a6c5167b74c26f" [];
        "lowercase-keys@2.0.0" = f "lowercase-keys" "2.0.0" y "2603e78b7b4b0006cbca2fbcc8a3202558ac9479" [];
        "lowercase-keys@^1.0.0" = s."lowercase-keys@1.0.1";
        "lowercase-keys@^1.0.1" = s."lowercase-keys@1.0.1";
        "lowercase-keys@^2.0.0" = s."lowercase-keys@2.0.0";
        "make-dir@3.1.0" = f "make-dir" "3.1.0" y "415e967046b3a7f1d185277d84aa58203726a13f" [
          (s."semver@^6.0.0")
          ];
        "make-dir@^3.0.0" = s."make-dir@3.1.0";
        "make-dir@^3.0.2" = s."make-dir@3.1.0";
        "map-age-cleaner@0.1.3" = f "map-age-cleaner" "0.1.3" y "7d583a7306434c055fe474b0f45078e6e1b4b92a" [
          (s."p-defer@^1.0.0")
          ];
        "map-age-cleaner@^0.1.3" = s."map-age-cleaner@0.1.3";
        "matcher@3.0.0" = f "matcher" "3.0.0" y "bd9060f4c5b70aa8041ccc6f80368760994f30ca" [
          (s."escape-string-regexp@^4.0.0")
          ];
        "matcher@^3.0.0" = s."matcher@3.0.0";
        "md5-hex@3.0.1" = f "md5-hex" "3.0.1" y "be3741b510591434b2784d79e556eefc2c9a8e5c" [
          (s."blueimp-md5@^2.10.0")
          ];
        "md5-hex@^3.0.1" = s."md5-hex@3.0.1";
        "mem@6.1.1" = f "mem" "6.1.1" y "ea110c2ebc079eca3022e6b08c85a795e77f6318" [
          (s."map-age-cleaner@^0.1.3")
          (s."mimic-fn@^3.0.0")
          ];
        "mem@^6.1.1" = s."mem@6.1.1";
        "merge2@1.4.1" = f "merge2" "1.4.1" y "4368892f885e907455a6fd7dc55c0c9d404990ae" [];
        "merge2@^1.3.0" = s."merge2@1.4.1";
        "micromatch@4.0.2" = f "micromatch" "4.0.2" y "4fcb0999bf9fbc2fcbdd212f6d629b9a56c39259" [
          (s."braces@^3.0.1")
          (s."picomatch@^2.0.5")
          ];
        "micromatch@^4.0.2" = s."micromatch@4.0.2";
        "mime-db@1.44.0" = f "mime-db" "1.44.0" y "fa11c5eb0aca1334b4233cb4d52f10c5a6272f92" [];
        "mime-types@2.1.27" = f "mime-types" "2.1.27" y "47949f98e279ea53119f5722e0f34e529bec009f" [
          (s."mime-db@1.44.0")
          ];
        "mime-types@^2.1.12" = s."mime-types@2.1.27";
        "mime-types@~2.1.19" = s."mime-types@2.1.27";
        "mimic-fn@2.1.0" = f "mimic-fn" "2.1.0" y "7ed2c2ccccaf84d3ffcb7a69b57711fc2083401b" [];
        "mimic-fn@3.1.0" = f "mimic-fn" "3.1.0" y "65755145bbf3e36954b949c16450427451d5ca74" [];
        "mimic-fn@^2.1.0" = s."mimic-fn@2.1.0";
        "mimic-fn@^3.0.0" = s."mimic-fn@3.1.0";
        "mimic-response@1.0.1" = f "mimic-response" "1.0.1" y "4923538878eef42063cb8a3e3b0798781487ab1b" [];
        "mimic-response@^1.0.0" = s."mimic-response@1.0.1";
        "mimic-response@^1.0.1" = s."mimic-response@1.0.1";
        "minimatch@3.0.4" = f "minimatch" "3.0.4" y "5166e286457f03306064be5497e8dbb0c3d32083" [
          (s."brace-expansion@^1.1.7")
          ];
        "minimatch@^3.0.4" = s."minimatch@3.0.4";
        "minimist@1.2.5" = f "minimist" "1.2.5" y "67d66014b66a6a8aaa0c083c5fd58df4e4e97602" [];
        "minimist@^1.2.0" = s."minimist@1.2.5";
        "minimist@^1.2.5" = s."minimist@1.2.5";
        "mkdirp@0.5.5" = f "mkdirp" "0.5.5" y "d91cefd62d1436ca0f41620e251288d420099def" [
          (s."minimist@^1.2.5")
          ];
        "mkdirp@^0.5.1" = s."mkdirp@0.5.5";
        "ms@2.1.2" = f "ms" "2.1.2" y "d09d1f357b443f493382a8eb3ccd183872ae6009" [];
        "ms@^2.1.2" = s."ms@2.1.2";
        "mute-stream@0.0.8" = f "mute-stream" "0.0.8" y "1630c42b2251ff81e2a283de96a5497ea92e5e0d" [];
        "nanoid@3.1.12" = f "nanoid" "3.1.12" y "6f7736c62e8d39421601e4a0c77623a97ea69654" [];
        "nanoid@^3.1.12" = s."nanoid@3.1.12";
        "natural-compare@1.4.0" = f "natural-compare" "1.4.0" y "4abebfeed7541f2c27acfb29bdbbd15c8d5ba4f7" [];
        "natural-compare@^1.4.0" = s."natural-compare@1.4.0";
        "node-preload@0.2.1" = f "node-preload" "0.2.1" y "c03043bb327f417a18fee7ab7ee57b408a144301" [
          (s."process-on-spawn@^1.0.0")
          ];
        "node-preload@^0.2.1" = s."node-preload@0.2.1";
        "normalize-package-data@2.5.0" = f "normalize-package-data" "2.5.0" y "e66db1838b200c1dfc233225d12cb36520e234a8" [
          (s."hosted-git-info@^2.1.4")
          (s."resolve@^1.10.0")
          (s."semver@2 || 3 || 4 || 5")
          (s."validate-npm-package-license@^3.0.1")
          ];
        "normalize-package-data@^2.5.0" = s."normalize-package-data@2.5.0";
        "normalize-path@3.0.0" = f "normalize-path" "3.0.0" y "0dcd69ff23a1c9b11fd0978316644a0388216a65" [];
        "normalize-path@^3.0.0" = s."normalize-path@3.0.0";
        "normalize-path@~3.0.0" = s."normalize-path@3.0.0";
        "normalize-url@4.5.0" = f "normalize-url" "4.5.0" y "453354087e6ca96957bd8f5baf753f5982142129" [];
        "normalize-url@^4.1.0" = s."normalize-url@4.5.0";
        "nyc@15.1.0" = f "nyc" "15.1.0" y "1335dae12ddc87b6e249d5a1994ca4bdaea75f02" [
          (s."@istanbuljs/load-nyc-config@^1.0.0")
          (s."@istanbuljs/schema@^0.1.2")
          (s."caching-transform@^4.0.0")
          (s."convert-source-map@^1.7.0")
          (s."decamelize@^1.2.0")
          (s."find-cache-dir@^3.2.0")
          (s."find-up@^4.1.0")
          (s."foreground-child@^2.0.0")
          (s."get-package-type@^0.1.0")
          (s."glob@^7.1.6")
          (s."istanbul-lib-coverage@^3.0.0")
          (s."istanbul-lib-hook@^3.0.0")
          (s."istanbul-lib-instrument@^4.0.0")
          (s."istanbul-lib-processinfo@^2.0.2")
          (s."istanbul-lib-report@^3.0.0")
          (s."istanbul-lib-source-maps@^4.0.0")
          (s."istanbul-reports@^3.0.2")
          (s."make-dir@^3.0.0")
          (s."node-preload@^0.2.1")
          (s."p-map@^3.0.0")
          (s."process-on-spawn@^1.0.0")
          (s."resolve-from@^5.0.0")
          (s."rimraf@^3.0.0")
          (s."signal-exit@^3.0.2")
          (s."spawn-wrap@^2.0.0")
          (s."test-exclude@^6.0.0")
          (s."yargs@^15.0.2")
          ];
        "nyc@^15.0.0" = s."nyc@15.1.0";
        "oauth-sign@0.9.0" = f "oauth-sign" "0.9.0" y "47a7b016baa68b5fa0ecf3dee08a85c679ac6455" [];
        "oauth-sign@~0.9.0" = s."oauth-sign@0.9.0";
        "once@1.4.0" = f "once" "1.4.0" y "583b1aa775961d4b113ac17d9c50baef9dd76bd1" [
          (s."wrappy@1")
          ];
        "once@^1.3.0" = s."once@1.4.0";
        "once@^1.3.1" = s."once@1.4.0";
        "once@^1.4.0" = s."once@1.4.0";
        "onetime@5.1.2" = f "onetime" "5.1.2" y "d0e96ebb56b07476df1dd9c4806e5237985ca45e" [
          (s."mimic-fn@^2.1.0")
          ];
        "onetime@^5.1.0" = s."onetime@5.1.2";
        "optionator@0.9.1" = f "optionator" "0.9.1" y "4f236a6373dae0566a6d43e1326674f50c291499" [
          (s."deep-is@^0.1.3")
          (s."fast-levenshtein@^2.0.6")
          (s."levn@^0.4.1")
          (s."prelude-ls@^1.2.1")
          (s."type-check@^0.4.0")
          (s."word-wrap@^1.2.3")
          ];
        "optionator@^0.9.1" = s."optionator@0.9.1";
        "ora@5.1.0" = f "ora" "5.1.0" y "b188cf8cd2d4d9b13fd25383bc3e5cba352c94f8" [
          (s."chalk@^4.1.0")
          (s."cli-cursor@^3.1.0")
          (s."cli-spinners@^2.4.0")
          (s."is-interactive@^1.0.0")
          (s."log-symbols@^4.0.0")
          (s."mute-stream@0.0.8")
          (s."strip-ansi@^6.0.0")
          (s."wcwidth@^1.0.1")
          ];
        "ora@^5.1.0" = s."ora@5.1.0";
        "p-cancelable@1.1.0" = f "p-cancelable" "1.1.0" y "d078d15a3af409220c886f1d9a0ca2e441ab26cc" [];
        "p-cancelable@^1.0.0" = s."p-cancelable@1.1.0";
        "p-defer@1.0.0" = f "p-defer" "1.0.0" y "9f6eb182f6c9aa8cd743004a7d4f96b196b0fb0c" [];
        "p-defer@^1.0.0" = s."p-defer@1.0.0";
        "p-event@4.2.0" = f "p-event" "4.2.0" y "af4b049c8acd91ae81083ebd1e6f5cae2044c1b5" [
          (s."p-timeout@^3.1.0")
          ];
        "p-event@^4.2.0" = s."p-event@4.2.0";
        "p-finally@1.0.0" = f "p-finally" "1.0.0" y "3fbcfb15b899a44123b34b6dcc18b724336a2cae" [];
        "p-finally@^1.0.0" = s."p-finally@1.0.0";
        "p-limit@2.3.0" = f "p-limit" "2.3.0" y "3dd33c647a214fdfffd835933eb086da0dc21db1" [
          (s."p-try@^2.0.0")
          ];
        "p-limit@^2.0.0" = s."p-limit@2.3.0";
        "p-limit@^2.2.0" = s."p-limit@2.3.0";
        "p-locate@3.0.0" = f "p-locate" "3.0.0" y "322d69a05c0264b25997d9f40cd8a891ab0064a4" [
          (s."p-limit@^2.0.0")
          ];
        "p-locate@4.1.0" = f "p-locate" "4.1.0" y "a3428bb7088b3a60292f66919278b7c297ad4f07" [
          (s."p-limit@^2.2.0")
          ];
        "p-locate@^3.0.0" = s."p-locate@3.0.0";
        "p-locate@^4.1.0" = s."p-locate@4.1.0";
        "p-map@3.0.0" = f "p-map" "3.0.0" y "d704d9af8a2ba684e2600d9a215983d4141a979d" [
          (s."aggregate-error@^3.0.0")
          ];
        "p-map@4.0.0" = f "p-map" "4.0.0" y "bb2f95a5eda2ec168ec9274e06a747c3e2904d2b" [
          (s."aggregate-error@^3.0.0")
          ];
        "p-map@^3.0.0" = s."p-map@3.0.0";
        "p-map@^4.0.0" = s."p-map@4.0.0";
        "p-timeout@3.2.0" = f "p-timeout" "3.2.0" y "c7e17abc971d2a7962ef83626b35d635acf23dfe" [
          (s."p-finally@^1.0.0")
          ];
        "p-timeout@^3.1.0" = s."p-timeout@3.2.0";
        "p-try@2.2.0" = f "p-try" "2.2.0" y "cb2868540e313d61de58fafbe35ce9004d5540e6" [];
        "p-try@^2.0.0" = s."p-try@2.2.0";
        "package-hash@4.0.0" = f "package-hash" "4.0.0" y "3537f654665ec3cc38827387fc904c163c54f506" [
          (s."graceful-fs@^4.1.15")
          (s."hasha@^5.0.0")
          (s."lodash.flattendeep@^4.4.0")
          (s."release-zalgo@^1.0.0")
          ];
        "package-hash@^4.0.0" = s."package-hash@4.0.0";
        "package-json@6.5.0" = f "package-json" "6.5.0" y "6feedaca35e75725876d0b0e64974697fed145b0" [
          (s."got@^9.6.0")
          (s."registry-auth-token@^4.0.0")
          (s."registry-url@^5.0.0")
          (s."semver@^6.2.0")
          ];
        "package-json@^6.3.0" = s."package-json@6.5.0";
        "parent-module@1.0.1" = f "parent-module" "1.0.1" y "691d2709e78c79fae3a156622452d00762caaaa2" [
          (s."callsites@^3.0.0")
          ];
        "parent-module@^1.0.0" = s."parent-module@1.0.1";
        "parse-json@4.0.0" = f "parse-json" "4.0.0" y "be35f5425be1f7f6c747184f98a788cb99477ee0" [
          (s."error-ex@^1.3.1")
          (s."json-parse-better-errors@^1.0.1")
          ];
        "parse-json@5.1.0" = f "parse-json" "5.1.0" y "f96088cdf24a8faa9aea9a009f2d9d942c999646" [
          (s."@babel/code-frame@^7.0.0")
          (s."error-ex@^1.3.1")
          (s."json-parse-even-better-errors@^2.3.0")
          (s."lines-and-columns@^1.1.6")
          ];
        "parse-json@^4.0.0" = s."parse-json@4.0.0";
        "parse-json@^5.0.0" = s."parse-json@5.1.0";
        "parse-ms@2.1.0" = f "parse-ms" "2.1.0" y "348565a753d4391fa524029956b172cb7753097d" [];
        "parse-ms@^2.1.0" = s."parse-ms@2.1.0";
        "path-exists@3.0.0" = f "path-exists" "3.0.0" y "ce0ebeaa5f78cb18925ea7d810d7b59b010fd515" [];
        "path-exists@4.0.0" = f "path-exists" "4.0.0" y "513bdbe2d3b95d7762e8c1137efa195c6c61b5b3" [];
        "path-exists@^3.0.0" = s."path-exists@3.0.0";
        "path-exists@^4.0.0" = s."path-exists@4.0.0";
        "path-is-absolute@1.0.1" = f "path-is-absolute" "1.0.1" y "174b9268735534ffbc7ace6bf53a5a9e1b5c5f5f" [];
        "path-is-absolute@^1.0.0" = s."path-is-absolute@1.0.1";
        "path-key@3.1.1" = f "path-key" "3.1.1" y "581f6ade658cbba65a0d3380de7753295054f375" [];
        "path-key@^3.1.0" = s."path-key@3.1.1";
        "path-parse@1.0.6" = f "path-parse" "1.0.6" y "d62dbb5679405d72c4737ec58600e9ddcf06d24c" [];
        "path-parse@^1.0.6" = s."path-parse@1.0.6";
        "path-type@4.0.0" = f "path-type" "4.0.0" y "84ed01c0a7ba380afe09d90a8c180dcd9d03043b" [];
        "path-type@^4.0.0" = s."path-type@4.0.0";
        "performance-now@2.1.0" = f "performance-now" "2.1.0" y "6309f4e0e5fa913ec1c69307ae364b4b377c9e7b" [];
        "performance-now@^2.1.0" = s."performance-now@2.1.0";
        "picomatch@2.2.2" = f "picomatch" "2.2.2" y "21f333e9b6b8eaff02468f5146ea406d345f4dad" [];
        "picomatch@^2.0.4" = s."picomatch@2.2.2";
        "picomatch@^2.0.5" = s."picomatch@2.2.2";
        "picomatch@^2.2.1" = s."picomatch@2.2.2";
        "picomatch@^2.2.2" = s."picomatch@2.2.2";
        "pify@2.3.0" = f "pify" "2.3.0" y "ed141a6ac043a849ea588498e7dca8b15330e90c" [];
        "pify@4.0.1" = f "pify" "4.0.1" y "4b2cd25c50d598735c50292224fd8c6df41e3231" [];
        "pify@^2.3.0" = s."pify@2.3.0";
        "pify@^4.0.1" = s."pify@4.0.1";
        "pkg-conf@3.1.0" = f "pkg-conf" "3.1.0" y "d9f9c75ea1bae0e77938cde045b276dac7cc69ae" [
          (s."find-up@^3.0.0")
          (s."load-json-file@^5.2.0")
          ];
        "pkg-conf@^3.1.0" = s."pkg-conf@3.1.0";
        "pkg-dir@4.2.0" = f "pkg-dir" "4.2.0" y "f099133df7ede422e81d1d8448270eeb3e4261f3" [
          (s."find-up@^4.0.0")
          ];
        "pkg-dir@^4.1.0" = s."pkg-dir@4.2.0";
        "pkg-dir@^4.2.0" = s."pkg-dir@4.2.0";
        "plur@4.0.0" = f "plur" "4.0.0" y "729aedb08f452645fe8c58ef115bf16b0a73ef84" [
          (s."irregular-plurals@^3.2.0")
          ];
        "plur@^4.0.0" = s."plur@4.0.0";
        "postcss-import@12.0.1" = f "postcss-import" "12.0.1" y "cf8c7ab0b5ccab5649024536e565f841928b7153" [
          (s."postcss@^7.0.1")
          (s."postcss-value-parser@^3.2.3")
          (s."read-cache@^1.0.0")
          (s."resolve@^1.1.7")
          ];
        "postcss-import@^12.0.0" = s."postcss-import@12.0.1";
        "postcss-load-config@2.1.2" = f "postcss-load-config" "2.1.2" y "c5ea504f2c4aef33c7359a34de3573772ad7502a" [
          (s."cosmiconfig@^5.0.0")
          (s."import-cwd@^2.0.0")
          ];
        "postcss-load-config@^2.1.1" = s."postcss-load-config@2.1.2";
        "postcss-reporter@7.0.1" = f "postcss-reporter" "7.0.1" y "463780d0d8d64f356403eba901fdeae71d988f2b" [
          (s."colorette@^1.2.1")
          (s."lodash.difference@^4.5.0")
          (s."lodash.forown@^4.4.0")
          (s."lodash.get@^4.4.2")
          (s."lodash.groupby@^4.6.0")
          (s."lodash.sortby@^4.7.0")
          (s."log-symbols@^4.0.0")
          ];
        "postcss-reporter@^7.0.0" = s."postcss-reporter@7.0.1";
        "postcss-value-parser@3.3.1" = f "postcss-value-parser" "3.3.1" y "9ff822547e2893213cf1c30efa51ac5fd1ba8281" [];
        "postcss-value-parser@^3.2.3" = s."postcss-value-parser@3.3.1";
        "postcss@7.0.35" = f "postcss" "7.0.35" y "d2be00b998f7f211d8a276974079f2e92b970e24" [
          (s."chalk@^2.4.2")
          (s."source-map@^0.6.1")
          (s."supports-color@^6.1.0")
          ];
        "postcss@8.1.1" = f "postcss" "8.1.1" y "c3a287dd10e4f6c84cb3791052b96a5d859c9389" [
          (s."colorette@^1.2.1")
          (s."line-column@^1.0.2")
          (s."nanoid@^3.1.12")
          (s."source-map@^0.6.1")
          ];
        "postcss@^7.0.1" = s."postcss@7.0.35";
        "postcss@^8.0.4" = s."postcss@8.1.1";
        "postcss@^8.1.0" = s."postcss@8.1.1";
        "prelude-ls@1.2.1" = f "prelude-ls" "1.2.1" y "debc6489d7a6e6b0e7611888cec880337d316396" [];
        "prelude-ls@^1.2.1" = s."prelude-ls@1.2.1";
        "prepend-http@2.0.0" = f "prepend-http" "2.0.0" y "e92434bfa5ea8c19f41cdfd401d741a3c819d897" [];
        "prepend-http@^2.0.0" = s."prepend-http@2.0.0";
        "prettier@2.1.2" = f "prettier" "2.1.2" y "3050700dae2e4c8b67c4c3f666cdb8af405e1ce5" [];
        "prettier@~2.1.0" = s."prettier@2.1.2";
        "pretty-hrtime@1.0.3" = f "pretty-hrtime" "1.0.3" y "b7e3ea42435a4c9b2759d99e0f201eb195802ee1" [];
        "pretty-hrtime@^1.0.3" = s."pretty-hrtime@1.0.3";
        "pretty-ms@7.0.1" = f "pretty-ms" "7.0.1" y "7d903eaab281f7d8e03c66f867e239dc32fb73e8" [
          (s."parse-ms@^2.1.0")
          ];
        "pretty-ms@^7.0.1" = s."pretty-ms@7.0.1";
        "process-on-spawn@1.0.0" = f "process-on-spawn" "1.0.0" y "95b05a23073d30a17acfdc92a440efd2baefdc93" [
          (s."fromentries@^1.2.0")
          ];
        "process-on-spawn@^1.0.0" = s."process-on-spawn@1.0.0";
        "progress@2.0.3" = f "progress" "2.0.3" y "7e8cf8d8f5b8f239c1bc68beb4eb78567d572ef8" [];
        "progress@^2.0.0" = s."progress@2.0.3";
        "psl@1.8.0" = f "psl" "1.8.0" y "9326f8bcfb013adcc005fdff056acce020e51c24" [];
        "psl@^1.1.28" = s."psl@1.8.0";
        "pump@3.0.0" = f "pump" "3.0.0" y "b4a2116815bde2f4e1ea602354e8c75565107a64" [
          (s."end-of-stream@^1.1.0")
          (s."once@^1.3.1")
          ];
        "pump@^3.0.0" = s."pump@3.0.0";
        "punycode@2.1.1" = f "punycode" "2.1.1" y "b58b010ac40c22c5657616c8d2c2c02c7bf479ec" [];
        "punycode@^2.1.0" = s."punycode@2.1.1";
        "punycode@^2.1.1" = s."punycode@2.1.1";
        "pupa@2.0.1" = f "pupa" "2.0.1" y "dbdc9ff48ffbea4a26a069b6f9f7abb051008726" [
          (s."escape-goat@^2.0.0")
          ];
        "pupa@^2.0.1" = s."pupa@2.0.1";
        "qs@6.5.2" = f "qs" "6.5.2" y "cb3ae806e8740444584ef154ce8ee98d403f3e36" [];
        "qs@~6.5.2" = s."qs@6.5.2";
        "rc@1.2.8" = f "rc" "1.2.8" y "cd924bf5200a075b83c188cd6b9e211b7fc0d3ed" [
          (s."deep-extend@^0.6.0")
          (s."ini@~1.3.0")
          (s."minimist@^1.2.0")
          (s."strip-json-comments@~2.0.1")
          ];
        "rc@^1.2.8" = s."rc@1.2.8";
        "read-cache@1.0.0" = f "read-cache" "1.0.0" y "e664ef31161166c9751cdbe8dbcf86b5fb58f774" [
          (s."pify@^2.3.0")
          ];
        "read-cache@^1.0.0" = s."read-cache@1.0.0";
        "read-pkg@5.2.0" = f "read-pkg" "5.2.0" y "7bf295438ca5a33e56cd30e053b34ee7250c93cc" [
          (s."@types/normalize-package-data@^2.4.0")
          (s."normalize-package-data@^2.5.0")
          (s."parse-json@^5.0.0")
          (s."type-fest@^0.6.0")
          ];
        "read-pkg@^5.2.0" = s."read-pkg@5.2.0";
        "readdirp@3.4.0" = f "readdirp" "3.4.0" y "9fdccdf9e9155805449221ac645e8303ab5b9ada" [
          (s."picomatch@^2.2.1")
          ];
        "readdirp@~3.4.0" = s."readdirp@3.4.0";
        "regexpp@3.1.0" = f "regexpp" "3.1.0" y "206d0ad0a5648cffbdb8ae46438f3dc51c9f78e2" [];
        "regexpp@^3.1.0" = s."regexpp@3.1.0";
        "registry-auth-token@4.2.0" = f "registry-auth-token" "4.2.0" y "1d37dffda72bbecd0f581e4715540213a65eb7da" [
          (s."rc@^1.2.8")
          ];
        "registry-auth-token@^4.0.0" = s."registry-auth-token@4.2.0";
        "registry-url@5.1.0" = f "registry-url" "5.1.0" y "e98334b50d5434b81136b44ec638d9c2009c5009" [
          (s."rc@^1.2.8")
          ];
        "registry-url@^5.0.0" = s."registry-url@5.1.0";
        "release-zalgo@1.0.0" = f "release-zalgo" "1.0.0" y "09700b7e5074329739330e535c5a90fb67851730" [
          (s."es6-error@^4.0.1")
          ];
        "release-zalgo@^1.0.0" = s."release-zalgo@1.0.0";
        "request@2.88.2" = f "request" "2.88.2" y "d73c918731cb5a87da047e207234146f664d12b3" [
          (s."aws-sign2@~0.7.0")
          (s."aws4@^1.8.0")
          (s."caseless@~0.12.0")
          (s."combined-stream@~1.0.6")
          (s."extend@~3.0.2")
          (s."forever-agent@~0.6.1")
          (s."form-data@~2.3.2")
          (s."har-validator@~5.1.3")
          (s."http-signature@~1.2.0")
          (s."is-typedarray@~1.0.0")
          (s."isstream@~0.1.2")
          (s."json-stringify-safe@~5.0.1")
          (s."mime-types@~2.1.19")
          (s."oauth-sign@~0.9.0")
          (s."performance-now@^2.1.0")
          (s."qs@~6.5.2")
          (s."safe-buffer@^5.1.2")
          (s."tough-cookie@~2.5.0")
          (s."tunnel-agent@^0.6.0")
          (s."uuid@^3.3.2")
          ];
        "request@^2.88.2" = s."request@2.88.2";
        "require-directory@2.1.1" = f "require-directory" "2.1.1" y "8c64ad5fd30dab1c976e2344ffe7f792a6a6df42" [];
        "require-directory@^2.1.1" = s."require-directory@2.1.1";
        "require-main-filename@2.0.0" = f "require-main-filename" "2.0.0" y "d0b329ecc7cc0f61649f62215be69af54aa8989b" [];
        "require-main-filename@^2.0.0" = s."require-main-filename@2.0.0";
        "resolve-cwd@3.0.0" = f "resolve-cwd" "3.0.0" y "0f0075f1bb2544766cf73ba6a6e2adfebcb13f2d" [
          (s."resolve-from@^5.0.0")
          ];
        "resolve-cwd@^3.0.0" = s."resolve-cwd@3.0.0";
        "resolve-from@3.0.0" = f "resolve-from" "3.0.0" y "b22c7af7d9d6881bc8b6e653335eebcb0a188748" [];
        "resolve-from@4.0.0" = f "resolve-from" "4.0.0" y "4abcd852ad32dd7baabfe9b40e00a36db5f392e6" [];
        "resolve-from@5.0.0" = f "resolve-from" "5.0.0" y "c35225843df8f776df21c57557bc087e9dfdfc69" [];
        "resolve-from@^3.0.0" = s."resolve-from@3.0.0";
        "resolve-from@^4.0.0" = s."resolve-from@4.0.0";
        "resolve-from@^5.0.0" = s."resolve-from@5.0.0";
        "resolve@1.17.0" = f "resolve" "1.17.0" y "b25941b54968231cc2d1bb76a79cb7f2c0bf8444" [
          (s."path-parse@^1.0.6")
          ];
        "resolve@^1.1.7" = s."resolve@1.17.0";
        "resolve@^1.10.0" = s."resolve@1.17.0";
        "resolve@^1.3.2" = s."resolve@1.17.0";
        "responselike@1.0.2" = f "responselike" "1.0.2" y "918720ef3b631c5642be068f15ade5a46f4ba1e7" [
          (s."lowercase-keys@^1.0.0")
          ];
        "responselike@^1.0.2" = s."responselike@1.0.2";
        "restore-cursor@3.1.0" = f "restore-cursor" "3.1.0" y "39f67c54b3a7a58cea5236d95cf0034239631f7e" [
          (s."onetime@^5.1.0")
          (s."signal-exit@^3.0.2")
          ];
        "restore-cursor@^3.1.0" = s."restore-cursor@3.1.0";
        "reusify@1.0.4" = f "reusify" "1.0.4" y "90da382b1e126efc02146e90845a88db12925d76" [];
        "reusify@^1.0.4" = s."reusify@1.0.4";
        "rimraf@2.6.3" = f "rimraf" "2.6.3" y "b2d104fe0d8fb27cf9e0a1cda8262dd3833c6cab" [
          (s."glob@^7.1.3")
          ];
        "rimraf@3.0.2" = f "rimraf" "3.0.2" y "f1a5402ba6220ad52cc1282bac1ae3aa49fd061a" [
          (s."glob@^7.1.3")
          ];
        "rimraf@^3.0.0" = s."rimraf@3.0.2";
        "rimraf@^3.0.2" = s."rimraf@3.0.2";
        "run-parallel@1.1.9" = f "run-parallel" "1.1.9" y "c9dd3a7cf9f4b2c4b6244e173a6ed866e61dd679" [];
        "run-parallel@^1.1.9" = s."run-parallel@1.1.9";
        "safe-buffer@5.1.2" = f "safe-buffer" "5.1.2" y "991ec69d296e0313747d59bdfd2b745c35f8828d" [];
        "safe-buffer@5.2.1" = f "safe-buffer" "5.2.1" y "1eaf9fa9bdb1fdd4ec75f58f9cdb4e6b7827eec6" [];
        "safe-buffer@^5.0.1" = s."safe-buffer@5.2.1";
        "safe-buffer@^5.1.2" = s."safe-buffer@5.2.1";
        "safe-buffer@~5.1.1" = s."safe-buffer@5.1.2";
        "safer-buffer@2.1.2" = f "safer-buffer" "2.1.2" y "44fa161b0187b9549dd84bb91802f9bd8385cd6a" [];
        "safer-buffer@^2.0.2" = s."safer-buffer@2.1.2";
        "safer-buffer@^2.1.0" = s."safer-buffer@2.1.2";
        "safer-buffer@~2.1.0" = s."safer-buffer@2.1.2";
        "semver-diff@3.1.1" = f "semver-diff" "3.1.1" y "05f77ce59f325e00e2706afd67bb506ddb1ca32b" [
          (s."semver@^6.3.0")
          ];
        "semver-diff@^3.1.1" = s."semver-diff@3.1.1";
        "semver@2 || 3 || 4 || 5" = s."semver@5.7.1";
        "semver@5.7.1" = f "semver" "5.7.1" y "a954f931aeba508d307bbf069eff0c01c96116f7" [];
        "semver@6.3.0" = f "semver" "6.3.0" y "ee0a64c8af5e8ceea67687b133761e1becbd1d3d" [];
        "semver@7.3.2" = f "semver" "7.3.2" y "604962b052b81ed0786aae84389ffba70ffd3938" [];
        "semver@^5.4.1" = s."semver@5.7.1";
        "semver@^6.0.0" = s."semver@6.3.0";
        "semver@^6.2.0" = s."semver@6.3.0";
        "semver@^6.3.0" = s."semver@6.3.0";
        "semver@^7.2.1" = s."semver@7.3.2";
        "semver@^7.3.2" = s."semver@7.3.2";
        "serialize-error@2.1.0" = f "serialize-error" "2.1.0" y "50b679d5635cdf84667bdc8e59af4e5b81d5f60a" [];
        "serialize-error@^2.1.0" = s."serialize-error@2.1.0";
        "set-blocking@2.0.0" = f "set-blocking" "2.0.0" y "045f9782d011ae9a6803ddd382b24392b3d890f7" [];
        "set-blocking@^2.0.0" = s."set-blocking@2.0.0";
        "shebang-command@2.0.0" = f "shebang-command" "2.0.0" y "ccd0af4f8835fbdc265b82461aaf0c36663f34ea" [
          (s."shebang-regex@^3.0.0")
          ];
        "shebang-command@^2.0.0" = s."shebang-command@2.0.0";
        "shebang-regex@3.0.0" = f "shebang-regex" "3.0.0" y "ae16f1644d873ecad843b0307b143362d4c42172" [];
        "shebang-regex@^3.0.0" = s."shebang-regex@3.0.0";
        "signal-exit@3.0.3" = f "signal-exit" "3.0.3" y "a1410c2edd8f077b08b4e253c8eacfcaf057461c" [];
        "signal-exit@^3.0.2" = s."signal-exit@3.0.3";
        "slash@3.0.0" = f "slash" "3.0.0" y "6539be870c165adbd5240220dbe361f1bc4d4634" [];
        "slash@^3.0.0" = s."slash@3.0.0";
        "slice-ansi@2.1.0" = f "slice-ansi" "2.1.0" y "cacd7693461a637a5788d92a7dd4fba068e81636" [
          (s."ansi-styles@^3.2.0")
          (s."astral-regex@^1.0.0")
          (s."is-fullwidth-code-point@^2.0.0")
          ];
        "slice-ansi@3.0.0" = f "slice-ansi" "3.0.0" y "31ddc10930a1b7e0b67b08c96c2f49b77a789787" [
          (s."ansi-styles@^4.0.0")
          (s."astral-regex@^2.0.0")
          (s."is-fullwidth-code-point@^3.0.0")
          ];
        "slice-ansi@^2.1.0" = s."slice-ansi@2.1.0";
        "slice-ansi@^3.0.0" = s."slice-ansi@3.0.0";
        "source-map-support@0.5.19" = f "source-map-support" "0.5.19" y "a98b62f86dcaf4f67399648c085291ab9e8fed61" [
          (s."buffer-from@^1.0.0")
          (s."source-map@^0.6.0")
          ];
        "source-map-support@^0.5.19" = s."source-map-support@0.5.19";
        "source-map@0.5.7" = f "source-map" "0.5.7" y "8a039d2d1021d22d1ea14c80d8ea468ba2ef3fcc" [];
        "source-map@0.6.1" = f "source-map" "0.6.1" y "74722af32e9614e9c287a8d0bbde48b5e2f1a263" [];
        "source-map@^0.5.0" = s."source-map@0.5.7";
        "source-map@^0.6.0" = s."source-map@0.6.1";
        "source-map@^0.6.1" = s."source-map@0.6.1";
        "spawn-wrap@2.0.0" = f "spawn-wrap" "2.0.0" y "103685b8b8f9b79771318827aa78650a610d457e" [
          (s."foreground-child@^2.0.0")
          (s."is-windows@^1.0.2")
          (s."make-dir@^3.0.0")
          (s."rimraf@^3.0.0")
          (s."signal-exit@^3.0.2")
          (s."which@^2.0.1")
          ];
        "spawn-wrap@^2.0.0" = s."spawn-wrap@2.0.0";
        "spdx-correct@3.1.1" = f "spdx-correct" "3.1.1" y "dece81ac9c1e6713e5f7d1b6f17d468fa53d89a9" [
          (s."spdx-expression-parse@^3.0.0")
          (s."spdx-license-ids@^3.0.0")
          ];
        "spdx-correct@^3.0.0" = s."spdx-correct@3.1.1";
        "spdx-exceptions@2.3.0" = f "spdx-exceptions" "2.3.0" y "3f28ce1a77a00372683eade4a433183527a2163d" [];
        "spdx-exceptions@^2.1.0" = s."spdx-exceptions@2.3.0";
        "spdx-expression-parse@3.0.1" = f "spdx-expression-parse" "3.0.1" y "cf70f50482eefdc98e3ce0a6833e4a53ceeba679" [
          (s."spdx-exceptions@^2.1.0")
          (s."spdx-license-ids@^3.0.0")
          ];
        "spdx-expression-parse@^3.0.0" = s."spdx-expression-parse@3.0.1";
        "spdx-license-ids@3.0.6" = f "spdx-license-ids" "3.0.6" y "c80757383c28abf7296744998cbc106ae8b854ce" [];
        "spdx-license-ids@^3.0.0" = s."spdx-license-ids@3.0.6";
        "sprintf-js@1.0.3" = f "sprintf-js" "1.0.3" y "04e6926f662895354f3dd015203633b857297e2c" [];
        "sprintf-js@~1.0.2" = s."sprintf-js@1.0.3";
        "sshpk@1.16.1" = f "sshpk" "1.16.1" y "fb661c0bef29b39db40769ee39fa70093d6f6877" [
          (s."asn1@~0.2.3")
          (s."assert-plus@^1.0.0")
          (s."bcrypt-pbkdf@^1.0.0")
          (s."dashdash@^1.12.0")
          (s."ecc-jsbn@~0.1.1")
          (s."getpass@^0.1.1")
          (s."jsbn@~0.1.0")
          (s."safer-buffer@^2.0.2")
          (s."tweetnacl@~0.14.0")
          ];
        "sshpk@^1.7.0" = s."sshpk@1.16.1";
        "stack-utils@2.0.2" = f "stack-utils" "2.0.2" y "5cf48b4557becb4638d0bc4f21d23f5d19586593" [
          (s."escape-string-regexp@^2.0.0")
          ];
        "stack-utils@^2.0.2" = s."stack-utils@2.0.2";
        "string-width@3.1.0" = f "string-width" "3.1.0" y "22767be21b62af1081574306f69ac51b62203961" [
          (s."emoji-regex@^7.0.1")
          (s."is-fullwidth-code-point@^2.0.0")
          (s."strip-ansi@^5.1.0")
          ];
        "string-width@4.2.0" = f "string-width" "4.2.0" y "952182c46cc7b2c313d1596e623992bd163b72b5" [
          (s."emoji-regex@^8.0.0")
          (s."is-fullwidth-code-point@^3.0.0")
          (s."strip-ansi@^6.0.0")
          ];
        "string-width@^3.0.0" = s."string-width@3.1.0";
        "string-width@^4.0.0" = s."string-width@4.2.0";
        "string-width@^4.1.0" = s."string-width@4.2.0";
        "string-width@^4.2.0" = s."string-width@4.2.0";
        "strip-ansi@4.0.0" = f "strip-ansi" "4.0.0" y "a8479022eb1ac368a871389b635262c505ee368f" [
          (s."ansi-regex@^3.0.0")
          ];
        "strip-ansi@5.2.0" = f "strip-ansi" "5.2.0" y "8c9a536feb6afc962bdfa5b104a5091c1ad9c0ae" [
          (s."ansi-regex@^4.1.0")
          ];
        "strip-ansi@6.0.0" = f "strip-ansi" "6.0.0" y "0b1571dd7669ccd4f3e06e14ef1eed26225ae532" [
          (s."ansi-regex@^5.0.0")
          ];
        "strip-ansi@^4.0.0" = s."strip-ansi@4.0.0";
        "strip-ansi@^5.1.0" = s."strip-ansi@5.2.0";
        "strip-ansi@^6.0.0" = s."strip-ansi@6.0.0";
        "strip-bom@3.0.0" = f "strip-bom" "3.0.0" y "2334c18e9c759f7bdd56fdef7e9ae3d588e68ed3" [];
        "strip-bom@4.0.0" = f "strip-bom" "4.0.0" y "9c3505c1db45bcedca3d9cf7a16f5c5aa3901878" [];
        "strip-bom@^3.0.0" = s."strip-bom@3.0.0";
        "strip-bom@^4.0.0" = s."strip-bom@4.0.0";
        "strip-json-comments@2.0.1" = f "strip-json-comments" "2.0.1" y "3c531942e908c2697c0ec344858c286c7ca0a60a" [];
        "strip-json-comments@3.1.1" = f "strip-json-comments" "3.1.1" y "31f1281b3832630434831c310c01cccda8cbe006" [];
        "strip-json-comments@^3.1.0" = s."strip-json-comments@3.1.1";
        "strip-json-comments@^3.1.1" = s."strip-json-comments@3.1.1";
        "strip-json-comments@~2.0.1" = s."strip-json-comments@2.0.1";
        "sugarss@3.0.1" = f "sugarss" "3.0.1" y "1e4e315b3b321eec477ef9617c8964bcf3833b0c" [
          (s."postcss@^8.1.0")
          ];
        "sugarss@^3.0.0" = s."sugarss@3.0.1";
        "supertap@1.0.0" = f "supertap" "1.0.0" y "bd9751c7fafd68c68cf8222a29892206a119fa9e" [
          (s."arrify@^1.0.1")
          (s."indent-string@^3.2.0")
          (s."js-yaml@^3.10.0")
          (s."serialize-error@^2.1.0")
          (s."strip-ansi@^4.0.0")
          ];
        "supertap@^1.0.0" = s."supertap@1.0.0";
        "supports-color@5.5.0" = f "supports-color" "5.5.0" y "e2e69a44ac8772f78a1ec0b35b689df6530efc8f" [
          (s."has-flag@^3.0.0")
          ];
        "supports-color@6.1.0" = f "supports-color" "6.1.0" y "0764abc69c63d5ac842dd4867e8d025e880df8f3" [
          (s."has-flag@^3.0.0")
          ];
        "supports-color@7.2.0" = f "supports-color" "7.2.0" y "1b7dcdcb32b8138801b3e478ba6a51caa89648da" [
          (s."has-flag@^4.0.0")
          ];
        "supports-color@^5.3.0" = s."supports-color@5.5.0";
        "supports-color@^6.1.0" = s."supports-color@6.1.0";
        "supports-color@^7.1.0" = s."supports-color@7.2.0";
        "table@5.4.6" = f "table" "5.4.6" y "1292d19500ce3f86053b05f0e8e7e4a3bb21079e" [
          (s."ajv@^6.10.2")
          (s."lodash@^4.17.14")
          (s."slice-ansi@^2.1.0")
          (s."string-width@^3.0.0")
          ];
        "table@^5.2.3" = s."table@5.4.6";
        "temp-dir@2.0.0" = f "temp-dir" "2.0.0" y "bde92b05bdfeb1516e804c9c00ad45177f31321e" [];
        "temp-dir@^2.0.0" = s."temp-dir@2.0.0";
        "term-size@2.2.0" = f "term-size" "2.2.0" y "1f16adedfe9bdc18800e1776821734086fcc6753" [];
        "term-size@^2.1.0" = s."term-size@2.2.0";
        "test-exclude@6.0.0" = f "test-exclude" "6.0.0" y "04a8698661d805ea6fa293b6cb9e63ac044ef15e" [
          (s."@istanbuljs/schema@^0.1.2")
          (s."glob@^7.1.4")
          (s."minimatch@^3.0.4")
          ];
        "test-exclude@^6.0.0" = s."test-exclude@6.0.0";
        "text-table@0.2.0" = f "text-table" "0.2.0" y "7f5ee823ae805207c00af2df4a84ec3fcfa570b4" [];
        "text-table@^0.2.0" = s."text-table@0.2.0";
        "time-zone@1.0.0" = f "time-zone" "1.0.0" y "99c5bf55958966af6d06d83bdf3800dc82faec5d" [];
        "time-zone@^1.0.0" = s."time-zone@1.0.0";
        "to-fast-properties@2.0.0" = f "to-fast-properties" "2.0.0" y "dc5e698cbd079265bc73e0377681a4e4e83f616e" [];
        "to-fast-properties@^2.0.0" = s."to-fast-properties@2.0.0";
        "to-readable-stream@1.0.0" = f "to-readable-stream" "1.0.0" y "ce0aa0c2f3df6adf852efb404a783e77c0475771" [];
        "to-readable-stream@^1.0.0" = s."to-readable-stream@1.0.0";
        "to-regex-range@5.0.1" = f "to-regex-range" "5.0.1" y "1648c44aae7c8d988a326018ed72f5b4dd0392e4" [
          (s."is-number@^7.0.0")
          ];
        "to-regex-range@^5.0.1" = s."to-regex-range@5.0.1";
        "tough-cookie@2.5.0" = f "tough-cookie" "2.5.0" y "cd9fb2a0aa1d5a12b473bd9fb96fa3dcff65ade2" [
          (s."psl@^1.1.28")
          (s."punycode@^2.1.1")
          ];
        "tough-cookie@~2.5.0" = s."tough-cookie@2.5.0";
        "trim-off-newlines@1.0.1" = f "trim-off-newlines" "1.0.1" y "9f9ba9d9efa8764c387698bcbfeb2c848f11adb3" [];
        "trim-off-newlines@^1.0.1" = s."trim-off-newlines@1.0.1";
        "tunnel-agent@0.6.0" = f "tunnel-agent" "0.6.0" y "27a5dea06b36b04a0a9966774b290868f0fc40fd" [
          (s."safe-buffer@^5.0.1")
          ];
        "tunnel-agent@^0.6.0" = s."tunnel-agent@0.6.0";
        "tweetnacl@0.14.5" = f "tweetnacl" "0.14.5" y "5ae68177f192d4456269d108afa93ff8743f4f64" [];
        "tweetnacl@^0.14.3" = s."tweetnacl@0.14.5";
        "tweetnacl@~0.14.0" = s."tweetnacl@0.14.5";
        "type-check@0.4.0" = f "type-check" "0.4.0" y "07b8203bfa7056c0657050e3ccd2c37730bab8f1" [
          (s."prelude-ls@^1.2.1")
          ];
        "type-check@^0.4.0" = s."type-check@0.4.0";
        "type-check@~0.4.0" = s."type-check@0.4.0";
        "type-fest@0.3.1" = f "type-fest" "0.3.1" y "63d00d204e059474fe5e1b7c011112bbd1dc29e1" [];
        "type-fest@0.6.0" = f "type-fest" "0.6.0" y "8d2a2370d3df886eb5c90ada1c5bf6188acf838b" [];
        "type-fest@0.8.1" = f "type-fest" "0.8.1" y "09e249ebde851d3b1e48d27c105444667f17b83d" [];
        "type-fest@^0.3.0" = s."type-fest@0.3.1";
        "type-fest@^0.6.0" = s."type-fest@0.6.0";
        "type-fest@^0.8.0" = s."type-fest@0.8.1";
        "type-fest@^0.8.1" = s."type-fest@0.8.1";
        "typedarray-to-buffer@3.1.5" = f "typedarray-to-buffer" "3.1.5" y "a97ee7a9ff42691b9f783ff1bc5112fe3fca9080" [
          (s."is-typedarray@^1.0.0")
          ];
        "typedarray-to-buffer@^3.1.5" = s."typedarray-to-buffer@3.1.5";
        "unique-string@2.0.0" = f "unique-string" "2.0.0" y "39c6451f81afb2749de2b233e3f7c5e8843bd89d" [
          (s."crypto-random-string@^2.0.0")
          ];
        "unique-string@^2.0.0" = s."unique-string@2.0.0";
        "universalify@1.0.0" = f "universalify" "1.0.0" y "b61a1da173e8435b2fe3c67d29b9adf8594bd16d" [];
        "universalify@^1.0.0" = s."universalify@1.0.0";
        "update-notifier@4.1.3" = f "update-notifier" "4.1.3" y "be86ee13e8ce48fb50043ff72057b5bd598e1ea3" [
          (s."boxen@^4.2.0")
          (s."chalk@^3.0.0")
          (s."configstore@^5.0.1")
          (s."has-yarn@^2.1.0")
          (s."import-lazy@^2.1.0")
          (s."is-ci@^2.0.0")
          (s."is-installed-globally@^0.3.1")
          (s."is-npm@^4.0.0")
          (s."is-yarn-global@^0.3.0")
          (s."latest-version@^5.0.0")
          (s."pupa@^2.0.1")
          (s."semver-diff@^3.1.1")
          (s."xdg-basedir@^4.0.0")
          ];
        "update-notifier@^4.1.1" = s."update-notifier@4.1.3";
        "uri-js@4.4.0" = f "uri-js" "4.4.0" y "aa714261de793e8a82347a7bcc9ce74e86f28602" [
          (s."punycode@^2.1.0")
          ];
        "uri-js@^4.2.2" = s."uri-js@4.4.0";
        "url-parse-lax@3.0.0" = f "url-parse-lax" "3.0.0" y "16b5cafc07dbe3676c1b1999177823d6503acb0c" [
          (s."prepend-http@^2.0.0")
          ];
        "url-parse-lax@^3.0.0" = s."url-parse-lax@3.0.0";
        "uuid@3.4.0" = f "uuid" "3.4.0" y "b23e4358afa8a202fe7a100af1f5f883f02007ee" [];
        "uuid@8.3.1" = f "uuid" "8.3.1" y "2ba2e6ca000da60fce5a196954ab241131e05a31" [];
        "uuid@^3.3.2" = s."uuid@3.4.0";
        "uuid@^3.3.3" = s."uuid@3.4.0";
        "uuid@^8.0.0" = s."uuid@8.3.1";
        "v8-compile-cache@2.1.1" = f "v8-compile-cache" "2.1.1" y "54bc3cdd43317bca91e35dcaf305b1a7237de745" [];
        "v8-compile-cache@^2.0.3" = s."v8-compile-cache@2.1.1";
        "validate-npm-package-license@3.0.4" = f "validate-npm-package-license" "3.0.4" y "fc91f6b9c7ba15c857f4cb2c5defeec39d4f410a" [
          (s."spdx-correct@^3.0.0")
          (s."spdx-expression-parse@^3.0.0")
          ];
        "validate-npm-package-license@^3.0.1" = s."validate-npm-package-license@3.0.4";
        "verror@1.10.0" = f "verror" "1.10.0" y "3a105ca17053af55d6e270c1f8288682e18da400" [
          (s."assert-plus@^1.0.0")
          (s."core-util-is@1.0.2")
          (s."extsprintf@^1.2.0")
          ];
        "wcwidth@1.0.1" = f "wcwidth" "1.0.1" y "f0b0dcf915bc5ff1528afadb2c0e17b532da2fe8" [
          (s."defaults@^1.0.3")
          ];
        "wcwidth@^1.0.1" = s."wcwidth@1.0.1";
        "well-known-symbols@2.0.0" = f "well-known-symbols" "2.0.0" y "e9c7c07dbd132b7b84212c8174391ec1f9871ba5" [];
        "well-known-symbols@^2.0.0" = s."well-known-symbols@2.0.0";
        "which-module@2.0.0" = f "which-module" "2.0.0" y "d9ef07dce77b9902b8a3a8fa4b31c3e3f7e6e87a" [];
        "which-module@^2.0.0" = s."which-module@2.0.0";
        "which@2.0.2" = f "which" "2.0.2" y "7c6a8dd0a636a0327e10b59c9286eee93f3f51b1" [
          (s."isexe@^2.0.0")
          ];
        "which@^2.0.1" = s."which@2.0.2";
        "widest-line@3.1.0" = f "widest-line" "3.1.0" y "8292333bbf66cb45ff0de1603b136b7ae1496eca" [
          (s."string-width@^4.0.0")
          ];
        "widest-line@^3.1.0" = s."widest-line@3.1.0";
        "word-wrap@1.2.3" = f "word-wrap" "1.2.3" y "610636f6b1f703891bd34771ccb17fb93b47079c" [];
        "word-wrap@^1.2.3" = s."word-wrap@1.2.3";
        "wrap-ansi@6.2.0" = f "wrap-ansi" "6.2.0" y "e9393ba07102e6c91a3b221478f0257cd2856e53" [
          (s."ansi-styles@^4.0.0")
          (s."string-width@^4.1.0")
          (s."strip-ansi@^6.0.0")
          ];
        "wrap-ansi@7.0.0" = f "wrap-ansi" "7.0.0" y "67e145cff510a6a6984bdf1152911d69d2eb9e43" [
          (s."ansi-styles@^4.0.0")
          (s."string-width@^4.1.0")
          (s."strip-ansi@^6.0.0")
          ];
        "wrap-ansi@^6.2.0" = s."wrap-ansi@6.2.0";
        "wrap-ansi@^7.0.0" = s."wrap-ansi@7.0.0";
        "wrappy@1" = s."wrappy@1.0.2";
        "wrappy@1.0.2" = f "wrappy" "1.0.2" y "b5243d8f3ec1aa35f1364605bc0d1036e30ab69f" [];
        "write-file-atomic@3.0.3" = f "write-file-atomic" "3.0.3" y "56bd5c5a5c70481cd19c571bd39ab965a5de56e8" [
          (s."imurmurhash@^0.1.4")
          (s."is-typedarray@^1.0.0")
          (s."signal-exit@^3.0.2")
          (s."typedarray-to-buffer@^3.1.5")
          ];
        "write-file-atomic@^3.0.0" = s."write-file-atomic@3.0.3";
        "write-file-atomic@^3.0.3" = s."write-file-atomic@3.0.3";
        "write@1.0.3" = f "write" "1.0.3" y "0800e14523b923a387e415123c865616aae0f5c3" [
          (s."mkdirp@^0.5.1")
          ];
        "xdg-basedir@4.0.0" = f "xdg-basedir" "4.0.0" y "4bc8d9984403696225ef83a1573cbbcb4e79db13" [];
        "xdg-basedir@^4.0.0" = s."xdg-basedir@4.0.0";
        "y18n@4.0.0" = f "y18n" "4.0.0" y "95ef94f85ecc81d007c264e190a120f0a3c8566b" [];
        "y18n@5.0.2" = f "y18n" "5.0.2" y "48218df5da2731b4403115c39a1af709c873f829" [];
        "y18n@^4.0.0" = s."y18n@4.0.0";
        "y18n@^5.0.1" = s."y18n@5.0.2";
        "yargs-parser@18.1.3" = f "yargs-parser" "18.1.3" y "be68c4975c6b2abf469236b0c870362fab09a7b0" [
          (s."camelcase@^5.0.0")
          (s."decamelize@^1.2.0")
          ];
        "yargs-parser@20.2.1" = f "yargs-parser" "20.2.1" y "28f3773c546cdd8a69ddae68116b48a5da328e77" [];
        "yargs-parser@^18.1.2" = s."yargs-parser@18.1.3";
        "yargs-parser@^20.0.0" = s."yargs-parser@20.2.1";
        "yargs@15.4.1" = f "yargs" "15.4.1" y "0d87a16de01aee9d8bec2bfbf74f67851730f4f8" [
          (s."cliui@^6.0.0")
          (s."decamelize@^1.2.0")
          (s."find-up@^4.1.0")
          (s."get-caller-file@^2.0.1")
          (s."require-directory@^2.1.1")
          (s."require-main-filename@^2.0.0")
          (s."set-blocking@^2.0.0")
          (s."string-width@^4.2.0")
          (s."which-module@^2.0.0")
          (s."y18n@^4.0.0")
          (s."yargs-parser@^18.1.2")
          ];
        "yargs@16.0.3" = f "yargs" "16.0.3" y "7a919b9e43c90f80d4a142a89795e85399a7e54c" [
          (s."cliui@^7.0.0")
          (s."escalade@^3.0.2")
          (s."get-caller-file@^2.0.5")
          (s."require-directory@^2.1.1")
          (s."string-width@^4.2.0")
          (s."y18n@^5.0.1")
          (s."yargs-parser@^20.0.0")
          ];
        "yargs@^15.0.2" = s."yargs@15.4.1";
        "yargs@^16.0.0" = s."yargs@16.0.3";
        "yargs@^16.0.3" = s."yargs@16.0.3";
        }