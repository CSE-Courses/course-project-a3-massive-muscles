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
        "@babel/core@^7.1.0" = s."@babel/core@7.11.6";
        "@babel/core@^7.10.4" = s."@babel/core@7.11.6";
        "@babel/core@^7.11.6" = s."@babel/core@7.11.6";
        "@babel/generator@7.11.6" = f (sc "babel" "generator") "7.11.6" (ir "https://registry.yarnpkg.com/@babel/generator/-/generator-7.11.6.tgz") "b868900f81b163b4d464ea24545c61cbac4dc620" [
          (s."@babel/types@^7.11.5")
          (s."jsesc@^2.5.1")
          (s."source-map@^0.5.0")
          ];
        "@babel/generator@^7.11.5" = s."@babel/generator@7.11.6";
        "@babel/generator@^7.11.6" = s."@babel/generator@7.11.6";
        "@babel/generator@^7.4.0" = s."@babel/generator@7.11.6";
        "@babel/helper-create-class-features-plugin@7.10.5" = f (sc "babel" "helper-create-class-features-plugin") "7.10.5" (ir "https://registry.yarnpkg.com/@babel/helper-create-class-features-plugin/-/helper-create-class-features-plugin-7.10.5.tgz") "9f61446ba80e8240b0a5c85c6fdac8459d6f259d" [
          (s."@babel/helper-function-name@^7.10.4")
          (s."@babel/helper-member-expression-to-functions@^7.10.5")
          (s."@babel/helper-optimise-call-expression@^7.10.4")
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."@babel/helper-replace-supers@^7.10.4")
          (s."@babel/helper-split-export-declaration@^7.10.4")
          ];
        "@babel/helper-create-class-features-plugin@^7.10.4" = s."@babel/helper-create-class-features-plugin@7.10.5";
        "@babel/helper-fixtures@7.10.5" = f (sc "babel" "helper-fixtures") "7.10.5" (ir "https://registry.yarnpkg.com/@babel/helper-fixtures/-/helper-fixtures-7.10.5.tgz") "f2d7feb3ba01309af5e6d430ad4f615c142a7a2b" [
          (s."lodash@^4.17.19")
          (s."semver@^5.3.0")
          ];
        "@babel/helper-fixtures@^7.10.5" = s."@babel/helper-fixtures@7.10.5";
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
        "@babel/helper-member-expression-to-functions@^7.10.5" = s."@babel/helper-member-expression-to-functions@7.11.0";
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
        "@babel/helper-plugin-test-runner@7.10.4" = f (sc "babel" "helper-plugin-test-runner") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helper-plugin-test-runner/-/helper-plugin-test-runner-7.10.4.tgz") "7e8b96976f5cf8d19b9c7fcb758881c0962852f7" [
          (s."@babel/helper-transform-fixture-test-runner@^7.10.4")
          ];
        "@babel/helper-plugin-test-runner@^7.10.4" = s."@babel/helper-plugin-test-runner@7.10.4";
        "@babel/helper-plugin-utils@7.10.4" = f (sc "babel" "helper-plugin-utils") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helper-plugin-utils/-/helper-plugin-utils-7.10.4.tgz") "2f75a831269d4f677de49986dff59927533cf375" [];
        "@babel/helper-plugin-utils@^7.0.0" = s."@babel/helper-plugin-utils@7.10.4";
        "@babel/helper-plugin-utils@^7.10.4" = s."@babel/helper-plugin-utils@7.10.4";
        "@babel/helper-plugin-utils@^7.8.0" = s."@babel/helper-plugin-utils@7.10.4";
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
        "@babel/helper-split-export-declaration@^7.10.4" = s."@babel/helper-split-export-declaration@7.11.0";
        "@babel/helper-split-export-declaration@^7.11.0" = s."@babel/helper-split-export-declaration@7.11.0";
        "@babel/helper-transform-fixture-test-runner@7.11.6" = f (sc "babel" "helper-transform-fixture-test-runner") "7.11.6" (ir "https://registry.yarnpkg.com/@babel/helper-transform-fixture-test-runner/-/helper-transform-fixture-test-runner-7.11.6.tgz") "3eaa4699591ea3aea765fa013704e309b79f1815" [
          (s."@babel/code-frame@^7.10.4")
          (s."@babel/core@^7.11.6")
          (s."@babel/helper-fixtures@^7.10.5")
          (s."@babel/polyfill@^7.10.4")
          (s."babel-check-duplicated-nodes@^1.0.0")
          (s."jest@^24.8.0")
          (s."jest-diff@^24.8.0")
          (s."lodash@^4.17.19")
          (s."quick-lru@5.1.0")
          (s."resolve@^1.3.2")
          (s."source-map@^0.5.0")
          ];
        "@babel/helper-transform-fixture-test-runner@^7.10.4" = s."@babel/helper-transform-fixture-test-runner@7.11.6";
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
        "@babel/parser@^7.1.0" = s."@babel/parser@7.11.5";
        "@babel/parser@^7.10.4" = s."@babel/parser@7.11.5";
        "@babel/parser@^7.11.5" = s."@babel/parser@7.11.5";
        "@babel/parser@^7.4.3" = s."@babel/parser@7.11.5";
        "@babel/plugin-syntax-object-rest-spread@7.8.3" = f (sc "babel" "plugin-syntax-object-rest-spread") "7.8.3" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-object-rest-spread/-/plugin-syntax-object-rest-spread-7.8.3.tgz") "60e225edcbd98a640332a2e72dd3e66f1af55871" [
          (s."@babel/helper-plugin-utils@^7.8.0")
          ];
        "@babel/plugin-syntax-object-rest-spread@^7.0.0" = s."@babel/plugin-syntax-object-rest-spread@7.8.3";
        "@babel/polyfill@7.11.5" = f (sc "babel" "polyfill") "7.11.5" (ir "https://registry.yarnpkg.com/@babel/polyfill/-/polyfill-7.11.5.tgz") "df550b2ec53abbc2ed599367ec59e64c7a707bb5" [
          (s."core-js@^2.6.5")
          (s."regenerator-runtime@^0.13.4")
          ];
        "@babel/polyfill@^7.10.4" = s."@babel/polyfill@7.11.5";
        "@babel/template@7.10.4" = f (sc "babel" "template") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/template/-/template-7.10.4.tgz") "3251996c4200ebc71d1a8fc405fba940f36ba278" [
          (s."@babel/code-frame@^7.10.4")
          (s."@babel/parser@^7.10.4")
          (s."@babel/types@^7.10.4")
          ];
        "@babel/template@^7.10.4" = s."@babel/template@7.10.4";
        "@babel/template@^7.4.0" = s."@babel/template@7.10.4";
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
        "@babel/traverse@^7.1.0" = s."@babel/traverse@7.11.5";
        "@babel/traverse@^7.10.4" = s."@babel/traverse@7.11.5";
        "@babel/traverse@^7.11.5" = s."@babel/traverse@7.11.5";
        "@babel/traverse@^7.4.3" = s."@babel/traverse@7.11.5";
        "@babel/types@7.11.5" = f (sc "babel" "types") "7.11.5" (ir "https://registry.yarnpkg.com/@babel/types/-/types-7.11.5.tgz") "d9de577d01252d77c6800cee039ee64faf75662d" [
          (s."@babel/helper-validator-identifier@^7.10.4")
          (s."lodash@^4.17.19")
          (s."to-fast-properties@^2.0.0")
          ];
        "@babel/types@^7.0.0" = s."@babel/types@7.11.5";
        "@babel/types@^7.10.4" = s."@babel/types@7.11.5";
        "@babel/types@^7.11.0" = s."@babel/types@7.11.5";
        "@babel/types@^7.11.5" = s."@babel/types@7.11.5";
        "@babel/types@^7.3.0" = s."@babel/types@7.11.5";
        "@babel/types@^7.4.0" = s."@babel/types@7.11.5";
        "@cnakazawa/watch@1.0.4" = f (sc "cnakazawa" "watch") "1.0.4" (ir "https://registry.yarnpkg.com/@cnakazawa/watch/-/watch-1.0.4.tgz") "f864ae85004d0fcab6f50be9141c4da368d1656a" [
          (s."exec-sh@^0.3.2")
          (s."minimist@^1.2.0")
          ];
        "@cnakazawa/watch@^1.0.3" = s."@cnakazawa/watch@1.0.4";
        "@jest/console@24.9.0" = f (sc "jest" "console") "24.9.0" (ir "https://registry.yarnpkg.com/@jest/console/-/console-24.9.0.tgz") "79b1bc06fb74a8cfb01cbdedf945584b1b9707f0" [
          (s."@jest/source-map@^24.9.0")
          (s."chalk@^2.0.1")
          (s."slash@^2.0.0")
          ];
        "@jest/console@^24.7.1" = s."@jest/console@24.9.0";
        "@jest/console@^24.9.0" = s."@jest/console@24.9.0";
        "@jest/core@24.9.0" = f (sc "jest" "core") "24.9.0" (ir "https://registry.yarnpkg.com/@jest/core/-/core-24.9.0.tgz") "2ceccd0b93181f9c4850e74f2a9ad43d351369c4" [
          (s."@jest/console@^24.7.1")
          (s."@jest/reporters@^24.9.0")
          (s."@jest/test-result@^24.9.0")
          (s."@jest/transform@^24.9.0")
          (s."@jest/types@^24.9.0")
          (s."ansi-escapes@^3.0.0")
          (s."chalk@^2.0.1")
          (s."exit@^0.1.2")
          (s."graceful-fs@^4.1.15")
          (s."jest-changed-files@^24.9.0")
          (s."jest-config@^24.9.0")
          (s."jest-haste-map@^24.9.0")
          (s."jest-message-util@^24.9.0")
          (s."jest-regex-util@^24.3.0")
          (s."jest-resolve@^24.9.0")
          (s."jest-resolve-dependencies@^24.9.0")
          (s."jest-runner@^24.9.0")
          (s."jest-runtime@^24.9.0")
          (s."jest-snapshot@^24.9.0")
          (s."jest-util@^24.9.0")
          (s."jest-validate@^24.9.0")
          (s."jest-watcher@^24.9.0")
          (s."micromatch@^3.1.10")
          (s."p-each-series@^1.0.0")
          (s."realpath-native@^1.1.0")
          (s."rimraf@^2.5.4")
          (s."slash@^2.0.0")
          (s."strip-ansi@^5.0.0")
          ];
        "@jest/core@^24.9.0" = s."@jest/core@24.9.0";
        "@jest/environment@24.9.0" = f (sc "jest" "environment") "24.9.0" (ir "https://registry.yarnpkg.com/@jest/environment/-/environment-24.9.0.tgz") "21e3afa2d65c0586cbd6cbefe208bafade44ab18" [
          (s."@jest/fake-timers@^24.9.0")
          (s."@jest/transform@^24.9.0")
          (s."@jest/types@^24.9.0")
          (s."jest-mock@^24.9.0")
          ];
        "@jest/environment@^24.9.0" = s."@jest/environment@24.9.0";
        "@jest/fake-timers@24.9.0" = f (sc "jest" "fake-timers") "24.9.0" (ir "https://registry.yarnpkg.com/@jest/fake-timers/-/fake-timers-24.9.0.tgz") "ba3e6bf0eecd09a636049896434d306636540c93" [
          (s."@jest/types@^24.9.0")
          (s."jest-message-util@^24.9.0")
          (s."jest-mock@^24.9.0")
          ];
        "@jest/fake-timers@^24.9.0" = s."@jest/fake-timers@24.9.0";
        "@jest/reporters@24.9.0" = f (sc "jest" "reporters") "24.9.0" (ir "https://registry.yarnpkg.com/@jest/reporters/-/reporters-24.9.0.tgz") "86660eff8e2b9661d042a8e98a028b8d631a5b43" [
          (s."@jest/environment@^24.9.0")
          (s."@jest/test-result@^24.9.0")
          (s."@jest/transform@^24.9.0")
          (s."@jest/types@^24.9.0")
          (s."chalk@^2.0.1")
          (s."exit@^0.1.2")
          (s."glob@^7.1.2")
          (s."istanbul-lib-coverage@^2.0.2")
          (s."istanbul-lib-instrument@^3.0.1")
          (s."istanbul-lib-report@^2.0.4")
          (s."istanbul-lib-source-maps@^3.0.1")
          (s."istanbul-reports@^2.2.6")
          (s."jest-haste-map@^24.9.0")
          (s."jest-resolve@^24.9.0")
          (s."jest-runtime@^24.9.0")
          (s."jest-util@^24.9.0")
          (s."jest-worker@^24.6.0")
          (s."node-notifier@^5.4.2")
          (s."slash@^2.0.0")
          (s."source-map@^0.6.0")
          (s."string-length@^2.0.0")
          ];
        "@jest/reporters@^24.9.0" = s."@jest/reporters@24.9.0";
        "@jest/source-map@24.9.0" = f (sc "jest" "source-map") "24.9.0" (ir "https://registry.yarnpkg.com/@jest/source-map/-/source-map-24.9.0.tgz") "0e263a94430be4b41da683ccc1e6bffe2a191714" [
          (s."callsites@^3.0.0")
          (s."graceful-fs@^4.1.15")
          (s."source-map@^0.6.0")
          ];
        "@jest/source-map@^24.3.0" = s."@jest/source-map@24.9.0";
        "@jest/source-map@^24.9.0" = s."@jest/source-map@24.9.0";
        "@jest/test-result@24.9.0" = f (sc "jest" "test-result") "24.9.0" (ir "https://registry.yarnpkg.com/@jest/test-result/-/test-result-24.9.0.tgz") "11796e8aa9dbf88ea025757b3152595ad06ba0ca" [
          (s."@jest/console@^24.9.0")
          (s."@jest/types@^24.9.0")
          (s."@types/istanbul-lib-coverage@^2.0.0")
          ];
        "@jest/test-result@^24.9.0" = s."@jest/test-result@24.9.0";
        "@jest/test-sequencer@24.9.0" = f (sc "jest" "test-sequencer") "24.9.0" (ir "https://registry.yarnpkg.com/@jest/test-sequencer/-/test-sequencer-24.9.0.tgz") "f8f334f35b625a4f2f355f2fe7e6036dad2e6b31" [
          (s."@jest/test-result@^24.9.0")
          (s."jest-haste-map@^24.9.0")
          (s."jest-runner@^24.9.0")
          ];
        "@jest/test-sequencer@^24.9.0" = s."@jest/test-sequencer@24.9.0";
        "@jest/transform@24.9.0" = f (sc "jest" "transform") "24.9.0" (ir "https://registry.yarnpkg.com/@jest/transform/-/transform-24.9.0.tgz") "4ae2768b296553fadab09e9ec119543c90b16c56" [
          (s."@babel/core@^7.1.0")
          (s."@jest/types@^24.9.0")
          (s."babel-plugin-istanbul@^5.1.0")
          (s."chalk@^2.0.1")
          (s."convert-source-map@^1.4.0")
          (s."fast-json-stable-stringify@^2.0.0")
          (s."graceful-fs@^4.1.15")
          (s."jest-haste-map@^24.9.0")
          (s."jest-regex-util@^24.9.0")
          (s."jest-util@^24.9.0")
          (s."micromatch@^3.1.10")
          (s."pirates@^4.0.1")
          (s."realpath-native@^1.1.0")
          (s."slash@^2.0.0")
          (s."source-map@^0.6.1")
          (s."write-file-atomic@2.4.1")
          ];
        "@jest/transform@^24.9.0" = s."@jest/transform@24.9.0";
        "@jest/types@24.9.0" = f (sc "jest" "types") "24.9.0" (ir "https://registry.yarnpkg.com/@jest/types/-/types-24.9.0.tgz") "63cb26cb7500d069e5a389441a7c6ab5e909fc59" [
          (s."@types/istanbul-lib-coverage@^2.0.0")
          (s."@types/istanbul-reports@^1.1.1")
          (s."@types/yargs@^13.0.0")
          ];
        "@jest/types@^24.9.0" = s."@jest/types@24.9.0";
        "@types/babel__core@7.1.10" = f (sc "types" "babel__core") "7.1.10" (ir "https://registry.yarnpkg.com/@types/babel__core/-/babel__core-7.1.10.tgz") "ca58fc195dd9734e77e57c6f2df565623636ab40" [
          (s."@babel/parser@^7.1.0")
          (s."@babel/types@^7.0.0")
          (s."@types/babel__generator@*")
          (s."@types/babel__template@*")
          (s."@types/babel__traverse@*")
          ];
        "@types/babel__core@^7.1.0" = s."@types/babel__core@7.1.10";
        "@types/babel__generator@*" = s."@types/babel__generator@7.6.2";
        "@types/babel__generator@7.6.2" = f (sc "types" "babel__generator") "7.6.2" (ir "https://registry.yarnpkg.com/@types/babel__generator/-/babel__generator-7.6.2.tgz") "f3d71178e187858f7c45e30380f8f1b7415a12d8" [
          (s."@babel/types@^7.0.0")
          ];
        "@types/babel__template@*" = s."@types/babel__template@7.0.3";
        "@types/babel__template@7.0.3" = f (sc "types" "babel__template") "7.0.3" (ir "https://registry.yarnpkg.com/@types/babel__template/-/babel__template-7.0.3.tgz") "b8aaeba0a45caca7b56a5de9459872dde3727214" [
          (s."@babel/parser@^7.1.0")
          (s."@babel/types@^7.0.0")
          ];
        "@types/babel__traverse@*" = s."@types/babel__traverse@7.0.15";
        "@types/babel__traverse@7.0.15" = f (sc "types" "babel__traverse") "7.0.15" (ir "https://registry.yarnpkg.com/@types/babel__traverse/-/babel__traverse-7.0.15.tgz") "db9e4238931eb69ef8aab0ad6523d4d4caa39d03" [
          (s."@babel/types@^7.3.0")
          ];
        "@types/babel__traverse@^7.0.6" = s."@types/babel__traverse@7.0.15";
        "@types/istanbul-lib-coverage@*" = s."@types/istanbul-lib-coverage@2.0.3";
        "@types/istanbul-lib-coverage@2.0.3" = f (sc "types" "istanbul-lib-coverage") "2.0.3" (ir "https://registry.yarnpkg.com/@types/istanbul-lib-coverage/-/istanbul-lib-coverage-2.0.3.tgz") "4ba8ddb720221f432e443bd5f9117fd22cfd4762" [];
        "@types/istanbul-lib-coverage@^2.0.0" = s."@types/istanbul-lib-coverage@2.0.3";
        "@types/istanbul-lib-report@*" = s."@types/istanbul-lib-report@3.0.0";
        "@types/istanbul-lib-report@3.0.0" = f (sc "types" "istanbul-lib-report") "3.0.0" (ir "https://registry.yarnpkg.com/@types/istanbul-lib-report/-/istanbul-lib-report-3.0.0.tgz") "c14c24f18ea8190c118ee7562b7ff99a36552686" [
          (s."@types/istanbul-lib-coverage@*")
          ];
        "@types/istanbul-reports@1.1.2" = f (sc "types" "istanbul-reports") "1.1.2" (ir "https://registry.yarnpkg.com/@types/istanbul-reports/-/istanbul-reports-1.1.2.tgz") "e875cc689e47bce549ec81f3df5e6f6f11cfaeb2" [
          (s."@types/istanbul-lib-coverage@*")
          (s."@types/istanbul-lib-report@*")
          ];
        "@types/istanbul-reports@^1.1.1" = s."@types/istanbul-reports@1.1.2";
        "@types/stack-utils@1.0.1" = f (sc "types" "stack-utils") "1.0.1" (ir "https://registry.yarnpkg.com/@types/stack-utils/-/stack-utils-1.0.1.tgz") "0a851d3bd96498fa25c33ab7278ed3bd65f06c3e" [];
        "@types/stack-utils@^1.0.1" = s."@types/stack-utils@1.0.1";
        "@types/yargs-parser@*" = s."@types/yargs-parser@15.0.0";
        "@types/yargs-parser@15.0.0" = f (sc "types" "yargs-parser") "15.0.0" (ir "https://registry.yarnpkg.com/@types/yargs-parser/-/yargs-parser-15.0.0.tgz") "cb3f9f741869e20cce330ffbeb9271590483882d" [];
        "@types/yargs@13.0.11" = f (sc "types" "yargs") "13.0.11" (ir "https://registry.yarnpkg.com/@types/yargs/-/yargs-13.0.11.tgz") "def2f0c93e4bdf2c61d7e34899b17e34be28d3b1" [
          (s."@types/yargs-parser@*")
          ];
        "@types/yargs@^13.0.0" = s."@types/yargs@13.0.11";
        "abab@2.0.5" = f "abab" "2.0.5" y "c0b678fb32d60fc1219c784d6a826fe385aeb79a" [];
        "abab@^2.0.0" = s."abab@2.0.5";
        "acorn-globals@4.3.4" = f "acorn-globals" "4.3.4" y "9fa1926addc11c97308c4e66d7add0d40c3272e7" [
          (s."acorn@^6.0.1")
          (s."acorn-walk@^6.0.1")
          ];
        "acorn-globals@^4.1.0" = s."acorn-globals@4.3.4";
        "acorn-walk@6.2.0" = f "acorn-walk" "6.2.0" y "123cb8f3b84c2171f1f7fb252615b1c78a6b1a8c" [];
        "acorn-walk@^6.0.1" = s."acorn-walk@6.2.0";
        "acorn@5.7.4" = f "acorn" "5.7.4" y "3e8d8a9947d0599a1796d10225d7432f4a4acf5e" [];
        "acorn@6.4.2" = f "acorn" "6.4.2" y "35866fd710528e92de10cf06016498e47e39e1e6" [];
        "acorn@^5.5.3" = s."acorn@5.7.4";
        "acorn@^6.0.1" = s."acorn@6.4.2";
        "ajv@6.12.5" = f "ajv" "6.12.5" y "19b0e8bae8f476e5ba666300387775fb1a00a4da" [
          (s."fast-deep-equal@^3.1.1")
          (s."fast-json-stable-stringify@^2.0.0")
          (s."json-schema-traverse@^0.4.1")
          (s."uri-js@^4.2.2")
          ];
        "ajv@^6.12.3" = s."ajv@6.12.5";
        "ansi-escapes@3.2.0" = f "ansi-escapes" "3.2.0" y "8780b98ff9dbf5638152d1f1fe5c1d7b4442976b" [];
        "ansi-escapes@^3.0.0" = s."ansi-escapes@3.2.0";
        "ansi-regex@3.0.0" = f "ansi-regex" "3.0.0" y "ed0317c322064f79466c02966bddb605ab37d998" [];
        "ansi-regex@4.1.0" = f "ansi-regex" "4.1.0" y "8b9f8f08cf1acb843756a839ca8c7e3168c51997" [];
        "ansi-regex@^3.0.0" = s."ansi-regex@3.0.0";
        "ansi-regex@^4.0.0" = s."ansi-regex@4.1.0";
        "ansi-regex@^4.1.0" = s."ansi-regex@4.1.0";
        "ansi-styles@3.2.1" = f "ansi-styles" "3.2.1" y "41fbb20243e50b12be0f04b8dedbf07520ce841d" [
          (s."color-convert@^1.9.0")
          ];
        "ansi-styles@^3.2.0" = s."ansi-styles@3.2.1";
        "ansi-styles@^3.2.1" = s."ansi-styles@3.2.1";
        "anymatch@2.0.0" = f "anymatch" "2.0.0" y "bcb24b4f37934d9aa7ac17b4adaf89e7c76ef2eb" [
          (s."micromatch@^3.1.4")
          (s."normalize-path@^2.1.1")
          ];
        "anymatch@^2.0.0" = s."anymatch@2.0.0";
        "arr-diff@4.0.0" = f "arr-diff" "4.0.0" y "d6461074febfec71e7e15235761a329a5dc7c520" [];
        "arr-diff@^4.0.0" = s."arr-diff@4.0.0";
        "arr-flatten@1.1.0" = f "arr-flatten" "1.1.0" y "36048bbff4e7b47e136644316c99669ea5ae91f1" [];
        "arr-flatten@^1.1.0" = s."arr-flatten@1.1.0";
        "arr-union@3.1.0" = f "arr-union" "3.1.0" y "e39b09aea9def866a8f206e288af63919bae39c4" [];
        "arr-union@^3.1.0" = s."arr-union@3.1.0";
        "array-equal@1.0.0" = f "array-equal" "1.0.0" y "8c2a5ef2472fd9ea742b04c77a75093ba2757c93" [];
        "array-equal@^1.0.0" = s."array-equal@1.0.0";
        "array-unique@0.3.2" = f "array-unique" "0.3.2" y "a894b75d4bc4f6cd679ef3244a9fd8f46ae2d428" [];
        "array-unique@^0.3.2" = s."array-unique@0.3.2";
        "asn1@0.2.4" = f "asn1" "0.2.4" y "8d2475dfab553bb33e77b54e59e880bb8ce23136" [
          (s."safer-buffer@~2.1.0")
          ];
        "asn1@~0.2.3" = s."asn1@0.2.4";
        "assert-plus@1.0.0" = f "assert-plus" "1.0.0" y "f12e0f3c5d77b0b1cdd9146942e4e96c1e4dd525" [];
        "assert-plus@^1.0.0" = s."assert-plus@1.0.0";
        "assign-symbols@1.0.0" = f "assign-symbols" "1.0.0" y "59667f41fadd4f20ccbc2bb96b8d4f7f78ec0367" [];
        "assign-symbols@^1.0.0" = s."assign-symbols@1.0.0";
        "astral-regex@1.0.0" = f "astral-regex" "1.0.0" y "6c8c3fb827dd43ee3918f27b82782ab7658a6fd9" [];
        "astral-regex@^1.0.0" = s."astral-regex@1.0.0";
        "async-limiter@1.0.1" = f "async-limiter" "1.0.1" y "dd379e94f0db8310b08291f9d64c3209766617fd" [];
        "async-limiter@~1.0.0" = s."async-limiter@1.0.1";
        "asynckit@0.4.0" = f "asynckit" "0.4.0" y "c79ed97f7f34cb8f2ba1bc9790bcc366474b4b79" [];
        "asynckit@^0.4.0" = s."asynckit@0.4.0";
        "atob@2.1.2" = f "atob" "2.1.2" y "6d9517eb9e030d2436666651e86bd9f6f13533c9" [];
        "atob@^2.1.2" = s."atob@2.1.2";
        "aws-sign2@0.7.0" = f "aws-sign2" "0.7.0" y "b46e890934a9591f2d2f6f86d7e6a9f1b3fe76a8" [];
        "aws-sign2@~0.7.0" = s."aws-sign2@0.7.0";
        "aws4@1.10.1" = f "aws4" "1.10.1" y "e1e82e4f3e999e2cfd61b161280d16a111f86428" [];
        "aws4@^1.8.0" = s."aws4@1.10.1";
        "babel-check-duplicated-nodes@1.0.0" = f "babel-check-duplicated-nodes" "1.0.0" y "a0b9fc7796abb0b69cf5f6f3f91d0f8d06e2aeeb" [];
        "babel-check-duplicated-nodes@^1.0.0" = s."babel-check-duplicated-nodes@1.0.0";
        "babel-jest@24.9.0" = f "babel-jest" "24.9.0" y "3fc327cb8467b89d14d7bc70e315104a783ccd54" [
          (s."@jest/transform@^24.9.0")
          (s."@jest/types@^24.9.0")
          (s."@types/babel__core@^7.1.0")
          (s."babel-plugin-istanbul@^5.1.0")
          (s."babel-preset-jest@^24.9.0")
          (s."chalk@^2.4.2")
          (s."slash@^2.0.0")
          ];
        "babel-jest@^24.9.0" = s."babel-jest@24.9.0";
        "babel-plugin-istanbul@5.2.0" = f "babel-plugin-istanbul" "5.2.0" y "df4ade83d897a92df069c4d9a25cf2671293c854" [
          (s."@babel/helper-plugin-utils@^7.0.0")
          (s."find-up@^3.0.0")
          (s."istanbul-lib-instrument@^3.3.0")
          (s."test-exclude@^5.2.3")
          ];
        "babel-plugin-istanbul@^5.1.0" = s."babel-plugin-istanbul@5.2.0";
        "babel-plugin-jest-hoist@24.9.0" = f "babel-plugin-jest-hoist" "24.9.0" y "4f837091eb407e01447c8843cbec546d0002d756" [
          (s."@types/babel__traverse@^7.0.6")
          ];
        "babel-plugin-jest-hoist@^24.9.0" = s."babel-plugin-jest-hoist@24.9.0";
        "babel-preset-jest@24.9.0" = f "babel-preset-jest" "24.9.0" y "192b521e2217fb1d1f67cf73f70c336650ad3cdc" [
          (s."@babel/plugin-syntax-object-rest-spread@^7.0.0")
          (s."babel-plugin-jest-hoist@^24.9.0")
          ];
        "babel-preset-jest@^24.9.0" = s."babel-preset-jest@24.9.0";
        "balanced-match@1.0.0" = f "balanced-match" "1.0.0" y "89b4d199ab2bee49de164ea02b89ce462d71b767" [];
        "balanced-match@^1.0.0" = s."balanced-match@1.0.0";
        "base@0.11.2" = f "base" "0.11.2" y "7bde5ced145b6d551a90db87f83c558b4eb48a8f" [
          (s."cache-base@^1.0.1")
          (s."class-utils@^0.3.5")
          (s."component-emitter@^1.2.1")
          (s."define-property@^1.0.0")
          (s."isobject@^3.0.1")
          (s."mixin-deep@^1.2.0")
          (s."pascalcase@^0.1.1")
          ];
        "base@^0.11.1" = s."base@0.11.2";
        "bcrypt-pbkdf@1.0.2" = f "bcrypt-pbkdf" "1.0.2" y "a4301d389b6a43f9b67ff3ca11a3f6637e360e9e" [
          (s."tweetnacl@^0.14.3")
          ];
        "bcrypt-pbkdf@^1.0.0" = s."bcrypt-pbkdf@1.0.2";
        "bindings@1.5.0" = f "bindings" "1.5.0" y "10353c9e945334bc0511a6d90b38fbc7c9c504df" [
          (s."file-uri-to-path@1.0.0")
          ];
        "bindings@^1.5.0" = s."bindings@1.5.0";
        "brace-expansion@1.1.11" = f "brace-expansion" "1.1.11" y "3c7fcbf529d87226f3d2f52b966ff5271eb441dd" [
          (s."balanced-match@^1.0.0")
          (s."concat-map@0.0.1")
          ];
        "brace-expansion@^1.1.7" = s."brace-expansion@1.1.11";
        "braces@2.3.2" = f "braces" "2.3.2" y "5979fd3f14cd531565e5fa2df1abfff1dfaee729" [
          (s."arr-flatten@^1.1.0")
          (s."array-unique@^0.3.2")
          (s."extend-shallow@^2.0.1")
          (s."fill-range@^4.0.0")
          (s."isobject@^3.0.1")
          (s."repeat-element@^1.1.2")
          (s."snapdragon@^0.8.1")
          (s."snapdragon-node@^2.0.1")
          (s."split-string@^3.0.2")
          (s."to-regex@^3.0.1")
          ];
        "braces@^2.3.1" = s."braces@2.3.2";
        "browser-process-hrtime@1.0.0" = f "browser-process-hrtime" "1.0.0" y "3c9b4b7d782c8121e56f10106d84c0d0ffc94626" [];
        "browser-process-hrtime@^1.0.0" = s."browser-process-hrtime@1.0.0";
        "browser-resolve@1.11.3" = f "browser-resolve" "1.11.3" y "9b7cbb3d0f510e4cb86bdbd796124d28b5890af6" [
          (s."resolve@1.1.7")
          ];
        "browser-resolve@^1.11.3" = s."browser-resolve@1.11.3";
        "bser@2.1.1" = f "bser" "2.1.1" y "e6787da20ece9d07998533cfd9de6f5c38f4bc05" [
          (s."node-int64@^0.4.0")
          ];
        "buffer-from@1.1.1" = f "buffer-from" "1.1.1" y "32713bc028f75c02fdb710d7c7bcec1f2c6070ef" [];
        "buffer-from@^1.0.0" = s."buffer-from@1.1.1";
        "cache-base@1.0.1" = f "cache-base" "1.0.1" y "0a7f46416831c8b662ee36fe4e7c59d76f666ab2" [
          (s."collection-visit@^1.0.0")
          (s."component-emitter@^1.2.1")
          (s."get-value@^2.0.6")
          (s."has-value@^1.0.0")
          (s."isobject@^3.0.1")
          (s."set-value@^2.0.0")
          (s."to-object-path@^0.3.0")
          (s."union-value@^1.0.0")
          (s."unset-value@^1.0.0")
          ];
        "cache-base@^1.0.1" = s."cache-base@1.0.1";
        "callsites@3.1.0" = f "callsites" "3.1.0" y "b3630abd8943432f54b3f0519238e33cd7df2f73" [];
        "callsites@^3.0.0" = s."callsites@3.1.0";
        "camelcase@5.3.1" = f "camelcase" "5.3.1" y "e3c9b31569e106811df242f715725a1f4c494320" [];
        "camelcase@^5.0.0" = s."camelcase@5.3.1";
        "camelcase@^5.3.1" = s."camelcase@5.3.1";
        "capture-exit@2.0.0" = f "capture-exit" "2.0.0" y "fb953bfaebeb781f62898239dabb426d08a509a4" [
          (s."rsvp@^4.8.4")
          ];
        "capture-exit@^2.0.0" = s."capture-exit@2.0.0";
        "caseless@0.12.0" = f "caseless" "0.12.0" y "1b681c21ff84033c826543090689420d187151dc" [];
        "caseless@~0.12.0" = s."caseless@0.12.0";
        "chalk@2.4.2" = f "chalk" "2.4.2" y "cd42541677a54333cf541a49108c1432b44c9424" [
          (s."ansi-styles@^3.2.1")
          (s."escape-string-regexp@^1.0.5")
          (s."supports-color@^5.3.0")
          ];
        "chalk@^2.0.0" = s."chalk@2.4.2";
        "chalk@^2.0.1" = s."chalk@2.4.2";
        "chalk@^2.4.2" = s."chalk@2.4.2";
        "ci-info@2.0.0" = f "ci-info" "2.0.0" y "67a9e964be31a51e15e5010d58e6f12834002f46" [];
        "ci-info@^2.0.0" = s."ci-info@2.0.0";
        "class-utils@0.3.6" = f "class-utils" "0.3.6" y "f93369ae8b9a7ce02fd41faad0ca83033190c463" [
          (s."arr-union@^3.1.0")
          (s."define-property@^0.2.5")
          (s."isobject@^3.0.0")
          (s."static-extend@^0.1.1")
          ];
        "class-utils@^0.3.5" = s."class-utils@0.3.6";
        "cliui@5.0.0" = f "cliui" "5.0.0" y "deefcfdb2e800784aa34f46fa08e06851c7bbbc5" [
          (s."string-width@^3.1.0")
          (s."strip-ansi@^5.2.0")
          (s."wrap-ansi@^5.1.0")
          ];
        "cliui@^5.0.0" = s."cliui@5.0.0";
        "co@4.6.0" = f "co" "4.6.0" y "6ea6bdf3d853ae54ccb8e47bfa0bf3f9031fb184" [];
        "co@^4.6.0" = s."co@4.6.0";
        "collection-visit@1.0.0" = f "collection-visit" "1.0.0" y "4bc0373c164bc3291b4d368c829cf1a80a59dca0" [
          (s."map-visit@^1.0.0")
          (s."object-visit@^1.0.0")
          ];
        "collection-visit@^1.0.0" = s."collection-visit@1.0.0";
        "color-convert@1.9.3" = f "color-convert" "1.9.3" y "bb71850690e1f136567de629d2d5471deda4c1e8" [
          (s."color-name@1.1.3")
          ];
        "color-convert@^1.9.0" = s."color-convert@1.9.3";
        "color-name@1.1.3" = f "color-name" "1.1.3" y "a7d0558bd89c42f795dd42328f740831ca53bc25" [];
        "combined-stream@1.0.8" = f "combined-stream" "1.0.8" y "c3d45a8b34fd730631a110a8a2520682b31d5a7f" [
          (s."delayed-stream@~1.0.0")
          ];
        "combined-stream@^1.0.6" = s."combined-stream@1.0.8";
        "combined-stream@~1.0.6" = s."combined-stream@1.0.8";
        "component-emitter@1.3.0" = f "component-emitter" "1.3.0" y "16e4070fba8ae29b679f2215853ee181ab2eabc0" [];
        "component-emitter@^1.2.1" = s."component-emitter@1.3.0";
        "concat-map@0.0.1" = f "concat-map" "0.0.1" y "d8a96bd77fd68df7793a73036a3ba0d5405d477b" [];
        "convert-source-map@1.7.0" = f "convert-source-map" "1.7.0" y "17a2cb882d7f77d3490585e2ce6c524424a3a442" [
          (s."safe-buffer@~5.1.1")
          ];
        "convert-source-map@^1.4.0" = s."convert-source-map@1.7.0";
        "convert-source-map@^1.7.0" = s."convert-source-map@1.7.0";
        "copy-descriptor@0.1.1" = f "copy-descriptor" "0.1.1" y "676f6eb3c39997c2ee1ac3a924fd6124748f578d" [];
        "copy-descriptor@^0.1.0" = s."copy-descriptor@0.1.1";
        "core-js@2.6.11" = f "core-js" "2.6.11" y "38831469f9922bded8ee21c9dc46985e0399308c" [];
        "core-js@^2.6.5" = s."core-js@2.6.11";
        "core-util-is@1.0.2" = f "core-util-is" "1.0.2" y "b5fd54220aa2bc5ab57aab7140c940754503c1a7" [];
        "cross-spawn@6.0.5" = f "cross-spawn" "6.0.5" y "4a5ec7c64dfae22c3a14124dbacdee846d80cbc4" [
          (s."nice-try@^1.0.4")
          (s."path-key@^2.0.1")
          (s."semver@^5.5.0")
          (s."shebang-command@^1.2.0")
          (s."which@^1.2.9")
          ];
        "cross-spawn@^6.0.0" = s."cross-spawn@6.0.5";
        "cssom@0.3.8" = f "cssom" "0.3.8" y "9f1276f5b2b463f2114d3f2c75250af8c1a36f4a" [];
        "cssom@0.3.x" = s."cssom@0.3.8";
        "cssom@>= 0.3.2 < 0.4.0" = s."cssom@0.3.8";
        "cssstyle@1.4.0" = f "cssstyle" "1.4.0" y "9d31328229d3c565c61e586b02041a28fccdccf1" [
          (s."cssom@0.3.x")
          ];
        "cssstyle@^1.0.0" = s."cssstyle@1.4.0";
        "dashdash@1.14.1" = f "dashdash" "1.14.1" y "853cfa0f7cbe2fed5de20326b8dd581035f6e2f0" [
          (s."assert-plus@^1.0.0")
          ];
        "dashdash@^1.12.0" = s."dashdash@1.14.1";
        "data-urls@1.1.0" = f "data-urls" "1.1.0" y "15ee0582baa5e22bb59c77140da8f9c76963bbfe" [
          (s."abab@^2.0.0")
          (s."whatwg-mimetype@^2.2.0")
          (s."whatwg-url@^7.0.0")
          ];
        "data-urls@^1.0.0" = s."data-urls@1.1.0";
        "debug@2.6.9" = f "debug" "2.6.9" y "5d128515df134ff327e90a4c93f4e077a536341f" [
          (s."ms@2.0.0")
          ];
        "debug@4.2.0" = f "debug" "4.2.0" y "7f150f93920e94c58f5574c2fd01a3110effe7f1" [
          (s."ms@2.1.2")
          ];
        "debug@^2.2.0" = s."debug@2.6.9";
        "debug@^2.3.3" = s."debug@2.6.9";
        "debug@^4.1.0" = s."debug@4.2.0";
        "debug@^4.1.1" = s."debug@4.2.0";
        "decamelize@1.2.0" = f "decamelize" "1.2.0" y "f6534d15148269b20352e7bee26f501f9a191290" [];
        "decamelize@^1.2.0" = s."decamelize@1.2.0";
        "decode-uri-component@0.2.0" = f "decode-uri-component" "0.2.0" y "eb3913333458775cb84cd1a1fae062106bb87545" [];
        "decode-uri-component@^0.2.0" = s."decode-uri-component@0.2.0";
        "deep-is@0.1.3" = f "deep-is" "0.1.3" y "b369d6fb5dbc13eecf524f91b070feedc357cf34" [];
        "deep-is@~0.1.3" = s."deep-is@0.1.3";
        "define-properties@1.1.3" = f "define-properties" "1.1.3" y "cf88da6cbee26fe6db7094f61d870cbd84cee9f1" [
          (s."object-keys@^1.0.12")
          ];
        "define-properties@^1.1.3" = s."define-properties@1.1.3";
        "define-property@0.2.5" = f "define-property" "0.2.5" y "c35b1ef918ec3c990f9a5bc57be04aacec5c8116" [
          (s."is-descriptor@^0.1.0")
          ];
        "define-property@1.0.0" = f "define-property" "1.0.0" y "769ebaaf3f4a63aad3af9e8d304c9bbe79bfb0e6" [
          (s."is-descriptor@^1.0.0")
          ];
        "define-property@2.0.2" = f "define-property" "2.0.2" y "d459689e8d654ba77e02a817f8710d702cb16e9d" [
          (s."is-descriptor@^1.0.2")
          (s."isobject@^3.0.1")
          ];
        "define-property@^0.2.5" = s."define-property@0.2.5";
        "define-property@^1.0.0" = s."define-property@1.0.0";
        "define-property@^2.0.2" = s."define-property@2.0.2";
        "delayed-stream@1.0.0" = f "delayed-stream" "1.0.0" y "df3ae199acadfb7d440aaae0b29e2272b24ec619" [];
        "delayed-stream@~1.0.0" = s."delayed-stream@1.0.0";
        "detect-newline@2.1.0" = f "detect-newline" "2.1.0" y "f41f1c10be4b00e87b5f13da680759f2c5bfd3e2" [];
        "detect-newline@^2.1.0" = s."detect-newline@2.1.0";
        "diff-sequences@24.9.0" = f "diff-sequences" "24.9.0" y "5715d6244e2aa65f48bba0bc972db0b0b11e95b5" [];
        "diff-sequences@^24.9.0" = s."diff-sequences@24.9.0";
        "domexception@1.0.1" = f "domexception" "1.0.1" y "937442644ca6a31261ef36e3ec677fe805582c90" [
          (s."webidl-conversions@^4.0.2")
          ];
        "domexception@^1.0.1" = s."domexception@1.0.1";
        "ecc-jsbn@0.1.2" = f "ecc-jsbn" "0.1.2" y "3a83a904e54353287874c564b7549386849a98c9" [
          (s."jsbn@~0.1.0")
          (s."safer-buffer@^2.1.0")
          ];
        "ecc-jsbn@~0.1.1" = s."ecc-jsbn@0.1.2";
        "emoji-regex@7.0.3" = f "emoji-regex" "7.0.3" y "933a04052860c85e83c122479c4748a8e4c72156" [];
        "emoji-regex@^7.0.1" = s."emoji-regex@7.0.3";
        "end-of-stream@1.4.4" = f "end-of-stream" "1.4.4" y "5ae64a5f45057baf3626ec14da0ca5e4b2431eb0" [
          (s."once@^1.4.0")
          ];
        "end-of-stream@^1.1.0" = s."end-of-stream@1.4.4";
        "error-ex@1.3.2" = f "error-ex" "1.3.2" y "b4ac40648107fdcdcfae242f428bea8a14d4f1bf" [
          (s."is-arrayish@^0.2.1")
          ];
        "error-ex@^1.3.1" = s."error-ex@1.3.2";
        "es-abstract@1.17.7" = f "es-abstract" "1.17.7" y "a4de61b2f66989fc7421676c1cb9787573ace54c" [
          (s."es-to-primitive@^1.2.1")
          (s."function-bind@^1.1.1")
          (s."has@^1.0.3")
          (s."has-symbols@^1.0.1")
          (s."is-callable@^1.2.2")
          (s."is-regex@^1.1.1")
          (s."object-inspect@^1.8.0")
          (s."object-keys@^1.1.1")
          (s."string.prototype.trimstart@^1.0.1")
          ];
        "es-abstract@1.18.0-next.1" = f "es-abstract" "1.18.0-next.1" y "6e3a0a4bda717e5023ab3b8e90bec36108d22c68" [
          (s."es-to-primitive@^1.2.1")
          (s."function-bind@^1.1.1")
          (s."has@^1.0.3")
          (s."has-symbols@^1.0.1")
          (s."is-callable@^1.2.2")
          (s."is-negative-zero@^2.0.0")
          (s."is-regex@^1.1.1")
          (s."object-inspect@^1.8.0")
          (s."object-keys@^1.1.1")
          (s."string.prototype.trimend@^1.0.1")
          (s."string.prototype.trimstart@^1.0.1")
          ];
        "es-abstract@^1.17.0-next.1" = s."es-abstract@1.17.7";
        "es-abstract@^1.17.2" = s."es-abstract@1.17.7";
        "es-abstract@^1.17.5" = s."es-abstract@1.17.7";
        "es-abstract@^1.18.0-next.0" = s."es-abstract@1.18.0-next.1";
        "es-to-primitive@1.2.1" = f "es-to-primitive" "1.2.1" y "e55cd4c9cdc188bcefb03b366c736323fc5c898a" [
          (s."is-callable@^1.1.4")
          (s."is-date-object@^1.0.1")
          (s."is-symbol@^1.0.2")
          ];
        "es-to-primitive@^1.2.1" = s."es-to-primitive@1.2.1";
        "escape-string-regexp@1.0.5" = f "escape-string-regexp" "1.0.5" y "1b61c0562190a8dff6ae3bb2cf0200ca130b86d4" [];
        "escape-string-regexp@^1.0.5" = s."escape-string-regexp@1.0.5";
        "escodegen@1.14.3" = f "escodegen" "1.14.3" y "4e7b81fba61581dc97582ed78cab7f0e8d63f503" [
          (s."esprima@^4.0.1")
          (s."estraverse@^4.2.0")
          (s."esutils@^2.0.2")
          (s."optionator@^0.8.1")
          (s."source-map@~0.6.1")
          ];
        "escodegen@^1.9.1" = s."escodegen@1.14.3";
        "esprima@4.0.1" = f "esprima" "4.0.1" y "13b04cdb3e6c5d19df91ab6987a8695619b0aa71" [];
        "esprima@^4.0.1" = s."esprima@4.0.1";
        "estraverse@4.3.0" = f "estraverse" "4.3.0" y "398ad3f3c5a24948be7725e83d11a7de28cdbd1d" [];
        "estraverse@^4.2.0" = s."estraverse@4.3.0";
        "esutils@2.0.3" = f "esutils" "2.0.3" y "74d2eb4de0b8da1293711910d50775b9b710ef64" [];
        "esutils@^2.0.2" = s."esutils@2.0.3";
        "exec-sh@0.3.4" = f "exec-sh" "0.3.4" y "3a018ceb526cc6f6df2bb504b2bfe8e3a4934ec5" [];
        "exec-sh@^0.3.2" = s."exec-sh@0.3.4";
        "execa@1.0.0" = f "execa" "1.0.0" y "c6236a5bb4df6d6f15e88e7f017798216749ddd8" [
          (s."cross-spawn@^6.0.0")
          (s."get-stream@^4.0.0")
          (s."is-stream@^1.1.0")
          (s."npm-run-path@^2.0.0")
          (s."p-finally@^1.0.0")
          (s."signal-exit@^3.0.0")
          (s."strip-eof@^1.0.0")
          ];
        "execa@^1.0.0" = s."execa@1.0.0";
        "exit@0.1.2" = f "exit" "0.1.2" y "0632638f8d877cc82107d30a0fff1a17cba1cd0c" [];
        "exit@^0.1.2" = s."exit@0.1.2";
        "expand-brackets@2.1.4" = f "expand-brackets" "2.1.4" y "b77735e315ce30f6b6eff0f83b04151a22449622" [
          (s."debug@^2.3.3")
          (s."define-property@^0.2.5")
          (s."extend-shallow@^2.0.1")
          (s."posix-character-classes@^0.1.0")
          (s."regex-not@^1.0.0")
          (s."snapdragon@^0.8.1")
          (s."to-regex@^3.0.1")
          ];
        "expand-brackets@^2.1.4" = s."expand-brackets@2.1.4";
        "expect@24.9.0" = f "expect" "24.9.0" y "b75165b4817074fa4a157794f46fe9f1ba15b6ca" [
          (s."@jest/types@^24.9.0")
          (s."ansi-styles@^3.2.0")
          (s."jest-get-type@^24.9.0")
          (s."jest-matcher-utils@^24.9.0")
          (s."jest-message-util@^24.9.0")
          (s."jest-regex-util@^24.9.0")
          ];
        "expect@^24.9.0" = s."expect@24.9.0";
        "extend-shallow@2.0.1" = f "extend-shallow" "2.0.1" y "51af7d614ad9a9f610ea1bafbb989d6b1c56890f" [
          (s."is-extendable@^0.1.0")
          ];
        "extend-shallow@3.0.2" = f "extend-shallow" "3.0.2" y "26a71aaf073b39fb2127172746131c2704028db8" [
          (s."assign-symbols@^1.0.0")
          (s."is-extendable@^1.0.1")
          ];
        "extend-shallow@^2.0.1" = s."extend-shallow@2.0.1";
        "extend-shallow@^3.0.0" = s."extend-shallow@3.0.2";
        "extend-shallow@^3.0.2" = s."extend-shallow@3.0.2";
        "extend@3.0.2" = f "extend" "3.0.2" y "f8b1136b4071fbd8eb140aff858b1019ec2915fa" [];
        "extend@~3.0.2" = s."extend@3.0.2";
        "extglob@2.0.4" = f "extglob" "2.0.4" y "ad00fe4dc612a9232e8718711dc5cb5ab0285543" [
          (s."array-unique@^0.3.2")
          (s."define-property@^1.0.0")
          (s."expand-brackets@^2.1.4")
          (s."extend-shallow@^2.0.1")
          (s."fragment-cache@^0.2.1")
          (s."regex-not@^1.0.0")
          (s."snapdragon@^0.8.1")
          (s."to-regex@^3.0.1")
          ];
        "extglob@^2.0.4" = s."extglob@2.0.4";
        "extsprintf@1.3.0" = f "extsprintf" "1.3.0" y "96918440e3041a7a414f8c52e3c574eb3c3e1e05" [];
        "extsprintf@1.4.0" = f "extsprintf" "1.4.0" y "e2689f8f356fad62cca65a3a91c5df5f9551692f" [];
        "extsprintf@^1.2.0" = s."extsprintf@1.4.0";
        "fast-deep-equal@3.1.3" = f "fast-deep-equal" "3.1.3" y "3a7d56b559d6cbc3eb512325244e619a65c6c525" [];
        "fast-deep-equal@^3.1.1" = s."fast-deep-equal@3.1.3";
        "fast-json-stable-stringify@2.1.0" = f "fast-json-stable-stringify" "2.1.0" y "874bf69c6f404c2b5d99c481341399fd55892633" [];
        "fast-json-stable-stringify@^2.0.0" = s."fast-json-stable-stringify@2.1.0";
        "fast-levenshtein@2.0.6" = f "fast-levenshtein" "2.0.6" y "3d8a5c66883a16a30ca8643e851f19baa7797917" [];
        "fast-levenshtein@~2.0.6" = s."fast-levenshtein@2.0.6";
        "fb-watchman@2.0.1" = f "fb-watchman" "2.0.1" y "fc84fb39d2709cf3ff6d743706157bb5708a8a85" [
          (s."bser@2.1.1")
          ];
        "fb-watchman@^2.0.0" = s."fb-watchman@2.0.1";
        "file-uri-to-path@1.0.0" = f "file-uri-to-path" "1.0.0" y "553a7b8446ff6f684359c445f1e37a05dacc33dd" [];
        "fill-range@4.0.0" = f "fill-range" "4.0.0" y "d544811d428f98eb06a63dc402d2403c328c38f7" [
          (s."extend-shallow@^2.0.1")
          (s."is-number@^3.0.0")
          (s."repeat-string@^1.6.1")
          (s."to-regex-range@^2.1.0")
          ];
        "fill-range@^4.0.0" = s."fill-range@4.0.0";
        "find-up@3.0.0" = f "find-up" "3.0.0" y "49169f1d7993430646da61ecc5ae355c21c97b73" [
          (s."locate-path@^3.0.0")
          ];
        "find-up@^3.0.0" = s."find-up@3.0.0";
        "for-in@1.0.2" = f "for-in" "1.0.2" y "81068d295a8142ec0ac726c6e2200c30fb6d5e80" [];
        "for-in@^1.0.2" = s."for-in@1.0.2";
        "forever-agent@0.6.1" = f "forever-agent" "0.6.1" y "fbc71f0c41adeb37f96c577ad1ed42d8fdacca91" [];
        "forever-agent@~0.6.1" = s."forever-agent@0.6.1";
        "form-data@2.3.3" = f "form-data" "2.3.3" y "dcce52c05f644f298c6a7ab936bd724ceffbf3a6" [
          (s."asynckit@^0.4.0")
          (s."combined-stream@^1.0.6")
          (s."mime-types@^2.1.12")
          ];
        "form-data@~2.3.2" = s."form-data@2.3.3";
        "fragment-cache@0.2.1" = f "fragment-cache" "0.2.1" y "4290fad27f13e89be7f33799c6bc5a0abfff0d19" [
          (s."map-cache@^0.2.2")
          ];
        "fragment-cache@^0.2.1" = s."fragment-cache@0.2.1";
        "fs.realpath@1.0.0" = f "fs.realpath" "1.0.0" y "1504ad2523158caa40db4a2787cb01411994ea4f" [];
        "fs.realpath@^1.0.0" = s."fs.realpath@1.0.0";
        "fsevents@1.2.13" = f "fsevents" "1.2.13" y "f325cb0455592428bcf11b383370ef70e3bfcc38" [
          (s."bindings@^1.5.0")
          (s."nan@^2.12.1")
          ];
        "fsevents@^1.2.7" = s."fsevents@1.2.13";
        "function-bind@1.1.1" = f "function-bind" "1.1.1" y "a56899d3ea3c9bab874bb9773b7c5ede92f4895d" [];
        "function-bind@^1.1.1" = s."function-bind@1.1.1";
        "gensync@1.0.0-beta.1" = f "gensync" "1.0.0-beta.1" y "58f4361ff987e5ff6e1e7a210827aa371eaac269" [];
        "gensync@^1.0.0-beta.1" = s."gensync@1.0.0-beta.1";
        "get-caller-file@2.0.5" = f "get-caller-file" "2.0.5" y "4f94412a82db32f36e3b0b9741f8a97feb031f7e" [];
        "get-caller-file@^2.0.1" = s."get-caller-file@2.0.5";
        "get-stream@4.1.0" = f "get-stream" "4.1.0" y "c1b255575f3dc21d59bfc79cd3d2b46b1c3a54b5" [
          (s."pump@^3.0.0")
          ];
        "get-stream@^4.0.0" = s."get-stream@4.1.0";
        "get-value@2.0.6" = f "get-value" "2.0.6" y "dc15ca1c672387ca76bd37ac0a395ba2042a2c28" [];
        "get-value@^2.0.3" = s."get-value@2.0.6";
        "get-value@^2.0.6" = s."get-value@2.0.6";
        "getpass@0.1.7" = f "getpass" "0.1.7" y "5eff8e3e684d569ae4cb2b1282604e8ba62149fa" [
          (s."assert-plus@^1.0.0")
          ];
        "getpass@^0.1.1" = s."getpass@0.1.7";
        "glob@7.1.6" = f "glob" "7.1.6" y "141f33b81a7c2492e125594307480c46679278a6" [
          (s."fs.realpath@^1.0.0")
          (s."inflight@^1.0.4")
          (s."inherits@2")
          (s."minimatch@^3.0.4")
          (s."once@^1.3.0")
          (s."path-is-absolute@^1.0.0")
          ];
        "glob@^7.1.1" = s."glob@7.1.6";
        "glob@^7.1.2" = s."glob@7.1.6";
        "glob@^7.1.3" = s."glob@7.1.6";
        "globals@11.12.0" = f "globals" "11.12.0" y "ab8795338868a0babd8525758018c2a7eb95c42e" [];
        "globals@^11.1.0" = s."globals@11.12.0";
        "graceful-fs@4.2.4" = f "graceful-fs" "4.2.4" y "2256bde14d3632958c465ebc96dc467ca07a29fb" [];
        "graceful-fs@^4.1.11" = s."graceful-fs@4.2.4";
        "graceful-fs@^4.1.15" = s."graceful-fs@4.2.4";
        "graceful-fs@^4.1.2" = s."graceful-fs@4.2.4";
        "growly@1.3.0" = f "growly" "1.3.0" y "f10748cbe76af964b7c96c93c6bcc28af120c081" [];
        "growly@^1.3.0" = s."growly@1.3.0";
        "har-schema@2.0.0" = f "har-schema" "2.0.0" y "a94c2224ebcac04782a0d9035521f24735b7ec92" [];
        "har-schema@^2.0.0" = s."har-schema@2.0.0";
        "har-validator@5.1.5" = f "har-validator" "5.1.5" y "1f0803b9f8cb20c0fa13822df1ecddb36bde1efd" [
          (s."ajv@^6.12.3")
          (s."har-schema@^2.0.0")
          ];
        "har-validator@~5.1.3" = s."har-validator@5.1.5";
        "has-flag@3.0.0" = f "has-flag" "3.0.0" y "b5d454dc2199ae225699f3467e5a07f3b955bafd" [];
        "has-flag@^3.0.0" = s."has-flag@3.0.0";
        "has-symbols@1.0.1" = f "has-symbols" "1.0.1" y "9f5214758a44196c406d9bd76cebf81ec2dd31e8" [];
        "has-symbols@^1.0.1" = s."has-symbols@1.0.1";
        "has-value@0.3.1" = f "has-value" "0.3.1" y "7b1f58bada62ca827ec0a2078025654845995e1f" [
          (s."get-value@^2.0.3")
          (s."has-values@^0.1.4")
          (s."isobject@^2.0.0")
          ];
        "has-value@1.0.0" = f "has-value" "1.0.0" y "18b281da585b1c5c51def24c930ed29a0be6b177" [
          (s."get-value@^2.0.6")
          (s."has-values@^1.0.0")
          (s."isobject@^3.0.0")
          ];
        "has-value@^0.3.1" = s."has-value@0.3.1";
        "has-value@^1.0.0" = s."has-value@1.0.0";
        "has-values@0.1.4" = f "has-values" "0.1.4" y "6d61de95d91dfca9b9a02089ad384bff8f62b771" [];
        "has-values@1.0.0" = f "has-values" "1.0.0" y "95b0b63fec2146619a6fe57fe75628d5a39efe4f" [
          (s."is-number@^3.0.0")
          (s."kind-of@^4.0.0")
          ];
        "has-values@^0.1.4" = s."has-values@0.1.4";
        "has-values@^1.0.0" = s."has-values@1.0.0";
        "has@1.0.3" = f "has" "1.0.3" y "722d7cbfc1f6aa8241f16dd814e011e1f41e8796" [
          (s."function-bind@^1.1.1")
          ];
        "has@^1.0.3" = s."has@1.0.3";
        "hosted-git-info@2.8.8" = f "hosted-git-info" "2.8.8" y "7539bd4bc1e0e0a895815a2e0262420b12858488" [];
        "hosted-git-info@^2.1.4" = s."hosted-git-info@2.8.8";
        "html-encoding-sniffer@1.0.2" = f "html-encoding-sniffer" "1.0.2" y "e70d84b94da53aa375e11fe3a351be6642ca46f8" [
          (s."whatwg-encoding@^1.0.1")
          ];
        "html-encoding-sniffer@^1.0.2" = s."html-encoding-sniffer@1.0.2";
        "html-escaper@2.0.2" = f "html-escaper" "2.0.2" y "dfd60027da36a36dfcbe236262c00a5822681453" [];
        "html-escaper@^2.0.0" = s."html-escaper@2.0.2";
        "http-signature@1.2.0" = f "http-signature" "1.2.0" y "9aecd925114772f3d95b65a60abb8f7c18fbace1" [
          (s."assert-plus@^1.0.0")
          (s."jsprim@^1.2.2")
          (s."sshpk@^1.7.0")
          ];
        "http-signature@~1.2.0" = s."http-signature@1.2.0";
        "iconv-lite@0.4.24" = f "iconv-lite" "0.4.24" y "2022b4b25fbddc21d2f524974a474aafe733908b" [
          (s."safer-buffer@>= 2.1.2 < 3")
          ];
        "import-local@2.0.0" = f "import-local" "2.0.0" y "55070be38a5993cf18ef6db7e961f5bee5c5a09d" [
          (s."pkg-dir@^3.0.0")
          (s."resolve-cwd@^2.0.0")
          ];
        "import-local@^2.0.0" = s."import-local@2.0.0";
        "imurmurhash@0.1.4" = f "imurmurhash" "0.1.4" y "9218b9b2b928a238b13dc4fb6b6d576f231453ea" [];
        "imurmurhash@^0.1.4" = s."imurmurhash@0.1.4";
        "inflight@1.0.6" = f "inflight" "1.0.6" y "49bd6331d7d02d0c09bc910a1075ba8165b56df9" [
          (s."once@^1.3.0")
          (s."wrappy@1")
          ];
        "inflight@^1.0.4" = s."inflight@1.0.6";
        "inherits@2" = s."inherits@2.0.4";
        "inherits@2.0.4" = f "inherits" "2.0.4" y "0fa2c64f932917c3433a0ded55363aae37416b7c" [];
        "invariant@2.2.4" = f "invariant" "2.2.4" y "610f3c92c9359ce1db616e538008d23ff35158e6" [
          (s."loose-envify@^1.0.0")
          ];
        "invariant@^2.2.4" = s."invariant@2.2.4";
        "is-accessor-descriptor@0.1.6" = f "is-accessor-descriptor" "0.1.6" y "a9e12cb3ae8d876727eeef3843f8a0897b5c98d6" [
          (s."kind-of@^3.0.2")
          ];
        "is-accessor-descriptor@1.0.0" = f "is-accessor-descriptor" "1.0.0" y "169c2f6d3df1f992618072365c9b0ea1f6878656" [
          (s."kind-of@^6.0.0")
          ];
        "is-accessor-descriptor@^0.1.6" = s."is-accessor-descriptor@0.1.6";
        "is-accessor-descriptor@^1.0.0" = s."is-accessor-descriptor@1.0.0";
        "is-arrayish@0.2.1" = f "is-arrayish" "0.2.1" y "77c99840527aa8ecb1a8ba697b80645a7a926a9d" [];
        "is-arrayish@^0.2.1" = s."is-arrayish@0.2.1";
        "is-buffer@1.1.6" = f "is-buffer" "1.1.6" y "efaa2ea9daa0d7ab2ea13a97b2b8ad51fefbe8be" [];
        "is-buffer@^1.1.5" = s."is-buffer@1.1.6";
        "is-callable@1.2.2" = f "is-callable" "1.2.2" y "c7c6715cd22d4ddb48d3e19970223aceabb080d9" [];
        "is-callable@^1.1.4" = s."is-callable@1.2.2";
        "is-callable@^1.2.2" = s."is-callable@1.2.2";
        "is-ci@2.0.0" = f "is-ci" "2.0.0" y "6bc6334181810e04b5c22b3d589fdca55026404c" [
          (s."ci-info@^2.0.0")
          ];
        "is-ci@^2.0.0" = s."is-ci@2.0.0";
        "is-data-descriptor@0.1.4" = f "is-data-descriptor" "0.1.4" y "0b5ee648388e2c860282e793f1856fec3f301b56" [
          (s."kind-of@^3.0.2")
          ];
        "is-data-descriptor@1.0.0" = f "is-data-descriptor" "1.0.0" y "d84876321d0e7add03990406abbbbd36ba9268c7" [
          (s."kind-of@^6.0.0")
          ];
        "is-data-descriptor@^0.1.4" = s."is-data-descriptor@0.1.4";
        "is-data-descriptor@^1.0.0" = s."is-data-descriptor@1.0.0";
        "is-date-object@1.0.2" = f "is-date-object" "1.0.2" y "bda736f2cd8fd06d32844e7743bfa7494c3bfd7e" [];
        "is-date-object@^1.0.1" = s."is-date-object@1.0.2";
        "is-descriptor@0.1.6" = f "is-descriptor" "0.1.6" y "366d8240dde487ca51823b1ab9f07a10a78251ca" [
          (s."is-accessor-descriptor@^0.1.6")
          (s."is-data-descriptor@^0.1.4")
          (s."kind-of@^5.0.0")
          ];
        "is-descriptor@1.0.2" = f "is-descriptor" "1.0.2" y "3b159746a66604b04f8c81524ba365c5f14d86ec" [
          (s."is-accessor-descriptor@^1.0.0")
          (s."is-data-descriptor@^1.0.0")
          (s."kind-of@^6.0.2")
          ];
        "is-descriptor@^0.1.0" = s."is-descriptor@0.1.6";
        "is-descriptor@^1.0.0" = s."is-descriptor@1.0.2";
        "is-descriptor@^1.0.2" = s."is-descriptor@1.0.2";
        "is-extendable@0.1.1" = f "is-extendable" "0.1.1" y "62b110e289a471418e3ec36a617d472e301dfc89" [];
        "is-extendable@1.0.1" = f "is-extendable" "1.0.1" y "a7470f9e426733d81bd81e1155264e3a3507cab4" [
          (s."is-plain-object@^2.0.4")
          ];
        "is-extendable@^0.1.0" = s."is-extendable@0.1.1";
        "is-extendable@^0.1.1" = s."is-extendable@0.1.1";
        "is-extendable@^1.0.1" = s."is-extendable@1.0.1";
        "is-fullwidth-code-point@2.0.0" = f "is-fullwidth-code-point" "2.0.0" y "a3b30a5c4f199183167aaab93beefae3ddfb654f" [];
        "is-fullwidth-code-point@^2.0.0" = s."is-fullwidth-code-point@2.0.0";
        "is-generator-fn@2.1.0" = f "is-generator-fn" "2.1.0" y "7d140adc389aaf3011a8f2a2a4cfa6faadffb118" [];
        "is-generator-fn@^2.0.0" = s."is-generator-fn@2.1.0";
        "is-negative-zero@2.0.0" = f "is-negative-zero" "2.0.0" y "9553b121b0fac28869da9ed459e20c7543788461" [];
        "is-negative-zero@^2.0.0" = s."is-negative-zero@2.0.0";
        "is-number@3.0.0" = f "is-number" "3.0.0" y "24fd6201a4782cf50561c810276afc7d12d71195" [
          (s."kind-of@^3.0.2")
          ];
        "is-number@^3.0.0" = s."is-number@3.0.0";
        "is-plain-object@2.0.4" = f "is-plain-object" "2.0.4" y "2c163b3fafb1b606d9d17928f05c2a1c38e07677" [
          (s."isobject@^3.0.1")
          ];
        "is-plain-object@^2.0.3" = s."is-plain-object@2.0.4";
        "is-plain-object@^2.0.4" = s."is-plain-object@2.0.4";
        "is-regex@1.1.1" = f "is-regex" "1.1.1" y "c6f98aacc546f6cec5468a07b7b153ab564a57b9" [
          (s."has-symbols@^1.0.1")
          ];
        "is-regex@^1.1.1" = s."is-regex@1.1.1";
        "is-stream@1.1.0" = f "is-stream" "1.1.0" y "12d4a3dd4e68e0b79ceb8dbc84173ae80d91ca44" [];
        "is-stream@^1.1.0" = s."is-stream@1.1.0";
        "is-symbol@1.0.3" = f "is-symbol" "1.0.3" y "38e1014b9e6329be0de9d24a414fd7441ec61937" [
          (s."has-symbols@^1.0.1")
          ];
        "is-symbol@^1.0.2" = s."is-symbol@1.0.3";
        "is-typedarray@1.0.0" = f "is-typedarray" "1.0.0" y "e479c80858df0c1b11ddda6940f96011fcda4a9a" [];
        "is-typedarray@~1.0.0" = s."is-typedarray@1.0.0";
        "is-windows@1.0.2" = f "is-windows" "1.0.2" y "d1850eb9791ecd18e6182ce12a30f396634bb19d" [];
        "is-windows@^1.0.2" = s."is-windows@1.0.2";
        "is-wsl@1.1.0" = f "is-wsl" "1.1.0" y "1f16e4aa22b04d1336b66188a66af3c600c3a66d" [];
        "is-wsl@^1.1.0" = s."is-wsl@1.1.0";
        "isarray@1.0.0" = f "isarray" "1.0.0" y "bb935d48582cba168c06834957a54a3e07124f11" [];
        "isexe@2.0.0" = f "isexe" "2.0.0" y "e8fbf374dc556ff8947a10dcb0572d633f2cfa10" [];
        "isexe@^2.0.0" = s."isexe@2.0.0";
        "isobject@2.1.0" = f "isobject" "2.1.0" y "f065561096a3f1da2ef46272f815c840d87e0c89" [
          (s."isarray@1.0.0")
          ];
        "isobject@3.0.1" = f "isobject" "3.0.1" y "4e431e92b11a9731636aa1f9c8d1ccbcfdab78df" [];
        "isobject@^2.0.0" = s."isobject@2.1.0";
        "isobject@^3.0.0" = s."isobject@3.0.1";
        "isobject@^3.0.1" = s."isobject@3.0.1";
        "isstream@0.1.2" = f "isstream" "0.1.2" y "47e63f7af55afa6f92e1500e690eb8b8529c099a" [];
        "isstream@~0.1.2" = s."isstream@0.1.2";
        "istanbul-lib-coverage@2.0.5" = f "istanbul-lib-coverage" "2.0.5" y "675f0ab69503fad4b1d849f736baaca803344f49" [];
        "istanbul-lib-coverage@^2.0.2" = s."istanbul-lib-coverage@2.0.5";
        "istanbul-lib-coverage@^2.0.5" = s."istanbul-lib-coverage@2.0.5";
        "istanbul-lib-instrument@3.3.0" = f "istanbul-lib-instrument" "3.3.0" y "a5f63d91f0bbc0c3e479ef4c5de027335ec6d630" [
          (s."@babel/generator@^7.4.0")
          (s."@babel/parser@^7.4.3")
          (s."@babel/template@^7.4.0")
          (s."@babel/traverse@^7.4.3")
          (s."@babel/types@^7.4.0")
          (s."istanbul-lib-coverage@^2.0.5")
          (s."semver@^6.0.0")
          ];
        "istanbul-lib-instrument@^3.0.1" = s."istanbul-lib-instrument@3.3.0";
        "istanbul-lib-instrument@^3.3.0" = s."istanbul-lib-instrument@3.3.0";
        "istanbul-lib-report@2.0.8" = f "istanbul-lib-report" "2.0.8" y "5a8113cd746d43c4889eba36ab10e7d50c9b4f33" [
          (s."istanbul-lib-coverage@^2.0.5")
          (s."make-dir@^2.1.0")
          (s."supports-color@^6.1.0")
          ];
        "istanbul-lib-report@^2.0.4" = s."istanbul-lib-report@2.0.8";
        "istanbul-lib-source-maps@3.0.6" = f "istanbul-lib-source-maps" "3.0.6" y "284997c48211752ec486253da97e3879defba8c8" [
          (s."debug@^4.1.1")
          (s."istanbul-lib-coverage@^2.0.5")
          (s."make-dir@^2.1.0")
          (s."rimraf@^2.6.3")
          (s."source-map@^0.6.1")
          ];
        "istanbul-lib-source-maps@^3.0.1" = s."istanbul-lib-source-maps@3.0.6";
        "istanbul-reports@2.2.7" = f "istanbul-reports" "2.2.7" y "5d939f6237d7b48393cc0959eab40cd4fd056931" [
          (s."html-escaper@^2.0.0")
          ];
        "istanbul-reports@^2.2.6" = s."istanbul-reports@2.2.7";
        "jest-changed-files@24.9.0" = f "jest-changed-files" "24.9.0" y "08d8c15eb79a7fa3fc98269bc14b451ee82f8039" [
          (s."@jest/types@^24.9.0")
          (s."execa@^1.0.0")
          (s."throat@^4.0.0")
          ];
        "jest-changed-files@^24.9.0" = s."jest-changed-files@24.9.0";
        "jest-cli@24.9.0" = f "jest-cli" "24.9.0" y "ad2de62d07472d419c6abc301fc432b98b10d2af" [
          (s."@jest/core@^24.9.0")
          (s."@jest/test-result@^24.9.0")
          (s."@jest/types@^24.9.0")
          (s."chalk@^2.0.1")
          (s."exit@^0.1.2")
          (s."import-local@^2.0.0")
          (s."is-ci@^2.0.0")
          (s."jest-config@^24.9.0")
          (s."jest-util@^24.9.0")
          (s."jest-validate@^24.9.0")
          (s."prompts@^2.0.1")
          (s."realpath-native@^1.1.0")
          (s."yargs@^13.3.0")
          ];
        "jest-cli@^24.9.0" = s."jest-cli@24.9.0";
        "jest-config@24.9.0" = f "jest-config" "24.9.0" y "fb1bbc60c73a46af03590719efa4825e6e4dd1b5" [
          (s."@babel/core@^7.1.0")
          (s."@jest/test-sequencer@^24.9.0")
          (s."@jest/types@^24.9.0")
          (s."babel-jest@^24.9.0")
          (s."chalk@^2.0.1")
          (s."glob@^7.1.1")
          (s."jest-environment-jsdom@^24.9.0")
          (s."jest-environment-node@^24.9.0")
          (s."jest-get-type@^24.9.0")
          (s."jest-jasmine2@^24.9.0")
          (s."jest-regex-util@^24.3.0")
          (s."jest-resolve@^24.9.0")
          (s."jest-util@^24.9.0")
          (s."jest-validate@^24.9.0")
          (s."micromatch@^3.1.10")
          (s."pretty-format@^24.9.0")
          (s."realpath-native@^1.1.0")
          ];
        "jest-config@^24.9.0" = s."jest-config@24.9.0";
        "jest-diff@24.9.0" = f "jest-diff" "24.9.0" y "931b7d0d5778a1baf7452cb816e325e3724055da" [
          (s."chalk@^2.0.1")
          (s."diff-sequences@^24.9.0")
          (s."jest-get-type@^24.9.0")
          (s."pretty-format@^24.9.0")
          ];
        "jest-diff@^24.8.0" = s."jest-diff@24.9.0";
        "jest-diff@^24.9.0" = s."jest-diff@24.9.0";
        "jest-docblock@24.9.0" = f "jest-docblock" "24.9.0" y "7970201802ba560e1c4092cc25cbedf5af5a8ce2" [
          (s."detect-newline@^2.1.0")
          ];
        "jest-docblock@^24.3.0" = s."jest-docblock@24.9.0";
        "jest-each@24.9.0" = f "jest-each" "24.9.0" y "eb2da602e2a610898dbc5f1f6df3ba86b55f8b05" [
          (s."@jest/types@^24.9.0")
          (s."chalk@^2.0.1")
          (s."jest-get-type@^24.9.0")
          (s."jest-util@^24.9.0")
          (s."pretty-format@^24.9.0")
          ];
        "jest-each@^24.9.0" = s."jest-each@24.9.0";
        "jest-environment-jsdom@24.9.0" = f "jest-environment-jsdom" "24.9.0" y "4b0806c7fc94f95edb369a69cc2778eec2b7375b" [
          (s."@jest/environment@^24.9.0")
          (s."@jest/fake-timers@^24.9.0")
          (s."@jest/types@^24.9.0")
          (s."jest-mock@^24.9.0")
          (s."jest-util@^24.9.0")
          (s."jsdom@^11.5.1")
          ];
        "jest-environment-jsdom@^24.9.0" = s."jest-environment-jsdom@24.9.0";
        "jest-environment-node@24.9.0" = f "jest-environment-node" "24.9.0" y "333d2d2796f9687f2aeebf0742b519f33c1cbfd3" [
          (s."@jest/environment@^24.9.0")
          (s."@jest/fake-timers@^24.9.0")
          (s."@jest/types@^24.9.0")
          (s."jest-mock@^24.9.0")
          (s."jest-util@^24.9.0")
          ];
        "jest-environment-node@^24.9.0" = s."jest-environment-node@24.9.0";
        "jest-get-type@24.9.0" = f "jest-get-type" "24.9.0" y "1684a0c8a50f2e4901b6644ae861f579eed2ef0e" [];
        "jest-get-type@^24.9.0" = s."jest-get-type@24.9.0";
        "jest-haste-map@24.9.0" = f "jest-haste-map" "24.9.0" y "b38a5d64274934e21fa417ae9a9fbeb77ceaac7d" [
          (s."@jest/types@^24.9.0")
          (s."anymatch@^2.0.0")
          (s."fb-watchman@^2.0.0")
          (s."graceful-fs@^4.1.15")
          (s."invariant@^2.2.4")
          (s."jest-serializer@^24.9.0")
          (s."jest-util@^24.9.0")
          (s."jest-worker@^24.9.0")
          (s."micromatch@^3.1.10")
          (s."sane@^4.0.3")
          (s."walker@^1.0.7")
          (s."fsevents@^1.2.7")
          ];
        "jest-haste-map@^24.9.0" = s."jest-haste-map@24.9.0";
        "jest-jasmine2@24.9.0" = f "jest-jasmine2" "24.9.0" y "1f7b1bd3242c1774e62acabb3646d96afc3be6a0" [
          (s."@babel/traverse@^7.1.0")
          (s."@jest/environment@^24.9.0")
          (s."@jest/test-result@^24.9.0")
          (s."@jest/types@^24.9.0")
          (s."chalk@^2.0.1")
          (s."co@^4.6.0")
          (s."expect@^24.9.0")
          (s."is-generator-fn@^2.0.0")
          (s."jest-each@^24.9.0")
          (s."jest-matcher-utils@^24.9.0")
          (s."jest-message-util@^24.9.0")
          (s."jest-snapshot@^24.9.0")
          (s."jest-util@^24.9.0")
          (s."pretty-format@^24.9.0")
          (s."throat@^4.0.0")
          ];
        "jest-jasmine2@^24.9.0" = s."jest-jasmine2@24.9.0";
        "jest-leak-detector@24.9.0" = f "jest-leak-detector" "24.9.0" y "b665dea7c77100c5c4f7dfcb153b65cf07dcf96a" [
          (s."jest-get-type@^24.9.0")
          (s."pretty-format@^24.9.0")
          ];
        "jest-leak-detector@^24.9.0" = s."jest-leak-detector@24.9.0";
        "jest-matcher-utils@24.9.0" = f "jest-matcher-utils" "24.9.0" y "f5b3661d5e628dffe6dd65251dfdae0e87c3a073" [
          (s."chalk@^2.0.1")
          (s."jest-diff@^24.9.0")
          (s."jest-get-type@^24.9.0")
          (s."pretty-format@^24.9.0")
          ];
        "jest-matcher-utils@^24.9.0" = s."jest-matcher-utils@24.9.0";
        "jest-message-util@24.9.0" = f "jest-message-util" "24.9.0" y "527f54a1e380f5e202a8d1149b0ec872f43119e3" [
          (s."@babel/code-frame@^7.0.0")
          (s."@jest/test-result@^24.9.0")
          (s."@jest/types@^24.9.0")
          (s."@types/stack-utils@^1.0.1")
          (s."chalk@^2.0.1")
          (s."micromatch@^3.1.10")
          (s."slash@^2.0.0")
          (s."stack-utils@^1.0.1")
          ];
        "jest-message-util@^24.9.0" = s."jest-message-util@24.9.0";
        "jest-mock@24.9.0" = f "jest-mock" "24.9.0" y "c22835541ee379b908673ad51087a2185c13f1c6" [
          (s."@jest/types@^24.9.0")
          ];
        "jest-mock@^24.9.0" = s."jest-mock@24.9.0";
        "jest-pnp-resolver@1.2.2" = f "jest-pnp-resolver" "1.2.2" y "b704ac0ae028a89108a4d040b3f919dfddc8e33c" [];
        "jest-pnp-resolver@^1.2.1" = s."jest-pnp-resolver@1.2.2";
        "jest-regex-util@24.9.0" = f "jest-regex-util" "24.9.0" y "c13fb3380bde22bf6575432c493ea8fe37965636" [];
        "jest-regex-util@^24.3.0" = s."jest-regex-util@24.9.0";
        "jest-regex-util@^24.9.0" = s."jest-regex-util@24.9.0";
        "jest-resolve-dependencies@24.9.0" = f "jest-resolve-dependencies" "24.9.0" y "ad055198959c4cfba8a4f066c673a3f0786507ab" [
          (s."@jest/types@^24.9.0")
          (s."jest-regex-util@^24.3.0")
          (s."jest-snapshot@^24.9.0")
          ];
        "jest-resolve-dependencies@^24.9.0" = s."jest-resolve-dependencies@24.9.0";
        "jest-resolve@24.9.0" = f "jest-resolve" "24.9.0" y "dff04c7687af34c4dd7e524892d9cf77e5d17321" [
          (s."@jest/types@^24.9.0")
          (s."browser-resolve@^1.11.3")
          (s."chalk@^2.0.1")
          (s."jest-pnp-resolver@^1.2.1")
          (s."realpath-native@^1.1.0")
          ];
        "jest-resolve@^24.9.0" = s."jest-resolve@24.9.0";
        "jest-runner@24.9.0" = f "jest-runner" "24.9.0" y "574fafdbd54455c2b34b4bdf4365a23857fcdf42" [
          (s."@jest/console@^24.7.1")
          (s."@jest/environment@^24.9.0")
          (s."@jest/test-result@^24.9.0")
          (s."@jest/types@^24.9.0")
          (s."chalk@^2.4.2")
          (s."exit@^0.1.2")
          (s."graceful-fs@^4.1.15")
          (s."jest-docblock@^24.3.0")
          (s."jest-haste-map@^24.9.0")
          (s."jest-jasmine2@^24.9.0")
          (s."jest-leak-detector@^24.9.0")
          (s."jest-message-util@^24.9.0")
          (s."jest-resolve@^24.9.0")
          (s."jest-util@^24.9.0")
          (s."jest-worker@^24.6.0")
          (s."source-map-support@^0.5.6")
          (s."throat@^4.0.0")
          ];
        "jest-runner@^24.9.0" = s."jest-runner@24.9.0";
        "jest-runtime@24.9.0" = f "jest-runtime" "24.9.0" y "9f14583af6a4f7314a6a9d9f0226e1a781c8e4ac" [
          (s."@jest/console@^24.7.1")
          (s."@jest/environment@^24.9.0")
          (s."@jest/source-map@^24.3.0")
          (s."@jest/transform@^24.9.0")
          (s."@jest/types@^24.9.0")
          (s."@types/yargs@^13.0.0")
          (s."chalk@^2.0.1")
          (s."exit@^0.1.2")
          (s."glob@^7.1.3")
          (s."graceful-fs@^4.1.15")
          (s."jest-config@^24.9.0")
          (s."jest-haste-map@^24.9.0")
          (s."jest-message-util@^24.9.0")
          (s."jest-mock@^24.9.0")
          (s."jest-regex-util@^24.3.0")
          (s."jest-resolve@^24.9.0")
          (s."jest-snapshot@^24.9.0")
          (s."jest-util@^24.9.0")
          (s."jest-validate@^24.9.0")
          (s."realpath-native@^1.1.0")
          (s."slash@^2.0.0")
          (s."strip-bom@^3.0.0")
          (s."yargs@^13.3.0")
          ];
        "jest-runtime@^24.9.0" = s."jest-runtime@24.9.0";
        "jest-serializer@24.9.0" = f "jest-serializer" "24.9.0" y "e6d7d7ef96d31e8b9079a714754c5d5c58288e73" [];
        "jest-serializer@^24.9.0" = s."jest-serializer@24.9.0";
        "jest-snapshot@24.9.0" = f "jest-snapshot" "24.9.0" y "ec8e9ca4f2ec0c5c87ae8f925cf97497b0e951ba" [
          (s."@babel/types@^7.0.0")
          (s."@jest/types@^24.9.0")
          (s."chalk@^2.0.1")
          (s."expect@^24.9.0")
          (s."jest-diff@^24.9.0")
          (s."jest-get-type@^24.9.0")
          (s."jest-matcher-utils@^24.9.0")
          (s."jest-message-util@^24.9.0")
          (s."jest-resolve@^24.9.0")
          (s."mkdirp@^0.5.1")
          (s."natural-compare@^1.4.0")
          (s."pretty-format@^24.9.0")
          (s."semver@^6.2.0")
          ];
        "jest-snapshot@^24.9.0" = s."jest-snapshot@24.9.0";
        "jest-util@24.9.0" = f "jest-util" "24.9.0" y "7396814e48536d2e85a37de3e4c431d7cb140162" [
          (s."@jest/console@^24.9.0")
          (s."@jest/fake-timers@^24.9.0")
          (s."@jest/source-map@^24.9.0")
          (s."@jest/test-result@^24.9.0")
          (s."@jest/types@^24.9.0")
          (s."callsites@^3.0.0")
          (s."chalk@^2.0.1")
          (s."graceful-fs@^4.1.15")
          (s."is-ci@^2.0.0")
          (s."mkdirp@^0.5.1")
          (s."slash@^2.0.0")
          (s."source-map@^0.6.0")
          ];
        "jest-util@^24.9.0" = s."jest-util@24.9.0";
        "jest-validate@24.9.0" = f "jest-validate" "24.9.0" y "0775c55360d173cd854e40180756d4ff52def8ab" [
          (s."@jest/types@^24.9.0")
          (s."camelcase@^5.3.1")
          (s."chalk@^2.0.1")
          (s."jest-get-type@^24.9.0")
          (s."leven@^3.1.0")
          (s."pretty-format@^24.9.0")
          ];
        "jest-validate@^24.9.0" = s."jest-validate@24.9.0";
        "jest-watcher@24.9.0" = f "jest-watcher" "24.9.0" y "4b56e5d1ceff005f5b88e528dc9afc8dd4ed2b3b" [
          (s."@jest/test-result@^24.9.0")
          (s."@jest/types@^24.9.0")
          (s."@types/yargs@^13.0.0")
          (s."ansi-escapes@^3.0.0")
          (s."chalk@^2.0.1")
          (s."jest-util@^24.9.0")
          (s."string-length@^2.0.0")
          ];
        "jest-watcher@^24.9.0" = s."jest-watcher@24.9.0";
        "jest-worker@24.9.0" = f "jest-worker" "24.9.0" y "5dbfdb5b2d322e98567898238a9697bcce67b3e5" [
          (s."merge-stream@^2.0.0")
          (s."supports-color@^6.1.0")
          ];
        "jest-worker@^24.6.0" = s."jest-worker@24.9.0";
        "jest-worker@^24.9.0" = s."jest-worker@24.9.0";
        "jest@24.9.0" = f "jest" "24.9.0" y "987d290c05a08b52c56188c1002e368edb007171" [
          (s."import-local@^2.0.0")
          (s."jest-cli@^24.9.0")
          ];
        "jest@^24.8.0" = s."jest@24.9.0";
        "js-tokens@4.0.0" = f "js-tokens" "4.0.0" y "19203fb59991df98e3a287050d4647cdeaf32499" [];
        "js-tokens@^3.0.0 || ^4.0.0" = s."js-tokens@4.0.0";
        "js-tokens@^4.0.0" = s."js-tokens@4.0.0";
        "jsbn@0.1.1" = f "jsbn" "0.1.1" y "a5e654c2e5a2deb5f201d96cefbca80c0ef2f513" [];
        "jsbn@~0.1.0" = s."jsbn@0.1.1";
        "jsdom@11.12.0" = f "jsdom" "11.12.0" y "1a80d40ddd378a1de59656e9e6dc5a3ba8657bc8" [
          (s."abab@^2.0.0")
          (s."acorn@^5.5.3")
          (s."acorn-globals@^4.1.0")
          (s."array-equal@^1.0.0")
          (s."cssom@>= 0.3.2 < 0.4.0")
          (s."cssstyle@^1.0.0")
          (s."data-urls@^1.0.0")
          (s."domexception@^1.0.1")
          (s."escodegen@^1.9.1")
          (s."html-encoding-sniffer@^1.0.2")
          (s."left-pad@^1.3.0")
          (s."nwsapi@^2.0.7")
          (s."parse5@4.0.0")
          (s."pn@^1.1.0")
          (s."request@^2.87.0")
          (s."request-promise-native@^1.0.5")
          (s."sax@^1.2.4")
          (s."symbol-tree@^3.2.2")
          (s."tough-cookie@^2.3.4")
          (s."w3c-hr-time@^1.0.1")
          (s."webidl-conversions@^4.0.2")
          (s."whatwg-encoding@^1.0.3")
          (s."whatwg-mimetype@^2.1.0")
          (s."whatwg-url@^6.4.1")
          (s."ws@^5.2.0")
          (s."xml-name-validator@^3.0.0")
          ];
        "jsdom@^11.5.1" = s."jsdom@11.12.0";
        "jsesc@2.5.2" = f "jsesc" "2.5.2" y "80564d2e483dacf6e8ef209650a67df3f0c283a4" [];
        "jsesc@^2.5.1" = s."jsesc@2.5.2";
        "json-parse-better-errors@1.0.2" = f "json-parse-better-errors" "1.0.2" y "bb867cfb3450e69107c131d1c514bab3dc8bcaa9" [];
        "json-parse-better-errors@^1.0.1" = s."json-parse-better-errors@1.0.2";
        "json-schema-traverse@0.4.1" = f "json-schema-traverse" "0.4.1" y "69f6a87d9513ab8bb8fe63bdb0979c448e684660" [];
        "json-schema-traverse@^0.4.1" = s."json-schema-traverse@0.4.1";
        "json-schema@0.2.3" = f "json-schema" "0.2.3" y "b480c892e59a2f05954ce727bd3f2a4e882f9e13" [];
        "json-stringify-safe@5.0.1" = f "json-stringify-safe" "5.0.1" y "1296a2d58fd45f19a0f6ce01d65701e2c735b6eb" [];
        "json-stringify-safe@~5.0.1" = s."json-stringify-safe@5.0.1";
        "json5@2.1.3" = f "json5" "2.1.3" y "c9b0f7fa9233bfe5807fe66fcf3a5617ed597d43" [
          (s."minimist@^1.2.5")
          ];
        "json5@^2.1.2" = s."json5@2.1.3";
        "jsprim@1.4.1" = f "jsprim" "1.4.1" y "313e66bc1e5cc06e438bc1b7499c2e5c56acb6a2" [
          (s."assert-plus@1.0.0")
          (s."extsprintf@1.3.0")
          (s."json-schema@0.2.3")
          (s."verror@1.10.0")
          ];
        "jsprim@^1.2.2" = s."jsprim@1.4.1";
        "kind-of@3.2.2" = f "kind-of" "3.2.2" y "31ea21a734bab9bbb0f32466d893aea51e4a3c64" [
          (s."is-buffer@^1.1.5")
          ];
        "kind-of@4.0.0" = f "kind-of" "4.0.0" y "20813df3d712928b207378691a45066fae72dd57" [
          (s."is-buffer@^1.1.5")
          ];
        "kind-of@5.1.0" = f "kind-of" "5.1.0" y "729c91e2d857b7a419a1f9aa65685c4c33f5845d" [];
        "kind-of@6.0.3" = f "kind-of" "6.0.3" y "07c05034a6c349fa06e24fa35aa76db4580ce4dd" [];
        "kind-of@^3.0.2" = s."kind-of@3.2.2";
        "kind-of@^3.0.3" = s."kind-of@3.2.2";
        "kind-of@^3.2.0" = s."kind-of@3.2.2";
        "kind-of@^4.0.0" = s."kind-of@4.0.0";
        "kind-of@^5.0.0" = s."kind-of@5.1.0";
        "kind-of@^6.0.0" = s."kind-of@6.0.3";
        "kind-of@^6.0.2" = s."kind-of@6.0.3";
        "kleur@3.0.3" = f "kleur" "3.0.3" y "a79c9ecc86ee1ce3fa6206d1216c501f147fc07e" [];
        "kleur@^3.0.3" = s."kleur@3.0.3";
        "left-pad@1.3.0" = f "left-pad" "1.3.0" y "5b8a3a7765dfe001261dde915589e782f8c94d1e" [];
        "left-pad@^1.3.0" = s."left-pad@1.3.0";
        "leven@3.1.0" = f "leven" "3.1.0" y "77891de834064cccba82ae7842bb6b14a13ed7f2" [];
        "leven@^3.1.0" = s."leven@3.1.0";
        "levn@0.3.0" = f "levn" "0.3.0" y "3b09924edf9f083c0490fdd4c0bc4421e04764ee" [
          (s."prelude-ls@~1.1.2")
          (s."type-check@~0.3.2")
          ];
        "levn@~0.3.0" = s."levn@0.3.0";
        "load-json-file@4.0.0" = f "load-json-file" "4.0.0" y "2f5f45ab91e33216234fd53adab668eb4ec0993b" [
          (s."graceful-fs@^4.1.2")
          (s."parse-json@^4.0.0")
          (s."pify@^3.0.0")
          (s."strip-bom@^3.0.0")
          ];
        "load-json-file@^4.0.0" = s."load-json-file@4.0.0";
        "locate-path@3.0.0" = f "locate-path" "3.0.0" y "dbec3b3ab759758071b58fe59fc41871af21400e" [
          (s."p-locate@^3.0.0")
          (s."path-exists@^3.0.0")
          ];
        "locate-path@^3.0.0" = s."locate-path@3.0.0";
        "lodash.sortby@4.7.0" = f "lodash.sortby" "4.7.0" y "edd14c824e2cc9c1e0b0a1b42bb5210516a42438" [];
        "lodash.sortby@^4.7.0" = s."lodash.sortby@4.7.0";
        "lodash@4.17.20" = f "lodash" "4.17.20" y "b44a9b6297bcb698f1c51a3545a2b3b368d59c52" [];
        "lodash@^4.17.19" = s."lodash@4.17.20";
        "loose-envify@1.4.0" = f "loose-envify" "1.4.0" y "71ee51fa7be4caec1a63839f7e682d8132d30caf" [
          (s."js-tokens@^3.0.0 || ^4.0.0")
          ];
        "loose-envify@^1.0.0" = s."loose-envify@1.4.0";
        "make-dir@2.1.0" = f "make-dir" "2.1.0" y "5f0310e18b8be898cc07009295a30ae41e91e6f5" [
          (s."pify@^4.0.1")
          (s."semver@^5.6.0")
          ];
        "make-dir@^2.1.0" = s."make-dir@2.1.0";
        "makeerror@1.0.11" = f "makeerror" "1.0.11" y "e01a5c9109f2af79660e4e8b9587790184f5a96c" [
          (s."tmpl@1.0.x")
          ];
        "makeerror@1.0.x" = s."makeerror@1.0.11";
        "map-cache@0.2.2" = f "map-cache" "0.2.2" y "c32abd0bd6525d9b051645bb4f26ac5dc98a0dbf" [];
        "map-cache@^0.2.2" = s."map-cache@0.2.2";
        "map-visit@1.0.0" = f "map-visit" "1.0.0" y "ecdca8f13144e660f1b5bd41f12f3479d98dfb8f" [
          (s."object-visit@^1.0.0")
          ];
        "map-visit@^1.0.0" = s."map-visit@1.0.0";
        "merge-stream@2.0.0" = f "merge-stream" "2.0.0" y "52823629a14dd00c9770fb6ad47dc6310f2c1f60" [];
        "merge-stream@^2.0.0" = s."merge-stream@2.0.0";
        "micromatch@3.1.10" = f "micromatch" "3.1.10" y "70859bc95c9840952f359a068a3fc49f9ecfac23" [
          (s."arr-diff@^4.0.0")
          (s."array-unique@^0.3.2")
          (s."braces@^2.3.1")
          (s."define-property@^2.0.2")
          (s."extend-shallow@^3.0.2")
          (s."extglob@^2.0.4")
          (s."fragment-cache@^0.2.1")
          (s."kind-of@^6.0.2")
          (s."nanomatch@^1.2.9")
          (s."object.pick@^1.3.0")
          (s."regex-not@^1.0.0")
          (s."snapdragon@^0.8.1")
          (s."to-regex@^3.0.2")
          ];
        "micromatch@^3.1.10" = s."micromatch@3.1.10";
        "micromatch@^3.1.4" = s."micromatch@3.1.10";
        "mime-db@1.44.0" = f "mime-db" "1.44.0" y "fa11c5eb0aca1334b4233cb4d52f10c5a6272f92" [];
        "mime-types@2.1.27" = f "mime-types" "2.1.27" y "47949f98e279ea53119f5722e0f34e529bec009f" [
          (s."mime-db@1.44.0")
          ];
        "mime-types@^2.1.12" = s."mime-types@2.1.27";
        "mime-types@~2.1.19" = s."mime-types@2.1.27";
        "minimatch@3.0.4" = f "minimatch" "3.0.4" y "5166e286457f03306064be5497e8dbb0c3d32083" [
          (s."brace-expansion@^1.1.7")
          ];
        "minimatch@^3.0.4" = s."minimatch@3.0.4";
        "minimist@1.2.5" = f "minimist" "1.2.5" y "67d66014b66a6a8aaa0c083c5fd58df4e4e97602" [];
        "minimist@^1.1.1" = s."minimist@1.2.5";
        "minimist@^1.2.0" = s."minimist@1.2.5";
        "minimist@^1.2.5" = s."minimist@1.2.5";
        "mixin-deep@1.3.2" = f "mixin-deep" "1.3.2" y "1120b43dc359a785dce65b55b82e257ccf479566" [
          (s."for-in@^1.0.2")
          (s."is-extendable@^1.0.1")
          ];
        "mixin-deep@^1.2.0" = s."mixin-deep@1.3.2";
        "mkdirp@0.5.5" = f "mkdirp" "0.5.5" y "d91cefd62d1436ca0f41620e251288d420099def" [
          (s."minimist@^1.2.5")
          ];
        "mkdirp@^0.5.1" = s."mkdirp@0.5.5";
        "ms@2.0.0" = f "ms" "2.0.0" y "5608aeadfc00be6c2901df5f9861788de0d597c8" [];
        "ms@2.1.2" = f "ms" "2.1.2" y "d09d1f357b443f493382a8eb3ccd183872ae6009" [];
        "nan@2.14.1" = f "nan" "2.14.1" y "d7be34dfa3105b91494c3147089315eff8874b01" [];
        "nan@^2.12.1" = s."nan@2.14.1";
        "nanomatch@1.2.13" = f "nanomatch" "1.2.13" y "b87a8aa4fc0de8fe6be88895b38983ff265bd119" [
          (s."arr-diff@^4.0.0")
          (s."array-unique@^0.3.2")
          (s."define-property@^2.0.2")
          (s."extend-shallow@^3.0.2")
          (s."fragment-cache@^0.2.1")
          (s."is-windows@^1.0.2")
          (s."kind-of@^6.0.2")
          (s."object.pick@^1.3.0")
          (s."regex-not@^1.0.0")
          (s."snapdragon@^0.8.1")
          (s."to-regex@^3.0.1")
          ];
        "nanomatch@^1.2.9" = s."nanomatch@1.2.13";
        "natural-compare@1.4.0" = f "natural-compare" "1.4.0" y "4abebfeed7541f2c27acfb29bdbbd15c8d5ba4f7" [];
        "natural-compare@^1.4.0" = s."natural-compare@1.4.0";
        "nice-try@1.0.5" = f "nice-try" "1.0.5" y "a3378a7696ce7d223e88fc9b764bd7ef1089e366" [];
        "nice-try@^1.0.4" = s."nice-try@1.0.5";
        "node-int64@0.4.0" = f "node-int64" "0.4.0" y "87a9065cdb355d3182d8f94ce11188b825c68a3b" [];
        "node-int64@^0.4.0" = s."node-int64@0.4.0";
        "node-modules-regexp@1.0.0" = f "node-modules-regexp" "1.0.0" y "8d9dbe28964a4ac5712e9131642107c71e90ec40" [];
        "node-modules-regexp@^1.0.0" = s."node-modules-regexp@1.0.0";
        "node-notifier@5.4.3" = f "node-notifier" "5.4.3" y "cb72daf94c93904098e28b9c590fd866e464bd50" [
          (s."growly@^1.3.0")
          (s."is-wsl@^1.1.0")
          (s."semver@^5.5.0")
          (s."shellwords@^0.1.1")
          (s."which@^1.3.0")
          ];
        "node-notifier@^5.4.2" = s."node-notifier@5.4.3";
        "normalize-package-data@2.5.0" = f "normalize-package-data" "2.5.0" y "e66db1838b200c1dfc233225d12cb36520e234a8" [
          (s."hosted-git-info@^2.1.4")
          (s."resolve@^1.10.0")
          (s."semver@2 || 3 || 4 || 5")
          (s."validate-npm-package-license@^3.0.1")
          ];
        "normalize-package-data@^2.3.2" = s."normalize-package-data@2.5.0";
        "normalize-path@2.1.1" = f "normalize-path" "2.1.1" y "1ab28b556e198363a8c1a6f7e6fa20137fe6aed9" [
          (s."remove-trailing-separator@^1.0.1")
          ];
        "normalize-path@^2.1.1" = s."normalize-path@2.1.1";
        "npm-run-path@2.0.2" = f "npm-run-path" "2.0.2" y "35a9232dfa35d7067b4cb2ddf2357b1871536c5f" [
          (s."path-key@^2.0.0")
          ];
        "npm-run-path@^2.0.0" = s."npm-run-path@2.0.2";
        "nwsapi@2.2.0" = f "nwsapi" "2.2.0" y "204879a9e3d068ff2a55139c2c772780681a38b7" [];
        "nwsapi@^2.0.7" = s."nwsapi@2.2.0";
        "oauth-sign@0.9.0" = f "oauth-sign" "0.9.0" y "47a7b016baa68b5fa0ecf3dee08a85c679ac6455" [];
        "oauth-sign@~0.9.0" = s."oauth-sign@0.9.0";
        "object-copy@0.1.0" = f "object-copy" "0.1.0" y "7e7d858b781bd7c991a41ba975ed3812754e998c" [
          (s."copy-descriptor@^0.1.0")
          (s."define-property@^0.2.5")
          (s."kind-of@^3.0.3")
          ];
        "object-copy@^0.1.0" = s."object-copy@0.1.0";
        "object-inspect@1.8.0" = f "object-inspect" "1.8.0" y "df807e5ecf53a609cc6bfe93eac3cc7be5b3a9d0" [];
        "object-inspect@^1.8.0" = s."object-inspect@1.8.0";
        "object-keys@1.1.1" = f "object-keys" "1.1.1" y "1c47f272df277f3b1daf061677d9c82e2322c60e" [];
        "object-keys@^1.0.12" = s."object-keys@1.1.1";
        "object-keys@^1.1.1" = s."object-keys@1.1.1";
        "object-visit@1.0.1" = f "object-visit" "1.0.1" y "f79c4493af0c5377b59fe39d395e41042dd045bb" [
          (s."isobject@^3.0.0")
          ];
        "object-visit@^1.0.0" = s."object-visit@1.0.1";
        "object.assign@4.1.1" = f "object.assign" "4.1.1" y "303867a666cdd41936ecdedfb1f8f3e32a478cdd" [
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.18.0-next.0")
          (s."has-symbols@^1.0.1")
          (s."object-keys@^1.1.1")
          ];
        "object.assign@^4.1.1" = s."object.assign@4.1.1";
        "object.getownpropertydescriptors@2.1.0" = f "object.getownpropertydescriptors" "2.1.0" y "369bf1f9592d8ab89d712dced5cb81c7c5352649" [
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.17.0-next.1")
          ];
        "object.getownpropertydescriptors@^2.1.0" = s."object.getownpropertydescriptors@2.1.0";
        "object.pick@1.3.0" = f "object.pick" "1.3.0" y "87a10ac4c1694bd2e1cbf53591a66141fb5dd747" [
          (s."isobject@^3.0.1")
          ];
        "object.pick@^1.3.0" = s."object.pick@1.3.0";
        "once@1.4.0" = f "once" "1.4.0" y "583b1aa775961d4b113ac17d9c50baef9dd76bd1" [
          (s."wrappy@1")
          ];
        "once@^1.3.0" = s."once@1.4.0";
        "once@^1.3.1" = s."once@1.4.0";
        "once@^1.4.0" = s."once@1.4.0";
        "optionator@0.8.3" = f "optionator" "0.8.3" y "84fa1d036fe9d3c7e21d99884b601167ec8fb495" [
          (s."deep-is@~0.1.3")
          (s."fast-levenshtein@~2.0.6")
          (s."levn@~0.3.0")
          (s."prelude-ls@~1.1.2")
          (s."type-check@~0.3.2")
          (s."word-wrap@~1.2.3")
          ];
        "optionator@^0.8.1" = s."optionator@0.8.3";
        "p-each-series@1.0.0" = f "p-each-series" "1.0.0" y "930f3d12dd1f50e7434457a22cd6f04ac6ad7f71" [
          (s."p-reduce@^1.0.0")
          ];
        "p-each-series@^1.0.0" = s."p-each-series@1.0.0";
        "p-finally@1.0.0" = f "p-finally" "1.0.0" y "3fbcfb15b899a44123b34b6dcc18b724336a2cae" [];
        "p-finally@^1.0.0" = s."p-finally@1.0.0";
        "p-limit@2.3.0" = f "p-limit" "2.3.0" y "3dd33c647a214fdfffd835933eb086da0dc21db1" [
          (s."p-try@^2.0.0")
          ];
        "p-limit@^2.0.0" = s."p-limit@2.3.0";
        "p-locate@3.0.0" = f "p-locate" "3.0.0" y "322d69a05c0264b25997d9f40cd8a891ab0064a4" [
          (s."p-limit@^2.0.0")
          ];
        "p-locate@^3.0.0" = s."p-locate@3.0.0";
        "p-reduce@1.0.0" = f "p-reduce" "1.0.0" y "18c2b0dd936a4690a529f8231f58a0fdb6a47dfa" [];
        "p-reduce@^1.0.0" = s."p-reduce@1.0.0";
        "p-try@2.2.0" = f "p-try" "2.2.0" y "cb2868540e313d61de58fafbe35ce9004d5540e6" [];
        "p-try@^2.0.0" = s."p-try@2.2.0";
        "parse-json@4.0.0" = f "parse-json" "4.0.0" y "be35f5425be1f7f6c747184f98a788cb99477ee0" [
          (s."error-ex@^1.3.1")
          (s."json-parse-better-errors@^1.0.1")
          ];
        "parse-json@^4.0.0" = s."parse-json@4.0.0";
        "parse5@4.0.0" = f "parse5" "4.0.0" y "6d78656e3da8d78b4ec0b906f7c08ef1dfe3f608" [];
        "pascalcase@0.1.1" = f "pascalcase" "0.1.1" y "b363e55e8006ca6fe21784d2db22bd15d7917f14" [];
        "pascalcase@^0.1.1" = s."pascalcase@0.1.1";
        "path-exists@3.0.0" = f "path-exists" "3.0.0" y "ce0ebeaa5f78cb18925ea7d810d7b59b010fd515" [];
        "path-exists@^3.0.0" = s."path-exists@3.0.0";
        "path-is-absolute@1.0.1" = f "path-is-absolute" "1.0.1" y "174b9268735534ffbc7ace6bf53a5a9e1b5c5f5f" [];
        "path-is-absolute@^1.0.0" = s."path-is-absolute@1.0.1";
        "path-key@2.0.1" = f "path-key" "2.0.1" y "411cadb574c5a140d3a4b1910d40d80cc9f40b40" [];
        "path-key@^2.0.0" = s."path-key@2.0.1";
        "path-key@^2.0.1" = s."path-key@2.0.1";
        "path-parse@1.0.6" = f "path-parse" "1.0.6" y "d62dbb5679405d72c4737ec58600e9ddcf06d24c" [];
        "path-parse@^1.0.6" = s."path-parse@1.0.6";
        "path-type@3.0.0" = f "path-type" "3.0.0" y "cef31dc8e0a1a3bb0d105c0cd97cf3bf47f4e36f" [
          (s."pify@^3.0.0")
          ];
        "path-type@^3.0.0" = s."path-type@3.0.0";
        "performance-now@2.1.0" = f "performance-now" "2.1.0" y "6309f4e0e5fa913ec1c69307ae364b4b377c9e7b" [];
        "performance-now@^2.1.0" = s."performance-now@2.1.0";
        "pify@3.0.0" = f "pify" "3.0.0" y "e5a4acd2c101fdf3d9a4d07f0dbc4db49dd28176" [];
        "pify@4.0.1" = f "pify" "4.0.1" y "4b2cd25c50d598735c50292224fd8c6df41e3231" [];
        "pify@^3.0.0" = s."pify@3.0.0";
        "pify@^4.0.1" = s."pify@4.0.1";
        "pirates@4.0.1" = f "pirates" "4.0.1" y "643a92caf894566f91b2b986d2c66950a8e2fb87" [
          (s."node-modules-regexp@^1.0.0")
          ];
        "pirates@^4.0.1" = s."pirates@4.0.1";
        "pkg-dir@3.0.0" = f "pkg-dir" "3.0.0" y "2749020f239ed990881b1f71210d51eb6523bea3" [
          (s."find-up@^3.0.0")
          ];
        "pkg-dir@^3.0.0" = s."pkg-dir@3.0.0";
        "pn@1.1.0" = f "pn" "1.1.0" y "e2f4cef0e219f463c179ab37463e4e1ecdccbafb" [];
        "pn@^1.1.0" = s."pn@1.1.0";
        "posix-character-classes@0.1.1" = f "posix-character-classes" "0.1.1" y "01eac0fe3b5af71a2a6c02feabb8c1fef7e00eab" [];
        "posix-character-classes@^0.1.0" = s."posix-character-classes@0.1.1";
        "prelude-ls@1.1.2" = f "prelude-ls" "1.1.2" y "21932a549f5e52ffd9a827f570e04be62a97da54" [];
        "prelude-ls@~1.1.2" = s."prelude-ls@1.1.2";
        "pretty-format@24.9.0" = f "pretty-format" "24.9.0" y "12fac31b37019a4eea3c11aa9a959eb7628aa7c9" [
          (s."@jest/types@^24.9.0")
          (s."ansi-regex@^4.0.0")
          (s."ansi-styles@^3.2.0")
          (s."react-is@^16.8.4")
          ];
        "pretty-format@^24.9.0" = s."pretty-format@24.9.0";
        "prompts@2.3.2" = f "prompts" "2.3.2" y "480572d89ecf39566d2bd3fe2c9fccb7c4c0b068" [
          (s."kleur@^3.0.3")
          (s."sisteransi@^1.0.4")
          ];
        "prompts@^2.0.1" = s."prompts@2.3.2";
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
        "qs@6.5.2" = f "qs" "6.5.2" y "cb3ae806e8740444584ef154ce8ee98d403f3e36" [];
        "qs@~6.5.2" = s."qs@6.5.2";
        "quick-lru@5.1.0" = f "quick-lru" "5.1.0" y "1602f339bde554c4dace47880227ec9c2869f2e8" [];
        "react-is@16.13.1" = f "react-is" "16.13.1" y "789729a4dc36de2999dc156dd6c1d9c18cea56a4" [];
        "react-is@^16.8.4" = s."react-is@16.13.1";
        "read-pkg-up@4.0.0" = f "read-pkg-up" "4.0.0" y "1b221c6088ba7799601c808f91161c66e58f8978" [
          (s."find-up@^3.0.0")
          (s."read-pkg@^3.0.0")
          ];
        "read-pkg-up@^4.0.0" = s."read-pkg-up@4.0.0";
        "read-pkg@3.0.0" = f "read-pkg" "3.0.0" y "9cbc686978fee65d16c00e2b19c237fcf6e38389" [
          (s."load-json-file@^4.0.0")
          (s."normalize-package-data@^2.3.2")
          (s."path-type@^3.0.0")
          ];
        "read-pkg@^3.0.0" = s."read-pkg@3.0.0";
        "realpath-native@1.1.0" = f "realpath-native" "1.1.0" y "2003294fea23fb0672f2476ebe22fcf498a2d65c" [
          (s."util.promisify@^1.0.0")
          ];
        "realpath-native@^1.1.0" = s."realpath-native@1.1.0";
        "regenerator-runtime@0.13.7" = f "regenerator-runtime" "0.13.7" y "cac2dacc8a1ea675feaabaeb8ae833898ae46f55" [];
        "regenerator-runtime@^0.13.4" = s."regenerator-runtime@0.13.7";
        "regex-not@1.0.2" = f "regex-not" "1.0.2" y "1f4ece27e00b0b65e0247a6810e6a85d83a5752c" [
          (s."extend-shallow@^3.0.2")
          (s."safe-regex@^1.1.0")
          ];
        "regex-not@^1.0.0" = s."regex-not@1.0.2";
        "regex-not@^1.0.2" = s."regex-not@1.0.2";
        "remove-trailing-separator@1.1.0" = f "remove-trailing-separator" "1.1.0" y "c24bce2a283adad5bc3f58e0d48249b92379d8ef" [];
        "remove-trailing-separator@^1.0.1" = s."remove-trailing-separator@1.1.0";
        "repeat-element@1.1.3" = f "repeat-element" "1.1.3" y "782e0d825c0c5a3bb39731f84efee6b742e6b1ce" [];
        "repeat-element@^1.1.2" = s."repeat-element@1.1.3";
        "repeat-string@1.6.1" = f "repeat-string" "1.6.1" y "8dcae470e1c88abc2d600fff4a776286da75e637" [];
        "repeat-string@^1.6.1" = s."repeat-string@1.6.1";
        "request-promise-core@1.1.4" = f "request-promise-core" "1.1.4" y "3eedd4223208d419867b78ce815167d10593a22f" [
          (s."lodash@^4.17.19")
          ];
        "request-promise-native@1.0.9" = f "request-promise-native" "1.0.9" y "e407120526a5efdc9a39b28a5679bf47b9d9dc28" [
          (s."request-promise-core@1.1.4")
          (s."stealthy-require@^1.1.1")
          (s."tough-cookie@^2.3.3")
          ];
        "request-promise-native@^1.0.5" = s."request-promise-native@1.0.9";
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
        "request@^2.87.0" = s."request@2.88.2";
        "require-directory@2.1.1" = f "require-directory" "2.1.1" y "8c64ad5fd30dab1c976e2344ffe7f792a6a6df42" [];
        "require-directory@^2.1.1" = s."require-directory@2.1.1";
        "require-main-filename@2.0.0" = f "require-main-filename" "2.0.0" y "d0b329ecc7cc0f61649f62215be69af54aa8989b" [];
        "require-main-filename@^2.0.0" = s."require-main-filename@2.0.0";
        "resolve-cwd@2.0.0" = f "resolve-cwd" "2.0.0" y "00a9f7387556e27038eae232caa372a6a59b665a" [
          (s."resolve-from@^3.0.0")
          ];
        "resolve-cwd@^2.0.0" = s."resolve-cwd@2.0.0";
        "resolve-from@3.0.0" = f "resolve-from" "3.0.0" y "b22c7af7d9d6881bc8b6e653335eebcb0a188748" [];
        "resolve-from@^3.0.0" = s."resolve-from@3.0.0";
        "resolve-url@0.2.1" = f "resolve-url" "0.2.1" y "2c637fe77c893afd2a663fe21aa9080068e2052a" [];
        "resolve-url@^0.2.1" = s."resolve-url@0.2.1";
        "resolve@1.1.7" = f "resolve" "1.1.7" y "203114d82ad2c5ed9e8e0411b3932875e889e97b" [];
        "resolve@1.17.0" = f "resolve" "1.17.0" y "b25941b54968231cc2d1bb76a79cb7f2c0bf8444" [
          (s."path-parse@^1.0.6")
          ];
        "resolve@^1.10.0" = s."resolve@1.17.0";
        "resolve@^1.3.2" = s."resolve@1.17.0";
        "ret@0.1.15" = f "ret" "0.1.15" y "b8a4825d5bdb1fc3f6f53c2bc33f81388681c7bc" [];
        "ret@~0.1.10" = s."ret@0.1.15";
        "rimraf@2.7.1" = f "rimraf" "2.7.1" y "35797f13a7fdadc566142c29d4f07ccad483e3ec" [
          (s."glob@^7.1.3")
          ];
        "rimraf@^2.5.4" = s."rimraf@2.7.1";
        "rimraf@^2.6.3" = s."rimraf@2.7.1";
        "rsvp@4.8.5" = f "rsvp" "4.8.5" y "c8f155311d167f68f21e168df71ec5b083113734" [];
        "rsvp@^4.8.4" = s."rsvp@4.8.5";
        "safe-buffer@5.1.2" = f "safe-buffer" "5.1.2" y "991ec69d296e0313747d59bdfd2b745c35f8828d" [];
        "safe-buffer@5.2.1" = f "safe-buffer" "5.2.1" y "1eaf9fa9bdb1fdd4ec75f58f9cdb4e6b7827eec6" [];
        "safe-buffer@^5.0.1" = s."safe-buffer@5.2.1";
        "safe-buffer@^5.1.2" = s."safe-buffer@5.2.1";
        "safe-buffer@~5.1.1" = s."safe-buffer@5.1.2";
        "safe-regex@1.1.0" = f "safe-regex" "1.1.0" y "40a3669f3b077d1e943d44629e157dd48023bf2e" [
          (s."ret@~0.1.10")
          ];
        "safe-regex@^1.1.0" = s."safe-regex@1.1.0";
        "safer-buffer@2.1.2" = f "safer-buffer" "2.1.2" y "44fa161b0187b9549dd84bb91802f9bd8385cd6a" [];
        "safer-buffer@>= 2.1.2 < 3" = s."safer-buffer@2.1.2";
        "safer-buffer@^2.0.2" = s."safer-buffer@2.1.2";
        "safer-buffer@^2.1.0" = s."safer-buffer@2.1.2";
        "safer-buffer@~2.1.0" = s."safer-buffer@2.1.2";
        "sane@4.1.0" = f "sane" "4.1.0" y "ed881fd922733a6c461bc189dc2b6c006f3ffded" [
          (s."@cnakazawa/watch@^1.0.3")
          (s."anymatch@^2.0.0")
          (s."capture-exit@^2.0.0")
          (s."exec-sh@^0.3.2")
          (s."execa@^1.0.0")
          (s."fb-watchman@^2.0.0")
          (s."micromatch@^3.1.4")
          (s."minimist@^1.1.1")
          (s."walker@~1.0.5")
          ];
        "sane@^4.0.3" = s."sane@4.1.0";
        "sax@1.2.4" = f "sax" "1.2.4" y "2816234e2378bddc4e5354fab5caa895df7100d9" [];
        "sax@^1.2.4" = s."sax@1.2.4";
        "semver@2 || 3 || 4 || 5" = s."semver@5.7.1";
        "semver@5.7.1" = f "semver" "5.7.1" y "a954f931aeba508d307bbf069eff0c01c96116f7" [];
        "semver@6.3.0" = f "semver" "6.3.0" y "ee0a64c8af5e8ceea67687b133761e1becbd1d3d" [];
        "semver@^5.3.0" = s."semver@5.7.1";
        "semver@^5.4.1" = s."semver@5.7.1";
        "semver@^5.5.0" = s."semver@5.7.1";
        "semver@^5.6.0" = s."semver@5.7.1";
        "semver@^6.0.0" = s."semver@6.3.0";
        "semver@^6.2.0" = s."semver@6.3.0";
        "set-blocking@2.0.0" = f "set-blocking" "2.0.0" y "045f9782d011ae9a6803ddd382b24392b3d890f7" [];
        "set-blocking@^2.0.0" = s."set-blocking@2.0.0";
        "set-value@2.0.1" = f "set-value" "2.0.1" y "a18d40530e6f07de4228c7defe4227af8cad005b" [
          (s."extend-shallow@^2.0.1")
          (s."is-extendable@^0.1.1")
          (s."is-plain-object@^2.0.3")
          (s."split-string@^3.0.1")
          ];
        "set-value@^2.0.0" = s."set-value@2.0.1";
        "set-value@^2.0.1" = s."set-value@2.0.1";
        "shebang-command@1.2.0" = f "shebang-command" "1.2.0" y "44aac65b695b03398968c39f363fee5deafdf1ea" [
          (s."shebang-regex@^1.0.0")
          ];
        "shebang-command@^1.2.0" = s."shebang-command@1.2.0";
        "shebang-regex@1.0.0" = f "shebang-regex" "1.0.0" y "da42f49740c0b42db2ca9728571cb190c98efea3" [];
        "shebang-regex@^1.0.0" = s."shebang-regex@1.0.0";
        "shellwords@0.1.1" = f "shellwords" "0.1.1" y "d6b9181c1a48d397324c84871efbcfc73fc0654b" [];
        "shellwords@^0.1.1" = s."shellwords@0.1.1";
        "signal-exit@3.0.3" = f "signal-exit" "3.0.3" y "a1410c2edd8f077b08b4e253c8eacfcaf057461c" [];
        "signal-exit@^3.0.0" = s."signal-exit@3.0.3";
        "signal-exit@^3.0.2" = s."signal-exit@3.0.3";
        "sisteransi@1.0.5" = f "sisteransi" "1.0.5" y "134d681297756437cc05ca01370d3a7a571075ed" [];
        "sisteransi@^1.0.4" = s."sisteransi@1.0.5";
        "slash@2.0.0" = f "slash" "2.0.0" y "de552851a1759df3a8f206535442f5ec4ddeab44" [];
        "slash@^2.0.0" = s."slash@2.0.0";
        "snapdragon-node@2.1.1" = f "snapdragon-node" "2.1.1" y "6c175f86ff14bdb0724563e8f3c1b021a286853b" [
          (s."define-property@^1.0.0")
          (s."isobject@^3.0.0")
          (s."snapdragon-util@^3.0.1")
          ];
        "snapdragon-node@^2.0.1" = s."snapdragon-node@2.1.1";
        "snapdragon-util@3.0.1" = f "snapdragon-util" "3.0.1" y "f956479486f2acd79700693f6f7b805e45ab56e2" [
          (s."kind-of@^3.2.0")
          ];
        "snapdragon-util@^3.0.1" = s."snapdragon-util@3.0.1";
        "snapdragon@0.8.2" = f "snapdragon" "0.8.2" y "64922e7c565b0e14204ba1aa7d6964278d25182d" [
          (s."base@^0.11.1")
          (s."debug@^2.2.0")
          (s."define-property@^0.2.5")
          (s."extend-shallow@^2.0.1")
          (s."map-cache@^0.2.2")
          (s."source-map@^0.5.6")
          (s."source-map-resolve@^0.5.0")
          (s."use@^3.1.0")
          ];
        "snapdragon@^0.8.1" = s."snapdragon@0.8.2";
        "source-map-resolve@0.5.3" = f "source-map-resolve" "0.5.3" y "190866bece7553e1f8f267a2ee82c606b5509a1a" [
          (s."atob@^2.1.2")
          (s."decode-uri-component@^0.2.0")
          (s."resolve-url@^0.2.1")
          (s."source-map-url@^0.4.0")
          (s."urix@^0.1.0")
          ];
        "source-map-resolve@^0.5.0" = s."source-map-resolve@0.5.3";
        "source-map-support@0.5.19" = f "source-map-support" "0.5.19" y "a98b62f86dcaf4f67399648c085291ab9e8fed61" [
          (s."buffer-from@^1.0.0")
          (s."source-map@^0.6.0")
          ];
        "source-map-support@^0.5.6" = s."source-map-support@0.5.19";
        "source-map-url@0.4.0" = f "source-map-url" "0.4.0" y "3e935d7ddd73631b97659956d55128e87b5084a3" [];
        "source-map-url@^0.4.0" = s."source-map-url@0.4.0";
        "source-map@0.5.7" = f "source-map" "0.5.7" y "8a039d2d1021d22d1ea14c80d8ea468ba2ef3fcc" [];
        "source-map@0.6.1" = f "source-map" "0.6.1" y "74722af32e9614e9c287a8d0bbde48b5e2f1a263" [];
        "source-map@^0.5.0" = s."source-map@0.5.7";
        "source-map@^0.5.6" = s."source-map@0.5.7";
        "source-map@^0.6.0" = s."source-map@0.6.1";
        "source-map@^0.6.1" = s."source-map@0.6.1";
        "source-map@~0.6.1" = s."source-map@0.6.1";
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
        "split-string@3.1.0" = f "split-string" "3.1.0" y "7cb09dda3a86585705c64b39a6466038682e8fe2" [
          (s."extend-shallow@^3.0.0")
          ];
        "split-string@^3.0.1" = s."split-string@3.1.0";
        "split-string@^3.0.2" = s."split-string@3.1.0";
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
        "stack-utils@1.0.2" = f "stack-utils" "1.0.2" y "33eba3897788558bebfc2db059dc158ec36cebb8" [];
        "stack-utils@^1.0.1" = s."stack-utils@1.0.2";
        "static-extend@0.1.2" = f "static-extend" "0.1.2" y "60809c39cbff55337226fd5e0b520f341f1fb5c6" [
          (s."define-property@^0.2.5")
          (s."object-copy@^0.1.0")
          ];
        "static-extend@^0.1.1" = s."static-extend@0.1.2";
        "stealthy-require@1.1.1" = f "stealthy-require" "1.1.1" y "35b09875b4ff49f26a777e509b3090a3226bf24b" [];
        "stealthy-require@^1.1.1" = s."stealthy-require@1.1.1";
        "string-length@2.0.0" = f "string-length" "2.0.0" y "d40dbb686a3ace960c1cffca562bf2c45f8363ed" [
          (s."astral-regex@^1.0.0")
          (s."strip-ansi@^4.0.0")
          ];
        "string-length@^2.0.0" = s."string-length@2.0.0";
        "string-width@3.1.0" = f "string-width" "3.1.0" y "22767be21b62af1081574306f69ac51b62203961" [
          (s."emoji-regex@^7.0.1")
          (s."is-fullwidth-code-point@^2.0.0")
          (s."strip-ansi@^5.1.0")
          ];
        "string-width@^3.0.0" = s."string-width@3.1.0";
        "string-width@^3.1.0" = s."string-width@3.1.0";
        "string.prototype.trimend@1.0.1" = f "string.prototype.trimend" "1.0.1" y "85812a6b847ac002270f5808146064c995fb6913" [
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.17.5")
          ];
        "string.prototype.trimend@^1.0.1" = s."string.prototype.trimend@1.0.1";
        "string.prototype.trimstart@1.0.1" = f "string.prototype.trimstart" "1.0.1" y "14af6d9f34b053f7cfc89b72f8f2ee14b9039a54" [
          (s."define-properties@^1.1.3")
          ];
        "string.prototype.trimstart@^1.0.1" = s."string.prototype.trimstart@1.0.1";
        "strip-ansi@4.0.0" = f "strip-ansi" "4.0.0" y "a8479022eb1ac368a871389b635262c505ee368f" [
          (s."ansi-regex@^3.0.0")
          ];
        "strip-ansi@5.2.0" = f "strip-ansi" "5.2.0" y "8c9a536feb6afc962bdfa5b104a5091c1ad9c0ae" [
          (s."ansi-regex@^4.1.0")
          ];
        "strip-ansi@^4.0.0" = s."strip-ansi@4.0.0";
        "strip-ansi@^5.0.0" = s."strip-ansi@5.2.0";
        "strip-ansi@^5.1.0" = s."strip-ansi@5.2.0";
        "strip-ansi@^5.2.0" = s."strip-ansi@5.2.0";
        "strip-bom@3.0.0" = f "strip-bom" "3.0.0" y "2334c18e9c759f7bdd56fdef7e9ae3d588e68ed3" [];
        "strip-bom@^3.0.0" = s."strip-bom@3.0.0";
        "strip-eof@1.0.0" = f "strip-eof" "1.0.0" y "bb43ff5598a6eb05d89b59fcd129c983313606bf" [];
        "strip-eof@^1.0.0" = s."strip-eof@1.0.0";
        "supports-color@5.5.0" = f "supports-color" "5.5.0" y "e2e69a44ac8772f78a1ec0b35b689df6530efc8f" [
          (s."has-flag@^3.0.0")
          ];
        "supports-color@6.1.0" = f "supports-color" "6.1.0" y "0764abc69c63d5ac842dd4867e8d025e880df8f3" [
          (s."has-flag@^3.0.0")
          ];
        "supports-color@^5.3.0" = s."supports-color@5.5.0";
        "supports-color@^6.1.0" = s."supports-color@6.1.0";
        "symbol-tree@3.2.4" = f "symbol-tree" "3.2.4" y "430637d248ba77e078883951fb9aa0eed7c63fa2" [];
        "symbol-tree@^3.2.2" = s."symbol-tree@3.2.4";
        "test-exclude@5.2.3" = f "test-exclude" "5.2.3" y "c3d3e1e311eb7ee405e092dac10aefd09091eac0" [
          (s."glob@^7.1.3")
          (s."minimatch@^3.0.4")
          (s."read-pkg-up@^4.0.0")
          (s."require-main-filename@^2.0.0")
          ];
        "test-exclude@^5.2.3" = s."test-exclude@5.2.3";
        "throat@4.1.0" = f "throat" "4.1.0" y "89037cbc92c56ab18926e6ba4cbb200e15672a6a" [];
        "throat@^4.0.0" = s."throat@4.1.0";
        "tmpl@1.0.4" = f "tmpl" "1.0.4" y "23640dd7b42d00433911140820e5cf440e521dd1" [];
        "tmpl@1.0.x" = s."tmpl@1.0.4";
        "to-fast-properties@2.0.0" = f "to-fast-properties" "2.0.0" y "dc5e698cbd079265bc73e0377681a4e4e83f616e" [];
        "to-fast-properties@^2.0.0" = s."to-fast-properties@2.0.0";
        "to-object-path@0.3.0" = f "to-object-path" "0.3.0" y "297588b7b0e7e0ac08e04e672f85c1f4999e17af" [
          (s."kind-of@^3.0.2")
          ];
        "to-object-path@^0.3.0" = s."to-object-path@0.3.0";
        "to-regex-range@2.1.1" = f "to-regex-range" "2.1.1" y "7c80c17b9dfebe599e27367e0d4dd5590141db38" [
          (s."is-number@^3.0.0")
          (s."repeat-string@^1.6.1")
          ];
        "to-regex-range@^2.1.0" = s."to-regex-range@2.1.1";
        "to-regex@3.0.2" = f "to-regex" "3.0.2" y "13cfdd9b336552f30b51f33a8ae1b42a7a7599ce" [
          (s."define-property@^2.0.2")
          (s."extend-shallow@^3.0.2")
          (s."regex-not@^1.0.2")
          (s."safe-regex@^1.1.0")
          ];
        "to-regex@^3.0.1" = s."to-regex@3.0.2";
        "to-regex@^3.0.2" = s."to-regex@3.0.2";
        "tough-cookie@2.5.0" = f "tough-cookie" "2.5.0" y "cd9fb2a0aa1d5a12b473bd9fb96fa3dcff65ade2" [
          (s."psl@^1.1.28")
          (s."punycode@^2.1.1")
          ];
        "tough-cookie@^2.3.3" = s."tough-cookie@2.5.0";
        "tough-cookie@^2.3.4" = s."tough-cookie@2.5.0";
        "tough-cookie@~2.5.0" = s."tough-cookie@2.5.0";
        "tr46@1.0.1" = f "tr46" "1.0.1" y "a8b13fd6bfd2489519674ccde55ba3693b706d09" [
          (s."punycode@^2.1.0")
          ];
        "tr46@^1.0.1" = s."tr46@1.0.1";
        "tunnel-agent@0.6.0" = f "tunnel-agent" "0.6.0" y "27a5dea06b36b04a0a9966774b290868f0fc40fd" [
          (s."safe-buffer@^5.0.1")
          ];
        "tunnel-agent@^0.6.0" = s."tunnel-agent@0.6.0";
        "tweetnacl@0.14.5" = f "tweetnacl" "0.14.5" y "5ae68177f192d4456269d108afa93ff8743f4f64" [];
        "tweetnacl@^0.14.3" = s."tweetnacl@0.14.5";
        "tweetnacl@~0.14.0" = s."tweetnacl@0.14.5";
        "type-check@0.3.2" = f "type-check" "0.3.2" y "5884cab512cf1d355e3fb784f30804b2b520db72" [
          (s."prelude-ls@~1.1.2")
          ];
        "type-check@~0.3.2" = s."type-check@0.3.2";
        "union-value@1.0.1" = f "union-value" "1.0.1" y "0b6fe7b835aecda61c6ea4d4f02c14221e109847" [
          (s."arr-union@^3.1.0")
          (s."get-value@^2.0.6")
          (s."is-extendable@^0.1.1")
          (s."set-value@^2.0.1")
          ];
        "union-value@^1.0.0" = s."union-value@1.0.1";
        "unset-value@1.0.0" = f "unset-value" "1.0.0" y "8376873f7d2335179ffb1e6fc3a8ed0dfc8ab559" [
          (s."has-value@^0.3.1")
          (s."isobject@^3.0.0")
          ];
        "unset-value@^1.0.0" = s."unset-value@1.0.0";
        "uri-js@4.4.0" = f "uri-js" "4.4.0" y "aa714261de793e8a82347a7bcc9ce74e86f28602" [
          (s."punycode@^2.1.0")
          ];
        "uri-js@^4.2.2" = s."uri-js@4.4.0";
        "urix@0.1.0" = f "urix" "0.1.0" y "da937f7a62e21fec1fd18d49b35c2935067a6c72" [];
        "urix@^0.1.0" = s."urix@0.1.0";
        "use@3.1.1" = f "use" "3.1.1" y "d50c8cac79a19fbc20f2911f56eb973f4e10070f" [];
        "use@^3.1.0" = s."use@3.1.1";
        "util.promisify@1.0.1" = f "util.promisify" "1.0.1" y "6baf7774b80eeb0f7520d8b81d07982a59abbaee" [
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.17.2")
          (s."has-symbols@^1.0.1")
          (s."object.getownpropertydescriptors@^2.1.0")
          ];
        "util.promisify@^1.0.0" = s."util.promisify@1.0.1";
        "uuid@3.4.0" = f "uuid" "3.4.0" y "b23e4358afa8a202fe7a100af1f5f883f02007ee" [];
        "uuid@^3.3.2" = s."uuid@3.4.0";
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
        "w3c-hr-time@1.0.2" = f "w3c-hr-time" "1.0.2" y "0a89cdf5cc15822df9c360543676963e0cc308cd" [
          (s."browser-process-hrtime@^1.0.0")
          ];
        "w3c-hr-time@^1.0.1" = s."w3c-hr-time@1.0.2";
        "walker@1.0.7" = f "walker" "1.0.7" y "2f7f9b8fd10d677262b18a884e28d19618e028fb" [
          (s."makeerror@1.0.x")
          ];
        "walker@^1.0.7" = s."walker@1.0.7";
        "walker@~1.0.5" = s."walker@1.0.7";
        "webidl-conversions@4.0.2" = f "webidl-conversions" "4.0.2" y "a855980b1f0b6b359ba1d5d9fb39ae941faa63ad" [];
        "webidl-conversions@^4.0.2" = s."webidl-conversions@4.0.2";
        "whatwg-encoding@1.0.5" = f "whatwg-encoding" "1.0.5" y "5abacf777c32166a51d085d6b4f3e7d27113ddb0" [
          (s."iconv-lite@0.4.24")
          ];
        "whatwg-encoding@^1.0.1" = s."whatwg-encoding@1.0.5";
        "whatwg-encoding@^1.0.3" = s."whatwg-encoding@1.0.5";
        "whatwg-mimetype@2.3.0" = f "whatwg-mimetype" "2.3.0" y "3d4b1e0312d2079879f826aff18dbeeca5960fbf" [];
        "whatwg-mimetype@^2.1.0" = s."whatwg-mimetype@2.3.0";
        "whatwg-mimetype@^2.2.0" = s."whatwg-mimetype@2.3.0";
        "whatwg-url@6.5.0" = f "whatwg-url" "6.5.0" y "f2df02bff176fd65070df74ad5ccbb5a199965a8" [
          (s."lodash.sortby@^4.7.0")
          (s."tr46@^1.0.1")
          (s."webidl-conversions@^4.0.2")
          ];
        "whatwg-url@7.1.0" = f "whatwg-url" "7.1.0" y "c2c492f1eca612988efd3d2266be1b9fc6170d06" [
          (s."lodash.sortby@^4.7.0")
          (s."tr46@^1.0.1")
          (s."webidl-conversions@^4.0.2")
          ];
        "whatwg-url@^6.4.1" = s."whatwg-url@6.5.0";
        "whatwg-url@^7.0.0" = s."whatwg-url@7.1.0";
        "which-module@2.0.0" = f "which-module" "2.0.0" y "d9ef07dce77b9902b8a3a8fa4b31c3e3f7e6e87a" [];
        "which-module@^2.0.0" = s."which-module@2.0.0";
        "which@1.3.1" = f "which" "1.3.1" y "a45043d54f5805316da8d62f9f50918d3da70b0a" [
          (s."isexe@^2.0.0")
          ];
        "which@^1.2.9" = s."which@1.3.1";
        "which@^1.3.0" = s."which@1.3.1";
        "word-wrap@1.2.3" = f "word-wrap" "1.2.3" y "610636f6b1f703891bd34771ccb17fb93b47079c" [];
        "word-wrap@~1.2.3" = s."word-wrap@1.2.3";
        "wrap-ansi@5.1.0" = f "wrap-ansi" "5.1.0" y "1fd1f67235d5b6d0fee781056001bfb694c03b09" [
          (s."ansi-styles@^3.2.0")
          (s."string-width@^3.0.0")
          (s."strip-ansi@^5.0.0")
          ];
        "wrap-ansi@^5.1.0" = s."wrap-ansi@5.1.0";
        "wrappy@1" = s."wrappy@1.0.2";
        "wrappy@1.0.2" = f "wrappy" "1.0.2" y "b5243d8f3ec1aa35f1364605bc0d1036e30ab69f" [];
        "write-file-atomic@2.4.1" = f "write-file-atomic" "2.4.1" y "d0b05463c188ae804396fd5ab2a370062af87529" [
          (s."graceful-fs@^4.1.11")
          (s."imurmurhash@^0.1.4")
          (s."signal-exit@^3.0.2")
          ];
        "ws@5.2.2" = f "ws" "5.2.2" y "dffef14866b8e8dc9133582514d1befaf96e980f" [
          (s."async-limiter@~1.0.0")
          ];
        "ws@^5.2.0" = s."ws@5.2.2";
        "xml-name-validator@3.0.0" = f "xml-name-validator" "3.0.0" y "6ae73e06de4d8c6e47f9fb181f78d648ad457c6a" [];
        "xml-name-validator@^3.0.0" = s."xml-name-validator@3.0.0";
        "y18n@4.0.0" = f "y18n" "4.0.0" y "95ef94f85ecc81d007c264e190a120f0a3c8566b" [];
        "y18n@^4.0.0" = s."y18n@4.0.0";
        "yargs-parser@13.1.2" = f "yargs-parser" "13.1.2" y "130f09702ebaeef2650d54ce6e3e5706f7a4fb38" [
          (s."camelcase@^5.0.0")
          (s."decamelize@^1.2.0")
          ];
        "yargs-parser@^13.1.2" = s."yargs-parser@13.1.2";
        "yargs@13.3.2" = f "yargs" "13.3.2" y "ad7ffefec1aa59565ac915f82dccb38a9c31a2dd" [
          (s."cliui@^5.0.0")
          (s."find-up@^3.0.0")
          (s."get-caller-file@^2.0.1")
          (s."require-directory@^2.1.1")
          (s."require-main-filename@^2.0.0")
          (s."set-blocking@^2.0.0")
          (s."string-width@^3.0.0")
          (s."which-module@^2.0.0")
          (s."y18n@^4.0.0")
          (s."yargs-parser@^13.1.2")
          ];
        "yargs@^13.3.0" = s."yargs@13.3.2";
        }