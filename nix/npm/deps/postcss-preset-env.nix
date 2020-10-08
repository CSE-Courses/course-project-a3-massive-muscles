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
        "@babel/compat-data@7.11.0" = f (sc "babel" "compat-data") "7.11.0" (ir "https://registry.yarnpkg.com/@babel/compat-data/-/compat-data-7.11.0.tgz") "e9f73efe09af1355b723a7f39b11bad637d7c99c" [
          (s."browserslist@^4.12.0")
          (s."invariant@^2.2.4")
          (s."semver@^5.5.0")
          ];
        "@babel/compat-data@^7.10.4" = s."@babel/compat-data@7.11.0";
        "@babel/compat-data@^7.11.0" = s."@babel/compat-data@7.11.0";
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
        "@babel/core@^7.5.0" = s."@babel/core@7.11.6";
        "@babel/generator@7.11.6" = f (sc "babel" "generator") "7.11.6" (ir "https://registry.yarnpkg.com/@babel/generator/-/generator-7.11.6.tgz") "b868900f81b163b4d464ea24545c61cbac4dc620" [
          (s."@babel/types@^7.11.5")
          (s."jsesc@^2.5.1")
          (s."source-map@^0.5.0")
          ];
        "@babel/generator@^7.11.5" = s."@babel/generator@7.11.6";
        "@babel/generator@^7.11.6" = s."@babel/generator@7.11.6";
        "@babel/helper-annotate-as-pure@7.10.4" = f (sc "babel" "helper-annotate-as-pure") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helper-annotate-as-pure/-/helper-annotate-as-pure-7.10.4.tgz") "5bf0d495a3f757ac3bda48b5bf3b3ba309c72ba3" [
          (s."@babel/types@^7.10.4")
          ];
        "@babel/helper-annotate-as-pure@^7.10.4" = s."@babel/helper-annotate-as-pure@7.10.4";
        "@babel/helper-builder-binary-assignment-operator-visitor@7.10.4" = f (sc "babel" "helper-builder-binary-assignment-operator-visitor") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helper-builder-binary-assignment-operator-visitor/-/helper-builder-binary-assignment-operator-visitor-7.10.4.tgz") "bb0b75f31bf98cbf9ff143c1ae578b87274ae1a3" [
          (s."@babel/helper-explode-assignable-expression@^7.10.4")
          (s."@babel/types@^7.10.4")
          ];
        "@babel/helper-builder-binary-assignment-operator-visitor@^7.10.4" = s."@babel/helper-builder-binary-assignment-operator-visitor@7.10.4";
        "@babel/helper-compilation-targets@7.10.4" = f (sc "babel" "helper-compilation-targets") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helper-compilation-targets/-/helper-compilation-targets-7.10.4.tgz") "804ae8e3f04376607cc791b9d47d540276332bd2" [
          (s."@babel/compat-data@^7.10.4")
          (s."browserslist@^4.12.0")
          (s."invariant@^2.2.4")
          (s."levenary@^1.1.1")
          (s."semver@^5.5.0")
          ];
        "@babel/helper-compilation-targets@^7.10.4" = s."@babel/helper-compilation-targets@7.10.4";
        "@babel/helper-create-class-features-plugin@7.10.5" = f (sc "babel" "helper-create-class-features-plugin") "7.10.5" (ir "https://registry.yarnpkg.com/@babel/helper-create-class-features-plugin/-/helper-create-class-features-plugin-7.10.5.tgz") "9f61446ba80e8240b0a5c85c6fdac8459d6f259d" [
          (s."@babel/helper-function-name@^7.10.4")
          (s."@babel/helper-member-expression-to-functions@^7.10.5")
          (s."@babel/helper-optimise-call-expression@^7.10.4")
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."@babel/helper-replace-supers@^7.10.4")
          (s."@babel/helper-split-export-declaration@^7.10.4")
          ];
        "@babel/helper-create-class-features-plugin@^7.10.4" = s."@babel/helper-create-class-features-plugin@7.10.5";
        "@babel/helper-create-regexp-features-plugin@7.10.4" = f (sc "babel" "helper-create-regexp-features-plugin") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helper-create-regexp-features-plugin/-/helper-create-regexp-features-plugin-7.10.4.tgz") "fdd60d88524659a0b6959c0579925e425714f3b8" [
          (s."@babel/helper-annotate-as-pure@^7.10.4")
          (s."@babel/helper-regex@^7.10.4")
          (s."regexpu-core@^4.7.0")
          ];
        "@babel/helper-create-regexp-features-plugin@^7.10.4" = s."@babel/helper-create-regexp-features-plugin@7.10.4";
        "@babel/helper-define-map@7.10.5" = f (sc "babel" "helper-define-map") "7.10.5" (ir "https://registry.yarnpkg.com/@babel/helper-define-map/-/helper-define-map-7.10.5.tgz") "b53c10db78a640800152692b13393147acb9bb30" [
          (s."@babel/helper-function-name@^7.10.4")
          (s."@babel/types@^7.10.5")
          (s."lodash@^4.17.19")
          ];
        "@babel/helper-define-map@^7.10.4" = s."@babel/helper-define-map@7.10.5";
        "@babel/helper-explode-assignable-expression@7.11.4" = f (sc "babel" "helper-explode-assignable-expression") "7.11.4" (ir "https://registry.yarnpkg.com/@babel/helper-explode-assignable-expression/-/helper-explode-assignable-expression-7.11.4.tgz") "2d8e3470252cc17aba917ede7803d4a7a276a41b" [
          (s."@babel/types@^7.10.4")
          ];
        "@babel/helper-explode-assignable-expression@^7.10.4" = s."@babel/helper-explode-assignable-expression@7.11.4";
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
        "@babel/helper-hoist-variables@7.10.4" = f (sc "babel" "helper-hoist-variables") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helper-hoist-variables/-/helper-hoist-variables-7.10.4.tgz") "d49b001d1d5a68ca5e6604dda01a6297f7c9381e" [
          (s."@babel/types@^7.10.4")
          ];
        "@babel/helper-hoist-variables@^7.10.4" = s."@babel/helper-hoist-variables@7.10.4";
        "@babel/helper-member-expression-to-functions@7.11.0" = f (sc "babel" "helper-member-expression-to-functions") "7.11.0" (ir "https://registry.yarnpkg.com/@babel/helper-member-expression-to-functions/-/helper-member-expression-to-functions-7.11.0.tgz") "ae69c83d84ee82f4b42f96e2a09410935a8f26df" [
          (s."@babel/types@^7.11.0")
          ];
        "@babel/helper-member-expression-to-functions@^7.10.4" = s."@babel/helper-member-expression-to-functions@7.11.0";
        "@babel/helper-member-expression-to-functions@^7.10.5" = s."@babel/helper-member-expression-to-functions@7.11.0";
        "@babel/helper-module-imports@7.10.4" = f (sc "babel" "helper-module-imports") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helper-module-imports/-/helper-module-imports-7.10.4.tgz") "4c5c54be04bd31670a7382797d75b9fa2e5b5620" [
          (s."@babel/types@^7.10.4")
          ];
        "@babel/helper-module-imports@^7.0.0" = s."@babel/helper-module-imports@7.10.4";
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
        "@babel/helper-module-transforms@^7.10.4" = s."@babel/helper-module-transforms@7.11.0";
        "@babel/helper-module-transforms@^7.10.5" = s."@babel/helper-module-transforms@7.11.0";
        "@babel/helper-module-transforms@^7.11.0" = s."@babel/helper-module-transforms@7.11.0";
        "@babel/helper-optimise-call-expression@7.10.4" = f (sc "babel" "helper-optimise-call-expression") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helper-optimise-call-expression/-/helper-optimise-call-expression-7.10.4.tgz") "50dc96413d594f995a77905905b05893cd779673" [
          (s."@babel/types@^7.10.4")
          ];
        "@babel/helper-optimise-call-expression@^7.10.4" = s."@babel/helper-optimise-call-expression@7.10.4";
        "@babel/helper-plugin-utils@7.10.4" = f (sc "babel" "helper-plugin-utils") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helper-plugin-utils/-/helper-plugin-utils-7.10.4.tgz") "2f75a831269d4f677de49986dff59927533cf375" [];
        "@babel/helper-plugin-utils@^7.0.0" = s."@babel/helper-plugin-utils@7.10.4";
        "@babel/helper-plugin-utils@^7.10.4" = s."@babel/helper-plugin-utils@7.10.4";
        "@babel/helper-plugin-utils@^7.8.0" = s."@babel/helper-plugin-utils@7.10.4";
        "@babel/helper-plugin-utils@^7.8.3" = s."@babel/helper-plugin-utils@7.10.4";
        "@babel/helper-regex@7.10.5" = f (sc "babel" "helper-regex") "7.10.5" (ir "https://registry.yarnpkg.com/@babel/helper-regex/-/helper-regex-7.10.5.tgz") "32dfbb79899073c415557053a19bd055aae50ae0" [
          (s."lodash@^4.17.19")
          ];
        "@babel/helper-regex@^7.10.4" = s."@babel/helper-regex@7.10.5";
        "@babel/helper-remap-async-to-generator@7.11.4" = f (sc "babel" "helper-remap-async-to-generator") "7.11.4" (ir "https://registry.yarnpkg.com/@babel/helper-remap-async-to-generator/-/helper-remap-async-to-generator-7.11.4.tgz") "4474ea9f7438f18575e30b0cac784045b402a12d" [
          (s."@babel/helper-annotate-as-pure@^7.10.4")
          (s."@babel/helper-wrap-function@^7.10.4")
          (s."@babel/template@^7.10.4")
          (s."@babel/types@^7.10.4")
          ];
        "@babel/helper-remap-async-to-generator@^7.10.4" = s."@babel/helper-remap-async-to-generator@7.11.4";
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
        "@babel/helper-skip-transparent-expression-wrappers@7.11.0" = f (sc "babel" "helper-skip-transparent-expression-wrappers") "7.11.0" (ir "https://registry.yarnpkg.com/@babel/helper-skip-transparent-expression-wrappers/-/helper-skip-transparent-expression-wrappers-7.11.0.tgz") "eec162f112c2f58d3af0af125e3bb57665146729" [
          (s."@babel/types@^7.11.0")
          ];
        "@babel/helper-skip-transparent-expression-wrappers@^7.11.0" = s."@babel/helper-skip-transparent-expression-wrappers@7.11.0";
        "@babel/helper-split-export-declaration@7.11.0" = f (sc "babel" "helper-split-export-declaration") "7.11.0" (ir "https://registry.yarnpkg.com/@babel/helper-split-export-declaration/-/helper-split-export-declaration-7.11.0.tgz") "f8a491244acf6a676158ac42072911ba83ad099f" [
          (s."@babel/types@^7.11.0")
          ];
        "@babel/helper-split-export-declaration@^7.10.4" = s."@babel/helper-split-export-declaration@7.11.0";
        "@babel/helper-split-export-declaration@^7.11.0" = s."@babel/helper-split-export-declaration@7.11.0";
        "@babel/helper-validator-identifier@7.10.4" = f (sc "babel" "helper-validator-identifier") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helper-validator-identifier/-/helper-validator-identifier-7.10.4.tgz") "a78c7a7251e01f616512d31b10adcf52ada5e0d2" [];
        "@babel/helper-validator-identifier@^7.10.4" = s."@babel/helper-validator-identifier@7.10.4";
        "@babel/helper-wrap-function@7.10.4" = f (sc "babel" "helper-wrap-function") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helper-wrap-function/-/helper-wrap-function-7.10.4.tgz") "8a6f701eab0ff39f765b5a1cfef409990e624b87" [
          (s."@babel/helper-function-name@^7.10.4")
          (s."@babel/template@^7.10.4")
          (s."@babel/traverse@^7.10.4")
          (s."@babel/types@^7.10.4")
          ];
        "@babel/helper-wrap-function@^7.10.4" = s."@babel/helper-wrap-function@7.10.4";
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
        "@babel/parser@^7.7.0" = s."@babel/parser@7.11.5";
        "@babel/plugin-proposal-async-generator-functions@7.10.5" = f (sc "babel" "plugin-proposal-async-generator-functions") "7.10.5" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-async-generator-functions/-/plugin-proposal-async-generator-functions-7.10.5.tgz") "3491cabf2f7c179ab820606cec27fed15e0e8558" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."@babel/helper-remap-async-to-generator@^7.10.4")
          (s."@babel/plugin-syntax-async-generators@^7.8.0")
          ];
        "@babel/plugin-proposal-async-generator-functions@^7.10.4" = s."@babel/plugin-proposal-async-generator-functions@7.10.5";
        "@babel/plugin-proposal-class-properties@7.10.4" = f (sc "babel" "plugin-proposal-class-properties") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-class-properties/-/plugin-proposal-class-properties-7.10.4.tgz") "a33bf632da390a59c7a8c570045d1115cd778807" [
          (s."@babel/helper-create-class-features-plugin@^7.10.4")
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-proposal-class-properties@^7.10.4" = s."@babel/plugin-proposal-class-properties@7.10.4";
        "@babel/plugin-proposal-dynamic-import@7.10.4" = f (sc "babel" "plugin-proposal-dynamic-import") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-dynamic-import/-/plugin-proposal-dynamic-import-7.10.4.tgz") "ba57a26cb98b37741e9d5bca1b8b0ddf8291f17e" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."@babel/plugin-syntax-dynamic-import@^7.8.0")
          ];
        "@babel/plugin-proposal-dynamic-import@^7.10.4" = s."@babel/plugin-proposal-dynamic-import@7.10.4";
        "@babel/plugin-proposal-export-namespace-from@7.10.4" = f (sc "babel" "plugin-proposal-export-namespace-from") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-export-namespace-from/-/plugin-proposal-export-namespace-from-7.10.4.tgz") "570d883b91031637b3e2958eea3c438e62c05f54" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."@babel/plugin-syntax-export-namespace-from@^7.8.3")
          ];
        "@babel/plugin-proposal-export-namespace-from@^7.10.4" = s."@babel/plugin-proposal-export-namespace-from@7.10.4";
        "@babel/plugin-proposal-json-strings@7.10.4" = f (sc "babel" "plugin-proposal-json-strings") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-json-strings/-/plugin-proposal-json-strings-7.10.4.tgz") "593e59c63528160233bd321b1aebe0820c2341db" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."@babel/plugin-syntax-json-strings@^7.8.0")
          ];
        "@babel/plugin-proposal-json-strings@^7.10.4" = s."@babel/plugin-proposal-json-strings@7.10.4";
        "@babel/plugin-proposal-logical-assignment-operators@7.11.0" = f (sc "babel" "plugin-proposal-logical-assignment-operators") "7.11.0" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-logical-assignment-operators/-/plugin-proposal-logical-assignment-operators-7.11.0.tgz") "9f80e482c03083c87125dee10026b58527ea20c8" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."@babel/plugin-syntax-logical-assignment-operators@^7.10.4")
          ];
        "@babel/plugin-proposal-logical-assignment-operators@^7.11.0" = s."@babel/plugin-proposal-logical-assignment-operators@7.11.0";
        "@babel/plugin-proposal-nullish-coalescing-operator@7.10.4" = f (sc "babel" "plugin-proposal-nullish-coalescing-operator") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-nullish-coalescing-operator/-/plugin-proposal-nullish-coalescing-operator-7.10.4.tgz") "02a7e961fc32e6d5b2db0649e01bf80ddee7e04a" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."@babel/plugin-syntax-nullish-coalescing-operator@^7.8.0")
          ];
        "@babel/plugin-proposal-nullish-coalescing-operator@^7.10.4" = s."@babel/plugin-proposal-nullish-coalescing-operator@7.10.4";
        "@babel/plugin-proposal-numeric-separator@7.10.4" = f (sc "babel" "plugin-proposal-numeric-separator") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-numeric-separator/-/plugin-proposal-numeric-separator-7.10.4.tgz") "ce1590ff0a65ad12970a609d78855e9a4c1aef06" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."@babel/plugin-syntax-numeric-separator@^7.10.4")
          ];
        "@babel/plugin-proposal-numeric-separator@^7.10.4" = s."@babel/plugin-proposal-numeric-separator@7.10.4";
        "@babel/plugin-proposal-object-rest-spread@7.11.0" = f (sc "babel" "plugin-proposal-object-rest-spread") "7.11.0" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-object-rest-spread/-/plugin-proposal-object-rest-spread-7.11.0.tgz") "bd81f95a1f746760ea43b6c2d3d62b11790ad0af" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."@babel/plugin-syntax-object-rest-spread@^7.8.0")
          (s."@babel/plugin-transform-parameters@^7.10.4")
          ];
        "@babel/plugin-proposal-object-rest-spread@^7.11.0" = s."@babel/plugin-proposal-object-rest-spread@7.11.0";
        "@babel/plugin-proposal-optional-catch-binding@7.10.4" = f (sc "babel" "plugin-proposal-optional-catch-binding") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-optional-catch-binding/-/plugin-proposal-optional-catch-binding-7.10.4.tgz") "31c938309d24a78a49d68fdabffaa863758554dd" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."@babel/plugin-syntax-optional-catch-binding@^7.8.0")
          ];
        "@babel/plugin-proposal-optional-catch-binding@^7.10.4" = s."@babel/plugin-proposal-optional-catch-binding@7.10.4";
        "@babel/plugin-proposal-optional-chaining@7.11.0" = f (sc "babel" "plugin-proposal-optional-chaining") "7.11.0" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-optional-chaining/-/plugin-proposal-optional-chaining-7.11.0.tgz") "de5866d0646f6afdaab8a566382fe3a221755076" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."@babel/helper-skip-transparent-expression-wrappers@^7.11.0")
          (s."@babel/plugin-syntax-optional-chaining@^7.8.0")
          ];
        "@babel/plugin-proposal-optional-chaining@^7.11.0" = s."@babel/plugin-proposal-optional-chaining@7.11.0";
        "@babel/plugin-proposal-private-methods@7.10.4" = f (sc "babel" "plugin-proposal-private-methods") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-private-methods/-/plugin-proposal-private-methods-7.10.4.tgz") "b160d972b8fdba5c7d111a145fc8c421fc2a6909" [
          (s."@babel/helper-create-class-features-plugin@^7.10.4")
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-proposal-private-methods@^7.10.4" = s."@babel/plugin-proposal-private-methods@7.10.4";
        "@babel/plugin-proposal-unicode-property-regex@7.10.4" = f (sc "babel" "plugin-proposal-unicode-property-regex") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-unicode-property-regex/-/plugin-proposal-unicode-property-regex-7.10.4.tgz") "4483cda53041ce3413b7fe2f00022665ddfaa75d" [
          (s."@babel/helper-create-regexp-features-plugin@^7.10.4")
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-proposal-unicode-property-regex@^7.10.4" = s."@babel/plugin-proposal-unicode-property-regex@7.10.4";
        "@babel/plugin-proposal-unicode-property-regex@^7.4.4" = s."@babel/plugin-proposal-unicode-property-regex@7.10.4";
        "@babel/plugin-syntax-async-generators@7.8.4" = f (sc "babel" "plugin-syntax-async-generators") "7.8.4" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-async-generators/-/plugin-syntax-async-generators-7.8.4.tgz") "a983fb1aeb2ec3f6ed042a210f640e90e786fe0d" [
          (s."@babel/helper-plugin-utils@^7.8.0")
          ];
        "@babel/plugin-syntax-async-generators@^7.8.0" = s."@babel/plugin-syntax-async-generators@7.8.4";
        "@babel/plugin-syntax-class-properties@7.10.4" = f (sc "babel" "plugin-syntax-class-properties") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-class-properties/-/plugin-syntax-class-properties-7.10.4.tgz") "6644e6a0baa55a61f9e3231f6c9eeb6ee46c124c" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-syntax-class-properties@^7.10.4" = s."@babel/plugin-syntax-class-properties@7.10.4";
        "@babel/plugin-syntax-dynamic-import@7.8.3" = f (sc "babel" "plugin-syntax-dynamic-import") "7.8.3" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-dynamic-import/-/plugin-syntax-dynamic-import-7.8.3.tgz") "62bf98b2da3cd21d626154fc96ee5b3cb68eacb3" [
          (s."@babel/helper-plugin-utils@^7.8.0")
          ];
        "@babel/plugin-syntax-dynamic-import@^7.8.0" = s."@babel/plugin-syntax-dynamic-import@7.8.3";
        "@babel/plugin-syntax-export-namespace-from@7.8.3" = f (sc "babel" "plugin-syntax-export-namespace-from") "7.8.3" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-export-namespace-from/-/plugin-syntax-export-namespace-from-7.8.3.tgz") "028964a9ba80dbc094c915c487ad7c4e7a66465a" [
          (s."@babel/helper-plugin-utils@^7.8.3")
          ];
        "@babel/plugin-syntax-export-namespace-from@^7.8.3" = s."@babel/plugin-syntax-export-namespace-from@7.8.3";
        "@babel/plugin-syntax-json-strings@7.8.3" = f (sc "babel" "plugin-syntax-json-strings") "7.8.3" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-json-strings/-/plugin-syntax-json-strings-7.8.3.tgz") "01ca21b668cd8218c9e640cb6dd88c5412b2c96a" [
          (s."@babel/helper-plugin-utils@^7.8.0")
          ];
        "@babel/plugin-syntax-json-strings@^7.8.0" = s."@babel/plugin-syntax-json-strings@7.8.3";
        "@babel/plugin-syntax-logical-assignment-operators@7.10.4" = f (sc "babel" "plugin-syntax-logical-assignment-operators") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-logical-assignment-operators/-/plugin-syntax-logical-assignment-operators-7.10.4.tgz") "ca91ef46303530448b906652bac2e9fe9941f699" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-syntax-logical-assignment-operators@^7.10.4" = s."@babel/plugin-syntax-logical-assignment-operators@7.10.4";
        "@babel/plugin-syntax-nullish-coalescing-operator@7.8.3" = f (sc "babel" "plugin-syntax-nullish-coalescing-operator") "7.8.3" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-nullish-coalescing-operator/-/plugin-syntax-nullish-coalescing-operator-7.8.3.tgz") "167ed70368886081f74b5c36c65a88c03b66d1a9" [
          (s."@babel/helper-plugin-utils@^7.8.0")
          ];
        "@babel/plugin-syntax-nullish-coalescing-operator@^7.8.0" = s."@babel/plugin-syntax-nullish-coalescing-operator@7.8.3";
        "@babel/plugin-syntax-numeric-separator@7.10.4" = f (sc "babel" "plugin-syntax-numeric-separator") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-numeric-separator/-/plugin-syntax-numeric-separator-7.10.4.tgz") "b9b070b3e33570cd9fd07ba7fa91c0dd37b9af97" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-syntax-numeric-separator@^7.10.4" = s."@babel/plugin-syntax-numeric-separator@7.10.4";
        "@babel/plugin-syntax-object-rest-spread@7.8.3" = f (sc "babel" "plugin-syntax-object-rest-spread") "7.8.3" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-object-rest-spread/-/plugin-syntax-object-rest-spread-7.8.3.tgz") "60e225edcbd98a640332a2e72dd3e66f1af55871" [
          (s."@babel/helper-plugin-utils@^7.8.0")
          ];
        "@babel/plugin-syntax-object-rest-spread@^7.8.0" = s."@babel/plugin-syntax-object-rest-spread@7.8.3";
        "@babel/plugin-syntax-optional-catch-binding@7.8.3" = f (sc "babel" "plugin-syntax-optional-catch-binding") "7.8.3" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-optional-catch-binding/-/plugin-syntax-optional-catch-binding-7.8.3.tgz") "6111a265bcfb020eb9efd0fdfd7d26402b9ed6c1" [
          (s."@babel/helper-plugin-utils@^7.8.0")
          ];
        "@babel/plugin-syntax-optional-catch-binding@^7.8.0" = s."@babel/plugin-syntax-optional-catch-binding@7.8.3";
        "@babel/plugin-syntax-optional-chaining@7.8.3" = f (sc "babel" "plugin-syntax-optional-chaining") "7.8.3" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-optional-chaining/-/plugin-syntax-optional-chaining-7.8.3.tgz") "4f69c2ab95167e0180cd5336613f8c5788f7d48a" [
          (s."@babel/helper-plugin-utils@^7.8.0")
          ];
        "@babel/plugin-syntax-optional-chaining@^7.8.0" = s."@babel/plugin-syntax-optional-chaining@7.8.3";
        "@babel/plugin-syntax-top-level-await@7.10.4" = f (sc "babel" "plugin-syntax-top-level-await") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-top-level-await/-/plugin-syntax-top-level-await-7.10.4.tgz") "4bbeb8917b54fcf768364e0a81f560e33a3ef57d" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-syntax-top-level-await@^7.10.4" = s."@babel/plugin-syntax-top-level-await@7.10.4";
        "@babel/plugin-transform-arrow-functions@7.10.4" = f (sc "babel" "plugin-transform-arrow-functions") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-arrow-functions/-/plugin-transform-arrow-functions-7.10.4.tgz") "e22960d77e697c74f41c501d44d73dbf8a6a64cd" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-arrow-functions@^7.10.4" = s."@babel/plugin-transform-arrow-functions@7.10.4";
        "@babel/plugin-transform-async-to-generator@7.10.4" = f (sc "babel" "plugin-transform-async-to-generator") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-async-to-generator/-/plugin-transform-async-to-generator-7.10.4.tgz") "41a5017e49eb6f3cda9392a51eef29405b245a37" [
          (s."@babel/helper-module-imports@^7.10.4")
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."@babel/helper-remap-async-to-generator@^7.10.4")
          ];
        "@babel/plugin-transform-async-to-generator@^7.10.4" = s."@babel/plugin-transform-async-to-generator@7.10.4";
        "@babel/plugin-transform-block-scoped-functions@7.10.4" = f (sc "babel" "plugin-transform-block-scoped-functions") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-block-scoped-functions/-/plugin-transform-block-scoped-functions-7.10.4.tgz") "1afa595744f75e43a91af73b0d998ecfe4ebc2e8" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-block-scoped-functions@^7.10.4" = s."@babel/plugin-transform-block-scoped-functions@7.10.4";
        "@babel/plugin-transform-block-scoping@7.11.1" = f (sc "babel" "plugin-transform-block-scoping") "7.11.1" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-block-scoping/-/plugin-transform-block-scoping-7.11.1.tgz") "5b7efe98852bef8d652c0b28144cd93a9e4b5215" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-block-scoping@^7.10.4" = s."@babel/plugin-transform-block-scoping@7.11.1";
        "@babel/plugin-transform-classes@7.10.4" = f (sc "babel" "plugin-transform-classes") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-classes/-/plugin-transform-classes-7.10.4.tgz") "405136af2b3e218bc4a1926228bc917ab1a0adc7" [
          (s."@babel/helper-annotate-as-pure@^7.10.4")
          (s."@babel/helper-define-map@^7.10.4")
          (s."@babel/helper-function-name@^7.10.4")
          (s."@babel/helper-optimise-call-expression@^7.10.4")
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."@babel/helper-replace-supers@^7.10.4")
          (s."@babel/helper-split-export-declaration@^7.10.4")
          (s."globals@^11.1.0")
          ];
        "@babel/plugin-transform-classes@^7.10.4" = s."@babel/plugin-transform-classes@7.10.4";
        "@babel/plugin-transform-computed-properties@7.10.4" = f (sc "babel" "plugin-transform-computed-properties") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-computed-properties/-/plugin-transform-computed-properties-7.10.4.tgz") "9ded83a816e82ded28d52d4b4ecbdd810cdfc0eb" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-computed-properties@^7.10.4" = s."@babel/plugin-transform-computed-properties@7.10.4";
        "@babel/plugin-transform-destructuring@7.10.4" = f (sc "babel" "plugin-transform-destructuring") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-destructuring/-/plugin-transform-destructuring-7.10.4.tgz") "70ddd2b3d1bea83d01509e9bb25ddb3a74fc85e5" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-destructuring@^7.10.4" = s."@babel/plugin-transform-destructuring@7.10.4";
        "@babel/plugin-transform-dotall-regex@7.10.4" = f (sc "babel" "plugin-transform-dotall-regex") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-dotall-regex/-/plugin-transform-dotall-regex-7.10.4.tgz") "469c2062105c1eb6a040eaf4fac4b488078395ee" [
          (s."@babel/helper-create-regexp-features-plugin@^7.10.4")
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-dotall-regex@^7.10.4" = s."@babel/plugin-transform-dotall-regex@7.10.4";
        "@babel/plugin-transform-dotall-regex@^7.4.4" = s."@babel/plugin-transform-dotall-regex@7.10.4";
        "@babel/plugin-transform-duplicate-keys@7.10.4" = f (sc "babel" "plugin-transform-duplicate-keys") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-duplicate-keys/-/plugin-transform-duplicate-keys-7.10.4.tgz") "697e50c9fee14380fe843d1f306b295617431e47" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-duplicate-keys@^7.10.4" = s."@babel/plugin-transform-duplicate-keys@7.10.4";
        "@babel/plugin-transform-exponentiation-operator@7.10.4" = f (sc "babel" "plugin-transform-exponentiation-operator") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-exponentiation-operator/-/plugin-transform-exponentiation-operator-7.10.4.tgz") "5ae338c57f8cf4001bdb35607ae66b92d665af2e" [
          (s."@babel/helper-builder-binary-assignment-operator-visitor@^7.10.4")
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-exponentiation-operator@^7.10.4" = s."@babel/plugin-transform-exponentiation-operator@7.10.4";
        "@babel/plugin-transform-for-of@7.10.4" = f (sc "babel" "plugin-transform-for-of") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-for-of/-/plugin-transform-for-of-7.10.4.tgz") "c08892e8819d3a5db29031b115af511dbbfebae9" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-for-of@^7.10.4" = s."@babel/plugin-transform-for-of@7.10.4";
        "@babel/plugin-transform-function-name@7.10.4" = f (sc "babel" "plugin-transform-function-name") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-function-name/-/plugin-transform-function-name-7.10.4.tgz") "6a467880e0fc9638514ba369111811ddbe2644b7" [
          (s."@babel/helper-function-name@^7.10.4")
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-function-name@^7.10.4" = s."@babel/plugin-transform-function-name@7.10.4";
        "@babel/plugin-transform-literals@7.10.4" = f (sc "babel" "plugin-transform-literals") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-literals/-/plugin-transform-literals-7.10.4.tgz") "9f42ba0841100a135f22712d0e391c462f571f3c" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-literals@^7.10.4" = s."@babel/plugin-transform-literals@7.10.4";
        "@babel/plugin-transform-member-expression-literals@7.10.4" = f (sc "babel" "plugin-transform-member-expression-literals") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-member-expression-literals/-/plugin-transform-member-expression-literals-7.10.4.tgz") "b1ec44fcf195afcb8db2c62cd8e551c881baf8b7" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-member-expression-literals@^7.10.4" = s."@babel/plugin-transform-member-expression-literals@7.10.4";
        "@babel/plugin-transform-modules-amd@7.10.5" = f (sc "babel" "plugin-transform-modules-amd") "7.10.5" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-modules-amd/-/plugin-transform-modules-amd-7.10.5.tgz") "1b9cddaf05d9e88b3aad339cb3e445c4f020a9b1" [
          (s."@babel/helper-module-transforms@^7.10.5")
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."babel-plugin-dynamic-import-node@^2.3.3")
          ];
        "@babel/plugin-transform-modules-amd@^7.10.4" = s."@babel/plugin-transform-modules-amd@7.10.5";
        "@babel/plugin-transform-modules-commonjs@7.10.4" = f (sc "babel" "plugin-transform-modules-commonjs") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-modules-commonjs/-/plugin-transform-modules-commonjs-7.10.4.tgz") "66667c3eeda1ebf7896d41f1f16b17105a2fbca0" [
          (s."@babel/helper-module-transforms@^7.10.4")
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."@babel/helper-simple-access@^7.10.4")
          (s."babel-plugin-dynamic-import-node@^2.3.3")
          ];
        "@babel/plugin-transform-modules-commonjs@^7.10.4" = s."@babel/plugin-transform-modules-commonjs@7.10.4";
        "@babel/plugin-transform-modules-systemjs@7.10.5" = f (sc "babel" "plugin-transform-modules-systemjs") "7.10.5" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-modules-systemjs/-/plugin-transform-modules-systemjs-7.10.5.tgz") "6270099c854066681bae9e05f87e1b9cadbe8c85" [
          (s."@babel/helper-hoist-variables@^7.10.4")
          (s."@babel/helper-module-transforms@^7.10.5")
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."babel-plugin-dynamic-import-node@^2.3.3")
          ];
        "@babel/plugin-transform-modules-systemjs@^7.10.4" = s."@babel/plugin-transform-modules-systemjs@7.10.5";
        "@babel/plugin-transform-modules-umd@7.10.4" = f (sc "babel" "plugin-transform-modules-umd") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-modules-umd/-/plugin-transform-modules-umd-7.10.4.tgz") "9a8481fe81b824654b3a0b65da3df89f3d21839e" [
          (s."@babel/helper-module-transforms@^7.10.4")
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-modules-umd@^7.10.4" = s."@babel/plugin-transform-modules-umd@7.10.4";
        "@babel/plugin-transform-named-capturing-groups-regex@7.10.4" = f (sc "babel" "plugin-transform-named-capturing-groups-regex") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-named-capturing-groups-regex/-/plugin-transform-named-capturing-groups-regex-7.10.4.tgz") "78b4d978810b6f3bcf03f9e318f2fc0ed41aecb6" [
          (s."@babel/helper-create-regexp-features-plugin@^7.10.4")
          ];
        "@babel/plugin-transform-named-capturing-groups-regex@^7.10.4" = s."@babel/plugin-transform-named-capturing-groups-regex@7.10.4";
        "@babel/plugin-transform-new-target@7.10.4" = f (sc "babel" "plugin-transform-new-target") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-new-target/-/plugin-transform-new-target-7.10.4.tgz") "9097d753cb7b024cb7381a3b2e52e9513a9c6888" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-new-target@^7.10.4" = s."@babel/plugin-transform-new-target@7.10.4";
        "@babel/plugin-transform-object-super@7.10.4" = f (sc "babel" "plugin-transform-object-super") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-object-super/-/plugin-transform-object-super-7.10.4.tgz") "d7146c4d139433e7a6526f888c667e314a093894" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."@babel/helper-replace-supers@^7.10.4")
          ];
        "@babel/plugin-transform-object-super@^7.10.4" = s."@babel/plugin-transform-object-super@7.10.4";
        "@babel/plugin-transform-parameters@7.10.5" = f (sc "babel" "plugin-transform-parameters") "7.10.5" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-parameters/-/plugin-transform-parameters-7.10.5.tgz") "59d339d58d0b1950435f4043e74e2510005e2c4a" [
          (s."@babel/helper-get-function-arity@^7.10.4")
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-parameters@^7.10.4" = s."@babel/plugin-transform-parameters@7.10.5";
        "@babel/plugin-transform-property-literals@7.10.4" = f (sc "babel" "plugin-transform-property-literals") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-property-literals/-/plugin-transform-property-literals-7.10.4.tgz") "f6fe54b6590352298785b83edd815d214c42e3c0" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-property-literals@^7.10.4" = s."@babel/plugin-transform-property-literals@7.10.4";
        "@babel/plugin-transform-regenerator@7.10.4" = f (sc "babel" "plugin-transform-regenerator") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-regenerator/-/plugin-transform-regenerator-7.10.4.tgz") "2015e59d839074e76838de2159db421966fd8b63" [
          (s."regenerator-transform@^0.14.2")
          ];
        "@babel/plugin-transform-regenerator@^7.10.4" = s."@babel/plugin-transform-regenerator@7.10.4";
        "@babel/plugin-transform-reserved-words@7.10.4" = f (sc "babel" "plugin-transform-reserved-words") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-reserved-words/-/plugin-transform-reserved-words-7.10.4.tgz") "8f2682bcdcef9ed327e1b0861585d7013f8a54dd" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-reserved-words@^7.10.4" = s."@babel/plugin-transform-reserved-words@7.10.4";
        "@babel/plugin-transform-shorthand-properties@7.10.4" = f (sc "babel" "plugin-transform-shorthand-properties") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-shorthand-properties/-/plugin-transform-shorthand-properties-7.10.4.tgz") "9fd25ec5cdd555bb7f473e5e6ee1c971eede4dd6" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-shorthand-properties@^7.10.4" = s."@babel/plugin-transform-shorthand-properties@7.10.4";
        "@babel/plugin-transform-spread@7.11.0" = f (sc "babel" "plugin-transform-spread") "7.11.0" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-spread/-/plugin-transform-spread-7.11.0.tgz") "fa84d300f5e4f57752fe41a6d1b3c554f13f17cc" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."@babel/helper-skip-transparent-expression-wrappers@^7.11.0")
          ];
        "@babel/plugin-transform-spread@^7.11.0" = s."@babel/plugin-transform-spread@7.11.0";
        "@babel/plugin-transform-sticky-regex@7.10.4" = f (sc "babel" "plugin-transform-sticky-regex") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-sticky-regex/-/plugin-transform-sticky-regex-7.10.4.tgz") "8f3889ee8657581130a29d9cc91d7c73b7c4a28d" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."@babel/helper-regex@^7.10.4")
          ];
        "@babel/plugin-transform-sticky-regex@^7.10.4" = s."@babel/plugin-transform-sticky-regex@7.10.4";
        "@babel/plugin-transform-template-literals@7.10.5" = f (sc "babel" "plugin-transform-template-literals") "7.10.5" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-template-literals/-/plugin-transform-template-literals-7.10.5.tgz") "78bc5d626a6642db3312d9d0f001f5e7639fde8c" [
          (s."@babel/helper-annotate-as-pure@^7.10.4")
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-template-literals@^7.10.4" = s."@babel/plugin-transform-template-literals@7.10.5";
        "@babel/plugin-transform-typeof-symbol@7.10.4" = f (sc "babel" "plugin-transform-typeof-symbol") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-typeof-symbol/-/plugin-transform-typeof-symbol-7.10.4.tgz") "9509f1a7eec31c4edbffe137c16cc33ff0bc5bfc" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-typeof-symbol@^7.10.4" = s."@babel/plugin-transform-typeof-symbol@7.10.4";
        "@babel/plugin-transform-unicode-escapes@7.10.4" = f (sc "babel" "plugin-transform-unicode-escapes") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-unicode-escapes/-/plugin-transform-unicode-escapes-7.10.4.tgz") "feae523391c7651ddac115dae0a9d06857892007" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-unicode-escapes@^7.10.4" = s."@babel/plugin-transform-unicode-escapes@7.10.4";
        "@babel/plugin-transform-unicode-regex@7.10.4" = f (sc "babel" "plugin-transform-unicode-regex") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-unicode-regex/-/plugin-transform-unicode-regex-7.10.4.tgz") "e56d71f9282fac6db09c82742055576d5e6d80a8" [
          (s."@babel/helper-create-regexp-features-plugin@^7.10.4")
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-transform-unicode-regex@^7.10.4" = s."@babel/plugin-transform-unicode-regex@7.10.4";
        "@babel/preset-env@7.11.5" = f (sc "babel" "preset-env") "7.11.5" (ir "https://registry.yarnpkg.com/@babel/preset-env/-/preset-env-7.11.5.tgz") "18cb4b9379e3e92ffea92c07471a99a2914e4272" [
          (s."@babel/compat-data@^7.11.0")
          (s."@babel/helper-compilation-targets@^7.10.4")
          (s."@babel/helper-module-imports@^7.10.4")
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."@babel/plugin-proposal-async-generator-functions@^7.10.4")
          (s."@babel/plugin-proposal-class-properties@^7.10.4")
          (s."@babel/plugin-proposal-dynamic-import@^7.10.4")
          (s."@babel/plugin-proposal-export-namespace-from@^7.10.4")
          (s."@babel/plugin-proposal-json-strings@^7.10.4")
          (s."@babel/plugin-proposal-logical-assignment-operators@^7.11.0")
          (s."@babel/plugin-proposal-nullish-coalescing-operator@^7.10.4")
          (s."@babel/plugin-proposal-numeric-separator@^7.10.4")
          (s."@babel/plugin-proposal-object-rest-spread@^7.11.0")
          (s."@babel/plugin-proposal-optional-catch-binding@^7.10.4")
          (s."@babel/plugin-proposal-optional-chaining@^7.11.0")
          (s."@babel/plugin-proposal-private-methods@^7.10.4")
          (s."@babel/plugin-proposal-unicode-property-regex@^7.10.4")
          (s."@babel/plugin-syntax-async-generators@^7.8.0")
          (s."@babel/plugin-syntax-class-properties@^7.10.4")
          (s."@babel/plugin-syntax-dynamic-import@^7.8.0")
          (s."@babel/plugin-syntax-export-namespace-from@^7.8.3")
          (s."@babel/plugin-syntax-json-strings@^7.8.0")
          (s."@babel/plugin-syntax-logical-assignment-operators@^7.10.4")
          (s."@babel/plugin-syntax-nullish-coalescing-operator@^7.8.0")
          (s."@babel/plugin-syntax-numeric-separator@^7.10.4")
          (s."@babel/plugin-syntax-object-rest-spread@^7.8.0")
          (s."@babel/plugin-syntax-optional-catch-binding@^7.8.0")
          (s."@babel/plugin-syntax-optional-chaining@^7.8.0")
          (s."@babel/plugin-syntax-top-level-await@^7.10.4")
          (s."@babel/plugin-transform-arrow-functions@^7.10.4")
          (s."@babel/plugin-transform-async-to-generator@^7.10.4")
          (s."@babel/plugin-transform-block-scoped-functions@^7.10.4")
          (s."@babel/plugin-transform-block-scoping@^7.10.4")
          (s."@babel/plugin-transform-classes@^7.10.4")
          (s."@babel/plugin-transform-computed-properties@^7.10.4")
          (s."@babel/plugin-transform-destructuring@^7.10.4")
          (s."@babel/plugin-transform-dotall-regex@^7.10.4")
          (s."@babel/plugin-transform-duplicate-keys@^7.10.4")
          (s."@babel/plugin-transform-exponentiation-operator@^7.10.4")
          (s."@babel/plugin-transform-for-of@^7.10.4")
          (s."@babel/plugin-transform-function-name@^7.10.4")
          (s."@babel/plugin-transform-literals@^7.10.4")
          (s."@babel/plugin-transform-member-expression-literals@^7.10.4")
          (s."@babel/plugin-transform-modules-amd@^7.10.4")
          (s."@babel/plugin-transform-modules-commonjs@^7.10.4")
          (s."@babel/plugin-transform-modules-systemjs@^7.10.4")
          (s."@babel/plugin-transform-modules-umd@^7.10.4")
          (s."@babel/plugin-transform-named-capturing-groups-regex@^7.10.4")
          (s."@babel/plugin-transform-new-target@^7.10.4")
          (s."@babel/plugin-transform-object-super@^7.10.4")
          (s."@babel/plugin-transform-parameters@^7.10.4")
          (s."@babel/plugin-transform-property-literals@^7.10.4")
          (s."@babel/plugin-transform-regenerator@^7.10.4")
          (s."@babel/plugin-transform-reserved-words@^7.10.4")
          (s."@babel/plugin-transform-shorthand-properties@^7.10.4")
          (s."@babel/plugin-transform-spread@^7.11.0")
          (s."@babel/plugin-transform-sticky-regex@^7.10.4")
          (s."@babel/plugin-transform-template-literals@^7.10.4")
          (s."@babel/plugin-transform-typeof-symbol@^7.10.4")
          (s."@babel/plugin-transform-unicode-escapes@^7.10.4")
          (s."@babel/plugin-transform-unicode-regex@^7.10.4")
          (s."@babel/preset-modules@^0.1.3")
          (s."@babel/types@^7.11.5")
          (s."browserslist@^4.12.0")
          (s."core-js-compat@^3.6.2")
          (s."invariant@^2.2.2")
          (s."levenary@^1.1.1")
          (s."semver@^5.5.0")
          ];
        "@babel/preset-env@^7.5.2" = s."@babel/preset-env@7.11.5";
        "@babel/preset-modules@0.1.4" = f (sc "babel" "preset-modules") "0.1.4" (ir "https://registry.yarnpkg.com/@babel/preset-modules/-/preset-modules-0.1.4.tgz") "362f2b68c662842970fdb5e254ffc8fc1c2e415e" [
          (s."@babel/helper-plugin-utils@^7.0.0")
          (s."@babel/plugin-proposal-unicode-property-regex@^7.4.4")
          (s."@babel/plugin-transform-dotall-regex@^7.4.4")
          (s."@babel/types@^7.4.4")
          (s."esutils@^2.0.2")
          ];
        "@babel/preset-modules@^0.1.3" = s."@babel/preset-modules@0.1.4";
        "@babel/runtime@7.11.2" = f (sc "babel" "runtime") "7.11.2" (ir "https://registry.yarnpkg.com/@babel/runtime/-/runtime-7.11.2.tgz") "f549c13c754cc40b87644b9fa9f09a6a95fe0736" [
          (s."regenerator-runtime@^0.13.4")
          ];
        "@babel/runtime@^7.8.4" = s."@babel/runtime@7.11.2";
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
        "@babel/traverse@^7.7.0" = s."@babel/traverse@7.11.5";
        "@babel/types@7.11.5" = f (sc "babel" "types") "7.11.5" (ir "https://registry.yarnpkg.com/@babel/types/-/types-7.11.5.tgz") "d9de577d01252d77c6800cee039ee64faf75662d" [
          (s."@babel/helper-validator-identifier@^7.10.4")
          (s."lodash@^4.17.19")
          (s."to-fast-properties@^2.0.0")
          ];
        "@babel/types@^7.10.4" = s."@babel/types@7.11.5";
        "@babel/types@^7.10.5" = s."@babel/types@7.11.5";
        "@babel/types@^7.11.0" = s."@babel/types@7.11.5";
        "@babel/types@^7.11.5" = s."@babel/types@7.11.5";
        "@babel/types@^7.4.4" = s."@babel/types@7.11.5";
        "@babel/types@^7.7.0" = s."@babel/types@7.11.5";
        "@csstools/convert-colors@1.4.0" = f (sc "csstools" "convert-colors") "1.4.0" (ir "https://registry.yarnpkg.com/@csstools/convert-colors/-/convert-colors-1.4.0.tgz") "ad495dc41b12e75d588c6db8b9834f08fa131eb7" [];
        "@csstools/convert-colors@^1.4.0" = s."@csstools/convert-colors@1.4.0";
        "@types/estree@*" = s."@types/estree@0.0.45";
        "@types/estree@0.0.45" = f (sc "types" "estree") "0.0.45" (ir "https://registry.yarnpkg.com/@types/estree/-/estree-0.0.45.tgz") "e9387572998e5ecdac221950dab3e8c3b16af884" [];
        "@types/node@*" = s."@types/node@14.11.7";
        "@types/node@14.11.7" = f (sc "types" "node") "14.11.7" (ir "https://registry.yarnpkg.com/@types/node/-/node-14.11.7.tgz") "4d9673b8331ce262628ea89d9ef3964b6c1e5489" [];
        "acorn-jsx@5.3.1" = f "acorn-jsx" "5.3.1" y "fc8661e11b7ac1539c47dbfea2e72b3af34d267b" [];
        "acorn-jsx@^5.0.0" = s."acorn-jsx@5.3.1";
        "acorn@6.4.2" = f "acorn" "6.4.2" y "35866fd710528e92de10cf06016498e47e39e1e6" [];
        "acorn@7.4.1" = f "acorn" "7.4.1" y "feaed255973d2e77555b83dbc08851a6c63520fa" [];
        "acorn@^6.0.7" = s."acorn@6.4.2";
        "acorn@^7.1.0" = s."acorn@7.4.1";
        "ajv@6.12.5" = f "ajv" "6.12.5" y "19b0e8bae8f476e5ba666300387775fb1a00a4da" [
          (s."fast-deep-equal@^3.1.1")
          (s."fast-json-stable-stringify@^2.0.0")
          (s."json-schema-traverse@^0.4.1")
          (s."uri-js@^4.2.2")
          ];
        "ajv@^6.10.2" = s."ajv@6.12.5";
        "ajv@^6.9.1" = s."ajv@6.12.5";
        "ansi-escapes@3.2.0" = f "ansi-escapes" "3.2.0" y "8780b98ff9dbf5638152d1f1fe5c1d7b4442976b" [];
        "ansi-escapes@^3.2.0" = s."ansi-escapes@3.2.0";
        "ansi-regex@3.0.0" = f "ansi-regex" "3.0.0" y "ed0317c322064f79466c02966bddb605ab37d998" [];
        "ansi-regex@4.1.0" = f "ansi-regex" "4.1.0" y "8b9f8f08cf1acb843756a839ca8c7e3168c51997" [];
        "ansi-regex@^3.0.0" = s."ansi-regex@3.0.0";
        "ansi-regex@^4.1.0" = s."ansi-regex@4.1.0";
        "ansi-styles@3.2.1" = f "ansi-styles" "3.2.1" y "41fbb20243e50b12be0f04b8dedbf07520ce841d" [
          (s."color-convert@^1.9.0")
          ];
        "ansi-styles@^3.2.0" = s."ansi-styles@3.2.1";
        "ansi-styles@^3.2.1" = s."ansi-styles@3.2.1";
        "argparse@1.0.10" = f "argparse" "1.0.10" y "bcd6791ea5ae09725e17e5ad988134cd40b3d911" [
          (s."sprintf-js@~1.0.2")
          ];
        "argparse@^1.0.7" = s."argparse@1.0.10";
        "astral-regex@1.0.0" = f "astral-regex" "1.0.0" y "6c8c3fb827dd43ee3918f27b82782ab7658a6fd9" [];
        "astral-regex@^1.0.0" = s."astral-regex@1.0.0";
        "autoprefixer@9.8.6" = f "autoprefixer" "9.8.6" y "3b73594ca1bf9266320c5acf1588d74dea74210f" [
          (s."browserslist@^4.12.0")
          (s."caniuse-lite@^1.0.30001109")
          (s."colorette@^1.2.1")
          (s."normalize-range@^0.1.2")
          (s."num2fraction@^1.2.2")
          (s."postcss@^7.0.32")
          (s."postcss-value-parser@^4.1.0")
          ];
        "autoprefixer@^9.6.1" = s."autoprefixer@9.8.6";
        "babel-eslint@10.1.0" = f "babel-eslint" "10.1.0" y "6968e568a910b78fb3779cdd8b6ac2f479943232" [
          (s."@babel/code-frame@^7.0.0")
          (s."@babel/parser@^7.7.0")
          (s."@babel/traverse@^7.7.0")
          (s."@babel/types@^7.7.0")
          (s."eslint-visitor-keys@^1.0.0")
          (s."resolve@^1.12.0")
          ];
        "babel-eslint@^10.0.2" = s."babel-eslint@10.1.0";
        "babel-plugin-dynamic-import-node@2.3.3" = f "babel-plugin-dynamic-import-node" "2.3.3" y "84fda19c976ec5c6defef57f9427b3def66e17a3" [
          (s."object.assign@^4.1.0")
          ];
        "babel-plugin-dynamic-import-node@^2.3.3" = s."babel-plugin-dynamic-import-node@2.3.3";
        "balanced-match@1.0.0" = f "balanced-match" "1.0.0" y "89b4d199ab2bee49de164ea02b89ce462d71b767" [];
        "balanced-match@^1.0.0" = s."balanced-match@1.0.0";
        "brace-expansion@1.1.11" = f "brace-expansion" "1.1.11" y "3c7fcbf529d87226f3d2f52b966ff5271eb441dd" [
          (s."balanced-match@^1.0.0")
          (s."concat-map@0.0.1")
          ];
        "brace-expansion@^1.1.7" = s."brace-expansion@1.1.11";
        "browserslist@4.14.5" = f "browserslist" "4.14.5" y "1c751461a102ddc60e40993639b709be7f2c4015" [
          (s."caniuse-lite@^1.0.30001135")
          (s."electron-to-chromium@^1.3.571")
          (s."escalade@^3.1.0")
          (s."node-releases@^1.1.61")
          ];
        "browserslist@^4.12.0" = s."browserslist@4.14.5";
        "browserslist@^4.6.4" = s."browserslist@4.14.5";
        "browserslist@^4.8.5" = s."browserslist@4.14.5";
        "buffer-from@1.1.1" = f "buffer-from" "1.1.1" y "32713bc028f75c02fdb710d7c7bcec1f2c6070ef" [];
        "buffer-from@^1.0.0" = s."buffer-from@1.1.1";
        "callsites@3.1.0" = f "callsites" "3.1.0" y "b3630abd8943432f54b3f0519238e33cd7df2f73" [];
        "callsites@^3.0.0" = s."callsites@3.1.0";
        "caniuse-lite@1.0.30001146" = f "caniuse-lite" "1.0.30001146" y "c61fcb1474520c1462913689201fb292ba6f447c" [];
        "caniuse-lite@^1.0.30000981" = s."caniuse-lite@1.0.30001146";
        "caniuse-lite@^1.0.30001109" = s."caniuse-lite@1.0.30001146";
        "caniuse-lite@^1.0.30001135" = s."caniuse-lite@1.0.30001146";
        "chalk@2.4.2" = f "chalk" "2.4.2" y "cd42541677a54333cf541a49108c1432b44c9424" [
          (s."ansi-styles@^3.2.1")
          (s."escape-string-regexp@^1.0.5")
          (s."supports-color@^5.3.0")
          ];
        "chalk@^2.0.0" = s."chalk@2.4.2";
        "chalk@^2.1.0" = s."chalk@2.4.2";
        "chalk@^2.4.2" = s."chalk@2.4.2";
        "chardet@0.7.0" = f "chardet" "0.7.0" y "90094849f0937f2eedc2425d0d28a9e5f0cbad9e" [];
        "chardet@^0.7.0" = s."chardet@0.7.0";
        "cli-cursor@2.1.0" = f "cli-cursor" "2.1.0" y "b35dac376479facc3e94747d41d0d0f5238ffcb5" [
          (s."restore-cursor@^2.0.0")
          ];
        "cli-cursor@^2.1.0" = s."cli-cursor@2.1.0";
        "cli-width@2.2.1" = f "cli-width" "2.2.1" y "b0433d0b4e9c847ef18868a4ef16fd5fc8271c48" [];
        "cli-width@^2.0.0" = s."cli-width@2.2.1";
        "color-convert@1.9.3" = f "color-convert" "1.9.3" y "bb71850690e1f136567de629d2d5471deda4c1e8" [
          (s."color-name@1.1.3")
          ];
        "color-convert@^1.9.0" = s."color-convert@1.9.3";
        "color-name@1.1.3" = f "color-name" "1.1.3" y "a7d0558bd89c42f795dd42328f740831ca53bc25" [];
        "colorette@1.2.1" = f "colorette" "1.2.1" y "4d0b921325c14faf92633086a536db6e89564b1b" [];
        "colorette@^1.2.1" = s."colorette@1.2.1";
        "concat-map@0.0.1" = f "concat-map" "0.0.1" y "d8a96bd77fd68df7793a73036a3ba0d5405d477b" [];
        "concat-stream@1.6.2" = f "concat-stream" "1.6.2" y "904bdf194cd3122fc675c77fc4ac3d4ff0fd1a34" [
          (s."buffer-from@^1.0.0")
          (s."inherits@^2.0.3")
          (s."readable-stream@^2.2.2")
          (s."typedarray@^0.0.6")
          ];
        "concat-stream@^1.4.7" = s."concat-stream@1.6.2";
        "convert-source-map@1.7.0" = f "convert-source-map" "1.7.0" y "17a2cb882d7f77d3490585e2ce6c524424a3a442" [
          (s."safe-buffer@~5.1.1")
          ];
        "convert-source-map@^1.7.0" = s."convert-source-map@1.7.0";
        "core-js-compat@3.6.5" = f "core-js-compat" "3.6.5" y "2a51d9a4e25dfd6e690251aa81f99e3c05481f1c" [
          (s."browserslist@^4.8.5")
          (s."semver@7.0.0")
          ];
        "core-js-compat@^3.6.2" = s."core-js-compat@3.6.5";
        "core-util-is@1.0.2" = f "core-util-is" "1.0.2" y "b5fd54220aa2bc5ab57aab7140c940754503c1a7" [];
        "core-util-is@~1.0.0" = s."core-util-is@1.0.2";
        "cross-spawn@5.1.0" = f "cross-spawn" "5.1.0" y "e8bd0efee58fcff6f8f94510a0a554bbfa235449" [
          (s."lru-cache@^4.0.1")
          (s."shebang-command@^1.2.0")
          (s."which@^1.2.9")
          ];
        "cross-spawn@6.0.5" = f "cross-spawn" "6.0.5" y "4a5ec7c64dfae22c3a14124dbacdee846d80cbc4" [
          (s."nice-try@^1.0.4")
          (s."path-key@^2.0.1")
          (s."semver@^5.5.0")
          (s."shebang-command@^1.2.0")
          (s."which@^1.2.9")
          ];
        "cross-spawn@^5.0.1" = s."cross-spawn@5.1.0";
        "cross-spawn@^6.0.5" = s."cross-spawn@6.0.5";
        "css-blank-pseudo@0.1.4" = f "css-blank-pseudo" "0.1.4" y "dfdefd3254bf8a82027993674ccf35483bfcb3c5" [
          (s."postcss@^7.0.5")
          ];
        "css-blank-pseudo@^0.1.4" = s."css-blank-pseudo@0.1.4";
        "css-has-pseudo@0.10.0" = f "css-has-pseudo" "0.10.0" y "3c642ab34ca242c59c41a125df9105841f6966ee" [
          (s."postcss@^7.0.6")
          (s."postcss-selector-parser@^5.0.0-rc.4")
          ];
        "css-has-pseudo@^0.10.0" = s."css-has-pseudo@0.10.0";
        "css-prefers-color-scheme@3.1.1" = f "css-prefers-color-scheme" "3.1.1" y "6f830a2714199d4f0d0d0bb8a27916ed65cff1f4" [
          (s."postcss@^7.0.5")
          ];
        "css-prefers-color-scheme@^3.1.1" = s."css-prefers-color-scheme@3.1.1";
        "cssdb@4.4.0" = f "cssdb" "4.4.0" y "3bf2f2a68c10f5c6a08abd92378331ee803cddb0" [];
        "cssdb@^4.4.0" = s."cssdb@4.4.0";
        "cssesc@2.0.0" = f "cssesc" "2.0.0" y "3b13bd1bb1cb36e1bcb5a4dcd27f54c5dcb35703" [];
        "cssesc@3.0.0" = f "cssesc" "3.0.0" y "37741919903b868565e1c09ea747445cd18983ee" [];
        "cssesc@^2.0.0" = s."cssesc@2.0.0";
        "cssesc@^3.0.0" = s."cssesc@3.0.0";
        "debug@4.2.0" = f "debug" "4.2.0" y "7f150f93920e94c58f5574c2fd01a3110effe7f1" [
          (s."ms@2.1.2")
          ];
        "debug@^4.0.1" = s."debug@4.2.0";
        "debug@^4.1.0" = s."debug@4.2.0";
        "deep-is@0.1.3" = f "deep-is" "0.1.3" y "b369d6fb5dbc13eecf524f91b070feedc357cf34" [];
        "deep-is@~0.1.3" = s."deep-is@0.1.3";
        "define-properties@1.1.3" = f "define-properties" "1.1.3" y "cf88da6cbee26fe6db7094f61d870cbd84cee9f1" [
          (s."object-keys@^1.0.12")
          ];
        "define-properties@^1.1.3" = s."define-properties@1.1.3";
        "doctrine@3.0.0" = f "doctrine" "3.0.0" y "addebead72a6574db783639dc87a121773973961" [
          (s."esutils@^2.0.2")
          ];
        "doctrine@^3.0.0" = s."doctrine@3.0.0";
        "electron-to-chromium@1.3.578" = f "electron-to-chromium" "1.3.578" y "e6671936f4571a874eb26e2e833aa0b2c0b776e0" [];
        "electron-to-chromium@^1.3.571" = s."electron-to-chromium@1.3.578";
        "emoji-regex@7.0.3" = f "emoji-regex" "7.0.3" y "933a04052860c85e83c122479c4748a8e4c72156" [];
        "emoji-regex@^7.0.1" = s."emoji-regex@7.0.3";
        "es-abstract@1.17.7" = f "es-abstract" "1.17.7" y "a4de61b2f66989fc7421676c1cb9787573ace54c" [
          (s."es-to-primitive@^1.2.1")
          (s."function-bind@^1.1.1")
          (s."has@^1.0.3")
          (s."has-symbols@^1.0.1")
          (s."is-callable@^1.2.2")
          (s."is-regex@^1.1.1")
          (s."object-inspect@^1.8.0")
          (s."object-keys@^1.1.1")
          (s."object.assign@^4.1.1")
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
          (s."object.assign@^4.1.1")
          (s."string.prototype.trimend@^1.0.1")
          (s."string.prototype.trimstart@^1.0.1")
          ];
        "es-abstract@^1.17.5" = s."es-abstract@1.17.7";
        "es-abstract@^1.18.0-next.0" = s."es-abstract@1.18.0-next.1";
        "es-to-primitive@1.2.1" = f "es-to-primitive" "1.2.1" y "e55cd4c9cdc188bcefb03b366c736323fc5c898a" [
          (s."is-callable@^1.1.4")
          (s."is-date-object@^1.0.1")
          (s."is-symbol@^1.0.2")
          ];
        "es-to-primitive@^1.2.1" = s."es-to-primitive@1.2.1";
        "escalade@3.1.0" = f "escalade" "3.1.0" y "e8e2d7c7a8b76f6ee64c2181d6b8151441602d4e" [];
        "escalade@^3.1.0" = s."escalade@3.1.0";
        "escape-string-regexp@1.0.5" = f "escape-string-regexp" "1.0.5" y "1b61c0562190a8dff6ae3bb2cf0200ca130b86d4" [];
        "escape-string-regexp@^1.0.5" = s."escape-string-regexp@1.0.5";
        "eslint-config-dev@2.0.0" = f "eslint-config-dev" "2.0.0" y "82e5ca313449af7b12bbfd4e9733eb286f0f43b7" [];
        "eslint-config-dev@^2.0.0" = s."eslint-config-dev@2.0.0";
        "eslint-scope@4.0.3" = f "eslint-scope" "4.0.3" y "ca03833310f6889a3264781aa82e63eb9cfe7848" [
          (s."esrecurse@^4.1.0")
          (s."estraverse@^4.1.1")
          ];
        "eslint-scope@^4.0.3" = s."eslint-scope@4.0.3";
        "eslint-utils@1.4.3" = f "eslint-utils" "1.4.3" y "74fec7c54d0776b6f67e0251040b5806564e981f" [
          (s."eslint-visitor-keys@^1.1.0")
          ];
        "eslint-utils@^1.3.1" = s."eslint-utils@1.4.3";
        "eslint-visitor-keys@1.3.0" = f "eslint-visitor-keys" "1.3.0" y "30ebd1ef7c2fdff01c3a4f151044af25fab0523e" [];
        "eslint-visitor-keys@^1.0.0" = s."eslint-visitor-keys@1.3.0";
        "eslint-visitor-keys@^1.1.0" = s."eslint-visitor-keys@1.3.0";
        "eslint@5.16.0" = f "eslint" "5.16.0" y "a1e3ac1aae4a3fbd8296fcf8f7ab7314cbb6abea" [
          (s."@babel/code-frame@^7.0.0")
          (s."ajv@^6.9.1")
          (s."chalk@^2.1.0")
          (s."cross-spawn@^6.0.5")
          (s."debug@^4.0.1")
          (s."doctrine@^3.0.0")
          (s."eslint-scope@^4.0.3")
          (s."eslint-utils@^1.3.1")
          (s."eslint-visitor-keys@^1.0.0")
          (s."espree@^5.0.1")
          (s."esquery@^1.0.1")
          (s."esutils@^2.0.2")
          (s."file-entry-cache@^5.0.1")
          (s."functional-red-black-tree@^1.0.1")
          (s."glob@^7.1.2")
          (s."globals@^11.7.0")
          (s."ignore@^4.0.6")
          (s."import-fresh@^3.0.0")
          (s."imurmurhash@^0.1.4")
          (s."inquirer@^6.2.2")
          (s."js-yaml@^3.13.0")
          (s."json-stable-stringify-without-jsonify@^1.0.1")
          (s."levn@^0.3.0")
          (s."lodash@^4.17.11")
          (s."minimatch@^3.0.4")
          (s."mkdirp@^0.5.1")
          (s."natural-compare@^1.4.0")
          (s."optionator@^0.8.2")
          (s."path-is-inside@^1.0.2")
          (s."progress@^2.0.0")
          (s."regexpp@^2.0.1")
          (s."semver@^5.5.1")
          (s."strip-ansi@^4.0.0")
          (s."strip-json-comments@^2.0.1")
          (s."table@^5.2.3")
          (s."text-table@^0.2.0")
          ];
        "eslint@^5.16.0" = s."eslint@5.16.0";
        "espree@5.0.1" = f "espree" "5.0.1" y "5d6526fa4fc7f0788a5cf75b15f30323e2f81f7a" [
          (s."acorn@^6.0.7")
          (s."acorn-jsx@^5.0.0")
          (s."eslint-visitor-keys@^1.0.0")
          ];
        "espree@^5.0.1" = s."espree@5.0.1";
        "esprima@4.0.1" = f "esprima" "4.0.1" y "13b04cdb3e6c5d19df91ab6987a8695619b0aa71" [];
        "esprima@^4.0.0" = s."esprima@4.0.1";
        "esquery@1.3.1" = f "esquery" "1.3.1" y "b78b5828aa8e214e29fb74c4d5b752e1c033da57" [
          (s."estraverse@^5.1.0")
          ];
        "esquery@^1.0.1" = s."esquery@1.3.1";
        "esrecurse@4.3.0" = f "esrecurse" "4.3.0" y "7ad7964d679abb28bee72cec63758b1c5d2c9921" [
          (s."estraverse@^5.2.0")
          ];
        "esrecurse@^4.1.0" = s."esrecurse@4.3.0";
        "estraverse@4.3.0" = f "estraverse" "4.3.0" y "398ad3f3c5a24948be7725e83d11a7de28cdbd1d" [];
        "estraverse@5.2.0" = f "estraverse" "5.2.0" y "307df42547e6cc7324d3cf03c155d5cdb8c53880" [];
        "estraverse@^4.1.1" = s."estraverse@4.3.0";
        "estraverse@^5.1.0" = s."estraverse@5.2.0";
        "estraverse@^5.2.0" = s."estraverse@5.2.0";
        "estree-walker@0.6.1" = f "estree-walker" "0.6.1" y "53049143f40c6eb918b23671d1fe3219f3a1b362" [];
        "estree-walker@^0.6.1" = s."estree-walker@0.6.1";
        "esutils@2.0.3" = f "esutils" "2.0.3" y "74d2eb4de0b8da1293711910d50775b9b710ef64" [];
        "esutils@^2.0.2" = s."esutils@2.0.3";
        "external-editor@3.1.0" = f "external-editor" "3.1.0" y "cb03f740befae03ea4d283caed2741a83f335495" [
          (s."chardet@^0.7.0")
          (s."iconv-lite@^0.4.24")
          (s."tmp@^0.0.33")
          ];
        "external-editor@^3.0.3" = s."external-editor@3.1.0";
        "fast-deep-equal@3.1.3" = f "fast-deep-equal" "3.1.3" y "3a7d56b559d6cbc3eb512325244e619a65c6c525" [];
        "fast-deep-equal@^3.1.1" = s."fast-deep-equal@3.1.3";
        "fast-json-stable-stringify@2.1.0" = f "fast-json-stable-stringify" "2.1.0" y "874bf69c6f404c2b5d99c481341399fd55892633" [];
        "fast-json-stable-stringify@^2.0.0" = s."fast-json-stable-stringify@2.1.0";
        "fast-levenshtein@2.0.6" = f "fast-levenshtein" "2.0.6" y "3d8a5c66883a16a30ca8643e851f19baa7797917" [];
        "fast-levenshtein@~2.0.6" = s."fast-levenshtein@2.0.6";
        "figures@2.0.0" = f "figures" "2.0.0" y "3ab1a2d2a62c8bfb431a0c94cb797a2fce27c962" [
          (s."escape-string-regexp@^1.0.5")
          ];
        "figures@^2.0.0" = s."figures@2.0.0";
        "file-entry-cache@5.0.1" = f "file-entry-cache" "5.0.1" y "ca0f6efa6dd3d561333fb14515065c2fafdf439c" [
          (s."flat-cache@^2.0.1")
          ];
        "file-entry-cache@^5.0.1" = s."file-entry-cache@5.0.1";
        "flat-cache@2.0.1" = f "flat-cache" "2.0.1" y "5d296d6f04bda44a4630a301413bdbc2ec085ec0" [
          (s."flatted@^2.0.0")
          (s."rimraf@2.6.3")
          (s."write@1.0.3")
          ];
        "flat-cache@^2.0.1" = s."flat-cache@2.0.1";
        "flatted@2.0.2" = f "flatted" "2.0.2" y "4575b21e2bcee7434aa9be662f4b7b5f9c2b5138" [];
        "flatted@^2.0.0" = s."flatted@2.0.2";
        "flatten@1.0.3" = f "flatten" "1.0.3" y "c1283ac9f27b368abc1e36d1ff7b04501a30356b" [];
        "flatten@^1.0.2" = s."flatten@1.0.3";
        "fs.realpath@1.0.0" = f "fs.realpath" "1.0.0" y "1504ad2523158caa40db4a2787cb01411994ea4f" [];
        "fs.realpath@^1.0.0" = s."fs.realpath@1.0.0";
        "function-bind@1.1.1" = f "function-bind" "1.1.1" y "a56899d3ea3c9bab874bb9773b7c5ede92f4895d" [];
        "function-bind@^1.1.1" = s."function-bind@1.1.1";
        "functional-red-black-tree@1.0.1" = f "functional-red-black-tree" "1.0.1" y "1b0ab3bd553b2a0d6399d29c0e3ea0b252078327" [];
        "functional-red-black-tree@^1.0.1" = s."functional-red-black-tree@1.0.1";
        "gensync@1.0.0-beta.1" = f "gensync" "1.0.0-beta.1" y "58f4361ff987e5ff6e1e7a210827aa371eaac269" [];
        "gensync@^1.0.0-beta.1" = s."gensync@1.0.0-beta.1";
        "glob@7.1.6" = f "glob" "7.1.6" y "141f33b81a7c2492e125594307480c46679278a6" [
          (s."fs.realpath@^1.0.0")
          (s."inflight@^1.0.4")
          (s."inherits@2")
          (s."minimatch@^3.0.4")
          (s."once@^1.3.0")
          (s."path-is-absolute@^1.0.0")
          ];
        "glob@^7.1.2" = s."glob@7.1.6";
        "glob@^7.1.3" = s."glob@7.1.6";
        "globals@11.12.0" = f "globals" "11.12.0" y "ab8795338868a0babd8525758018c2a7eb95c42e" [];
        "globals@^11.1.0" = s."globals@11.12.0";
        "globals@^11.7.0" = s."globals@11.12.0";
        "has-flag@3.0.0" = f "has-flag" "3.0.0" y "b5d454dc2199ae225699f3467e5a07f3b955bafd" [];
        "has-flag@^3.0.0" = s."has-flag@3.0.0";
        "has-symbols@1.0.1" = f "has-symbols" "1.0.1" y "9f5214758a44196c406d9bd76cebf81ec2dd31e8" [];
        "has-symbols@^1.0.1" = s."has-symbols@1.0.1";
        "has@1.0.3" = f "has" "1.0.3" y "722d7cbfc1f6aa8241f16dd814e011e1f41e8796" [
          (s."function-bind@^1.1.1")
          ];
        "has@^1.0.3" = s."has@1.0.3";
        "iconv-lite@0.4.24" = f "iconv-lite" "0.4.24" y "2022b4b25fbddc21d2f524974a474aafe733908b" [
          (s."safer-buffer@>= 2.1.2 < 3")
          ];
        "iconv-lite@^0.4.24" = s."iconv-lite@0.4.24";
        "ignore@4.0.6" = f "ignore" "4.0.6" y "750e3db5862087b4737ebac8207ffd1ef27b25fc" [];
        "ignore@^4.0.6" = s."ignore@4.0.6";
        "import-fresh@3.2.1" = f "import-fresh" "3.2.1" y "633ff618506e793af5ac91bf48b72677e15cbe66" [
          (s."parent-module@^1.0.0")
          (s."resolve-from@^4.0.0")
          ];
        "import-fresh@^3.0.0" = s."import-fresh@3.2.1";
        "imurmurhash@0.1.4" = f "imurmurhash" "0.1.4" y "9218b9b2b928a238b13dc4fb6b6d576f231453ea" [];
        "imurmurhash@^0.1.4" = s."imurmurhash@0.1.4";
        "indexes-of@1.0.1" = f "indexes-of" "1.0.1" y "f30f716c8e2bd346c7b67d3df3915566a7c05607" [];
        "indexes-of@^1.0.1" = s."indexes-of@1.0.1";
        "inflight@1.0.6" = f "inflight" "1.0.6" y "49bd6331d7d02d0c09bc910a1075ba8165b56df9" [
          (s."once@^1.3.0")
          (s."wrappy@1")
          ];
        "inflight@^1.0.4" = s."inflight@1.0.6";
        "inherits@2" = s."inherits@2.0.4";
        "inherits@2.0.4" = f "inherits" "2.0.4" y "0fa2c64f932917c3433a0ded55363aae37416b7c" [];
        "inherits@^2.0.3" = s."inherits@2.0.4";
        "inherits@~2.0.3" = s."inherits@2.0.4";
        "inquirer@6.5.2" = f "inquirer" "6.5.2" y "ad50942375d036d327ff528c08bd5fab089928ca" [
          (s."ansi-escapes@^3.2.0")
          (s."chalk@^2.4.2")
          (s."cli-cursor@^2.1.0")
          (s."cli-width@^2.0.0")
          (s."external-editor@^3.0.3")
          (s."figures@^2.0.0")
          (s."lodash@^4.17.12")
          (s."mute-stream@0.0.7")
          (s."run-async@^2.2.0")
          (s."rxjs@^6.4.0")
          (s."string-width@^2.1.0")
          (s."strip-ansi@^5.1.0")
          (s."through@^2.3.6")
          ];
        "inquirer@^6.2.2" = s."inquirer@6.5.2";
        "invariant@2.2.4" = f "invariant" "2.2.4" y "610f3c92c9359ce1db616e538008d23ff35158e6" [
          (s."loose-envify@^1.0.0")
          ];
        "invariant@^2.2.2" = s."invariant@2.2.4";
        "invariant@^2.2.4" = s."invariant@2.2.4";
        "is-callable@1.2.2" = f "is-callable" "1.2.2" y "c7c6715cd22d4ddb48d3e19970223aceabb080d9" [];
        "is-callable@^1.1.4" = s."is-callable@1.2.2";
        "is-callable@^1.2.2" = s."is-callable@1.2.2";
        "is-date-object@1.0.2" = f "is-date-object" "1.0.2" y "bda736f2cd8fd06d32844e7743bfa7494c3bfd7e" [];
        "is-date-object@^1.0.1" = s."is-date-object@1.0.2";
        "is-fullwidth-code-point@2.0.0" = f "is-fullwidth-code-point" "2.0.0" y "a3b30a5c4f199183167aaab93beefae3ddfb654f" [];
        "is-fullwidth-code-point@^2.0.0" = s."is-fullwidth-code-point@2.0.0";
        "is-negative-zero@2.0.0" = f "is-negative-zero" "2.0.0" y "9553b121b0fac28869da9ed459e20c7543788461" [];
        "is-negative-zero@^2.0.0" = s."is-negative-zero@2.0.0";
        "is-regex@1.1.1" = f "is-regex" "1.1.1" y "c6f98aacc546f6cec5468a07b7b153ab564a57b9" [
          (s."has-symbols@^1.0.1")
          ];
        "is-regex@^1.1.1" = s."is-regex@1.1.1";
        "is-symbol@1.0.3" = f "is-symbol" "1.0.3" y "38e1014b9e6329be0de9d24a414fd7441ec61937" [
          (s."has-symbols@^1.0.1")
          ];
        "is-symbol@^1.0.2" = s."is-symbol@1.0.3";
        "isarray@1.0.0" = f "isarray" "1.0.0" y "bb935d48582cba168c06834957a54a3e07124f11" [];
        "isarray@~1.0.0" = s."isarray@1.0.0";
        "isexe@2.0.0" = f "isexe" "2.0.0" y "e8fbf374dc556ff8947a10dcb0572d633f2cfa10" [];
        "isexe@^2.0.0" = s."isexe@2.0.0";
        "js-tokens@4.0.0" = f "js-tokens" "4.0.0" y "19203fb59991df98e3a287050d4647cdeaf32499" [];
        "js-tokens@^3.0.0 || ^4.0.0" = s."js-tokens@4.0.0";
        "js-tokens@^4.0.0" = s."js-tokens@4.0.0";
        "js-yaml@3.14.0" = f "js-yaml" "3.14.0" y "a7a34170f26a21bb162424d8adacb4113a69e482" [
          (s."argparse@^1.0.7")
          (s."esprima@^4.0.0")
          ];
        "js-yaml@^3.13.0" = s."js-yaml@3.14.0";
        "jsesc@0.5.0" = f "jsesc" "0.5.0" y "e7dee66e35d6fc16f710fe91d5cf69f70f08911d" [];
        "jsesc@2.5.2" = f "jsesc" "2.5.2" y "80564d2e483dacf6e8ef209650a67df3f0c283a4" [];
        "jsesc@^2.5.1" = s."jsesc@2.5.2";
        "jsesc@~0.5.0" = s."jsesc@0.5.0";
        "json-schema-traverse@0.4.1" = f "json-schema-traverse" "0.4.1" y "69f6a87d9513ab8bb8fe63bdb0979c448e684660" [];
        "json-schema-traverse@^0.4.1" = s."json-schema-traverse@0.4.1";
        "json-stable-stringify-without-jsonify@1.0.1" = f "json-stable-stringify-without-jsonify" "1.0.1" y "9db7b59496ad3f3cfef30a75142d2d930ad72651" [];
        "json-stable-stringify-without-jsonify@^1.0.1" = s."json-stable-stringify-without-jsonify@1.0.1";
        "json5@2.1.3" = f "json5" "2.1.3" y "c9b0f7fa9233bfe5807fe66fcf3a5617ed597d43" [
          (s."minimist@^1.2.5")
          ];
        "json5@^2.1.2" = s."json5@2.1.3";
        "leven@3.1.0" = f "leven" "3.1.0" y "77891de834064cccba82ae7842bb6b14a13ed7f2" [];
        "leven@^3.1.0" = s."leven@3.1.0";
        "levenary@1.1.1" = f "levenary" "1.1.1" y "842a9ee98d2075aa7faeedbe32679e9205f46f77" [
          (s."leven@^3.1.0")
          ];
        "levenary@^1.1.1" = s."levenary@1.1.1";
        "levn@0.3.0" = f "levn" "0.3.0" y "3b09924edf9f083c0490fdd4c0bc4421e04764ee" [
          (s."prelude-ls@~1.1.2")
          (s."type-check@~0.3.2")
          ];
        "levn@^0.3.0" = s."levn@0.3.0";
        "levn@~0.3.0" = s."levn@0.3.0";
        "lodash._reinterpolate@3.0.0" = f "lodash._reinterpolate" "3.0.0" y "0ccf2d89166af03b3663c796538b75ac6e114d9d" [];
        "lodash._reinterpolate@^3.0.0" = s."lodash._reinterpolate@3.0.0";
        "lodash.template@4.5.0" = f "lodash.template" "4.5.0" y "f976195cf3f347d0d5f52483569fe8031ccce8ab" [
          (s."lodash._reinterpolate@^3.0.0")
          (s."lodash.templatesettings@^4.0.0")
          ];
        "lodash.template@^4.5.0" = s."lodash.template@4.5.0";
        "lodash.templatesettings@4.2.0" = f "lodash.templatesettings" "4.2.0" y "e481310f049d3cf6d47e912ad09313b154f0fb33" [
          (s."lodash._reinterpolate@^3.0.0")
          ];
        "lodash.templatesettings@^4.0.0" = s."lodash.templatesettings@4.2.0";
        "lodash@4.17.20" = f "lodash" "4.17.20" y "b44a9b6297bcb698f1c51a3545a2b3b368d59c52" [];
        "lodash@^4.17.11" = s."lodash@4.17.20";
        "lodash@^4.17.12" = s."lodash@4.17.20";
        "lodash@^4.17.14" = s."lodash@4.17.20";
        "lodash@^4.17.19" = s."lodash@4.17.20";
        "loose-envify@1.4.0" = f "loose-envify" "1.4.0" y "71ee51fa7be4caec1a63839f7e682d8132d30caf" [
          (s."js-tokens@^3.0.0 || ^4.0.0")
          ];
        "loose-envify@^1.0.0" = s."loose-envify@1.4.0";
        "lru-cache@4.1.5" = f "lru-cache" "4.1.5" y "8bbe50ea85bed59bc9e33dcab8235ee9bcf443cd" [
          (s."pseudomap@^1.0.2")
          (s."yallist@^2.1.2")
          ];
        "lru-cache@^4.0.1" = s."lru-cache@4.1.5";
        "mimic-fn@1.2.0" = f "mimic-fn" "1.2.0" y "820c86a39334640e99516928bd03fca88057d022" [];
        "mimic-fn@^1.0.0" = s."mimic-fn@1.2.0";
        "minimatch@3.0.4" = f "minimatch" "3.0.4" y "5166e286457f03306064be5497e8dbb0c3d32083" [
          (s."brace-expansion@^1.1.7")
          ];
        "minimatch@^3.0.4" = s."minimatch@3.0.4";
        "minimist@1.2.5" = f "minimist" "1.2.5" y "67d66014b66a6a8aaa0c083c5fd58df4e4e97602" [];
        "minimist@^1.2.5" = s."minimist@1.2.5";
        "mkdirp@0.5.5" = f "mkdirp" "0.5.5" y "d91cefd62d1436ca0f41620e251288d420099def" [
          (s."minimist@^1.2.5")
          ];
        "mkdirp@^0.5.1" = s."mkdirp@0.5.5";
        "ms@2.1.2" = f "ms" "2.1.2" y "d09d1f357b443f493382a8eb3ccd183872ae6009" [];
        "mute-stream@0.0.7" = f "mute-stream" "0.0.7" y "3075ce93bc21b8fab43e1bc4da7e8115ed1e7bab" [];
        "natural-compare@1.4.0" = f "natural-compare" "1.4.0" y "4abebfeed7541f2c27acfb29bdbbd15c8d5ba4f7" [];
        "natural-compare@^1.4.0" = s."natural-compare@1.4.0";
        "nice-try@1.0.5" = f "nice-try" "1.0.5" y "a3378a7696ce7d223e88fc9b764bd7ef1089e366" [];
        "nice-try@^1.0.4" = s."nice-try@1.0.5";
        "node-releases@1.1.61" = f "node-releases" "1.1.61" y "707b0fca9ce4e11783612ba4a2fcba09047af16e" [];
        "node-releases@^1.1.61" = s."node-releases@1.1.61";
        "normalize-range@0.1.2" = f "normalize-range" "0.1.2" y "2d10c06bdfd312ea9777695a4d28439456b75942" [];
        "normalize-range@^0.1.2" = s."normalize-range@0.1.2";
        "num2fraction@1.2.2" = f "num2fraction" "1.2.2" y "6f682b6a027a4e9ddfa4564cd2589d1d4e669ede" [];
        "num2fraction@^1.2.2" = s."num2fraction@1.2.2";
        "object-inspect@1.8.0" = f "object-inspect" "1.8.0" y "df807e5ecf53a609cc6bfe93eac3cc7be5b3a9d0" [];
        "object-inspect@^1.8.0" = s."object-inspect@1.8.0";
        "object-keys@1.1.1" = f "object-keys" "1.1.1" y "1c47f272df277f3b1daf061677d9c82e2322c60e" [];
        "object-keys@^1.0.12" = s."object-keys@1.1.1";
        "object-keys@^1.1.1" = s."object-keys@1.1.1";
        "object.assign@4.1.1" = f "object.assign" "4.1.1" y "303867a666cdd41936ecdedfb1f8f3e32a478cdd" [
          (s."define-properties@^1.1.3")
          (s."has-symbols@^1.0.1")
          (s."object-keys@^1.1.1")
          ];
        "object.assign@^4.1.0" = s."object.assign@4.1.1";
        "object.assign@^4.1.1" = s."object.assign@4.1.1";
        "once@1.4.0" = f "once" "1.4.0" y "583b1aa775961d4b113ac17d9c50baef9dd76bd1" [
          (s."wrappy@1")
          ];
        "once@^1.3.0" = s."once@1.4.0";
        "onetime@2.0.1" = f "onetime" "2.0.1" y "067428230fd67443b2794b22bba528b6867962d4" [
          (s."mimic-fn@^1.0.0")
          ];
        "onetime@^2.0.0" = s."onetime@2.0.1";
        "optionator@0.8.3" = f "optionator" "0.8.3" y "84fa1d036fe9d3c7e21d99884b601167ec8fb495" [
          (s."deep-is@~0.1.3")
          (s."fast-levenshtein@~2.0.6")
          (s."levn@~0.3.0")
          (s."prelude-ls@~1.1.2")
          (s."type-check@~0.3.2")
          (s."word-wrap@~1.2.3")
          ];
        "optionator@^0.8.2" = s."optionator@0.8.3";
        "os-shim@0.1.3" = f "os-shim" "0.1.3" y "6b62c3791cf7909ea35ed46e17658bb417cb3917" [];
        "os-shim@^0.1.2" = s."os-shim@0.1.3";
        "os-tmpdir@1.0.2" = f "os-tmpdir" "1.0.2" y "bbe67406c79aa85c5cfec766fe5734555dfa1274" [];
        "os-tmpdir@~1.0.2" = s."os-tmpdir@1.0.2";
        "parent-module@1.0.1" = f "parent-module" "1.0.1" y "691d2709e78c79fae3a156622452d00762caaaa2" [
          (s."callsites@^3.0.0")
          ];
        "parent-module@^1.0.0" = s."parent-module@1.0.1";
        "path-is-absolute@1.0.1" = f "path-is-absolute" "1.0.1" y "174b9268735534ffbc7ace6bf53a5a9e1b5c5f5f" [];
        "path-is-absolute@^1.0.0" = s."path-is-absolute@1.0.1";
        "path-is-inside@1.0.2" = f "path-is-inside" "1.0.2" y "365417dede44430d1c11af61027facf074bdfc53" [];
        "path-is-inside@^1.0.2" = s."path-is-inside@1.0.2";
        "path-key@2.0.1" = f "path-key" "2.0.1" y "411cadb574c5a140d3a4b1910d40d80cc9f40b40" [];
        "path-key@^2.0.1" = s."path-key@2.0.1";
        "path-parse@1.0.6" = f "path-parse" "1.0.6" y "d62dbb5679405d72c4737ec58600e9ddcf06d24c" [];
        "path-parse@^1.0.6" = s."path-parse@1.0.6";
        "postcss-attribute-case-insensitive@4.0.2" = f "postcss-attribute-case-insensitive" "4.0.2" y "d93e46b504589e94ac7277b0463226c68041a880" [
          (s."postcss@^7.0.2")
          (s."postcss-selector-parser@^6.0.2")
          ];
        "postcss-attribute-case-insensitive@^4.0.1" = s."postcss-attribute-case-insensitive@4.0.2";
        "postcss-color-functional-notation@2.0.1" = f "postcss-color-functional-notation" "2.0.1" y "5efd37a88fbabeb00a2966d1e53d98ced93f74e0" [
          (s."postcss@^7.0.2")
          (s."postcss-values-parser@^2.0.0")
          ];
        "postcss-color-functional-notation@^2.0.1" = s."postcss-color-functional-notation@2.0.1";
        "postcss-color-gray@5.0.0" = f "postcss-color-gray" "5.0.0" y "532a31eb909f8da898ceffe296fdc1f864be8547" [
          (s."@csstools/convert-colors@^1.4.0")
          (s."postcss@^7.0.5")
          (s."postcss-values-parser@^2.0.0")
          ];
        "postcss-color-gray@^5.0.0" = s."postcss-color-gray@5.0.0";
        "postcss-color-hex-alpha@5.0.3" = f "postcss-color-hex-alpha" "5.0.3" y "a8d9ca4c39d497c9661e374b9c51899ef0f87388" [
          (s."postcss@^7.0.14")
          (s."postcss-values-parser@^2.0.1")
          ];
        "postcss-color-hex-alpha@^5.0.3" = s."postcss-color-hex-alpha@5.0.3";
        "postcss-color-mod-function@3.0.3" = f "postcss-color-mod-function" "3.0.3" y "816ba145ac11cc3cb6baa905a75a49f903e4d31d" [
          (s."@csstools/convert-colors@^1.4.0")
          (s."postcss@^7.0.2")
          (s."postcss-values-parser@^2.0.0")
          ];
        "postcss-color-mod-function@^3.0.3" = s."postcss-color-mod-function@3.0.3";
        "postcss-color-rebeccapurple@4.0.1" = f "postcss-color-rebeccapurple" "4.0.1" y "c7a89be872bb74e45b1e3022bfe5748823e6de77" [
          (s."postcss@^7.0.2")
          (s."postcss-values-parser@^2.0.0")
          ];
        "postcss-color-rebeccapurple@^4.0.1" = s."postcss-color-rebeccapurple@4.0.1";
        "postcss-custom-media@7.0.8" = f "postcss-custom-media" "7.0.8" y "fffd13ffeffad73621be5f387076a28b00294e0c" [
          (s."postcss@^7.0.14")
          ];
        "postcss-custom-media@^7.0.8" = s."postcss-custom-media@7.0.8";
        "postcss-custom-properties@8.0.11" = f "postcss-custom-properties" "8.0.11" y "2d61772d6e92f22f5e0d52602df8fae46fa30d97" [
          (s."postcss@^7.0.17")
          (s."postcss-values-parser@^2.0.1")
          ];
        "postcss-custom-properties@^8.0.11" = s."postcss-custom-properties@8.0.11";
        "postcss-custom-selectors@5.1.2" = f "postcss-custom-selectors" "5.1.2" y "64858c6eb2ecff2fb41d0b28c9dd7b3db4de7fba" [
          (s."postcss@^7.0.2")
          (s."postcss-selector-parser@^5.0.0-rc.3")
          ];
        "postcss-custom-selectors@^5.1.2" = s."postcss-custom-selectors@5.1.2";
        "postcss-dir-pseudo-class@5.0.0" = f "postcss-dir-pseudo-class" "5.0.0" y "6e3a4177d0edb3abcc85fdb6fbb1c26dabaeaba2" [
          (s."postcss@^7.0.2")
          (s."postcss-selector-parser@^5.0.0-rc.3")
          ];
        "postcss-dir-pseudo-class@^5.0.0" = s."postcss-dir-pseudo-class@5.0.0";
        "postcss-double-position-gradients@1.0.0" = f "postcss-double-position-gradients" "1.0.0" y "fc927d52fddc896cb3a2812ebc5df147e110522e" [
          (s."postcss@^7.0.5")
          (s."postcss-values-parser@^2.0.0")
          ];
        "postcss-double-position-gradients@^1.0.0" = s."postcss-double-position-gradients@1.0.0";
        "postcss-env-function@2.0.2" = f "postcss-env-function" "2.0.2" y "0f3e3d3c57f094a92c2baf4b6241f0b0da5365d7" [
          (s."postcss@^7.0.2")
          (s."postcss-values-parser@^2.0.0")
          ];
        "postcss-env-function@^2.0.2" = s."postcss-env-function@2.0.2";
        "postcss-focus-visible@4.0.0" = f "postcss-focus-visible" "4.0.0" y "477d107113ade6024b14128317ade2bd1e17046e" [
          (s."postcss@^7.0.2")
          ];
        "postcss-focus-visible@^4.0.0" = s."postcss-focus-visible@4.0.0";
        "postcss-focus-within@3.0.0" = f "postcss-focus-within" "3.0.0" y "763b8788596cee9b874c999201cdde80659ef680" [
          (s."postcss@^7.0.2")
          ];
        "postcss-focus-within@^3.0.0" = s."postcss-focus-within@3.0.0";
        "postcss-font-variant@4.0.0" = f "postcss-font-variant" "4.0.0" y "71dd3c6c10a0d846c5eda07803439617bbbabacc" [
          (s."postcss@^7.0.2")
          ];
        "postcss-font-variant@^4.0.0" = s."postcss-font-variant@4.0.0";
        "postcss-gap-properties@2.0.0" = f "postcss-gap-properties" "2.0.0" y "431c192ab3ed96a3c3d09f2ff615960f902c1715" [
          (s."postcss@^7.0.2")
          ];
        "postcss-gap-properties@^2.0.0" = s."postcss-gap-properties@2.0.0";
        "postcss-image-set-function@3.0.1" = f "postcss-image-set-function" "3.0.1" y "28920a2f29945bed4c3198d7df6496d410d3f288" [
          (s."postcss@^7.0.2")
          (s."postcss-values-parser@^2.0.0")
          ];
        "postcss-image-set-function@^3.0.1" = s."postcss-image-set-function@3.0.1";
        "postcss-initial@3.0.2" = f "postcss-initial" "3.0.2" y "f018563694b3c16ae8eaabe3c585ac6319637b2d" [
          (s."lodash.template@^4.5.0")
          (s."postcss@^7.0.2")
          ];
        "postcss-initial@^3.0.0" = s."postcss-initial@3.0.2";
        "postcss-lab-function@2.0.1" = f "postcss-lab-function" "2.0.1" y "bb51a6856cd12289ab4ae20db1e3821ef13d7d2e" [
          (s."@csstools/convert-colors@^1.4.0")
          (s."postcss@^7.0.2")
          (s."postcss-values-parser@^2.0.0")
          ];
        "postcss-lab-function@^2.0.1" = s."postcss-lab-function@2.0.1";
        "postcss-logical@3.0.0" = f "postcss-logical" "3.0.0" y "2495d0f8b82e9f262725f75f9401b34e7b45d5b5" [
          (s."postcss@^7.0.2")
          ];
        "postcss-logical@^3.0.0" = s."postcss-logical@3.0.0";
        "postcss-media-minmax@4.0.0" = f "postcss-media-minmax" "4.0.0" y "b75bb6cbc217c8ac49433e12f22048814a4f5ed5" [
          (s."postcss@^7.0.2")
          ];
        "postcss-media-minmax@^4.0.0" = s."postcss-media-minmax@4.0.0";
        "postcss-nesting@7.0.1" = f "postcss-nesting" "7.0.1" y "b50ad7b7f0173e5b5e3880c3501344703e04c052" [
          (s."postcss@^7.0.2")
          ];
        "postcss-nesting@^7.0.0" = s."postcss-nesting@7.0.1";
        "postcss-overflow-shorthand@2.0.0" = f "postcss-overflow-shorthand" "2.0.0" y "31ecf350e9c6f6ddc250a78f0c3e111f32dd4c30" [
          (s."postcss@^7.0.2")
          ];
        "postcss-overflow-shorthand@^2.0.0" = s."postcss-overflow-shorthand@2.0.0";
        "postcss-page-break@2.0.0" = f "postcss-page-break" "2.0.0" y "add52d0e0a528cabe6afee8b46e2abb277df46bf" [
          (s."postcss@^7.0.2")
          ];
        "postcss-page-break@^2.0.0" = s."postcss-page-break@2.0.0";
        "postcss-place@4.0.1" = f "postcss-place" "4.0.1" y "e9f39d33d2dc584e46ee1db45adb77ca9d1dcc62" [
          (s."postcss@^7.0.2")
          (s."postcss-values-parser@^2.0.0")
          ];
        "postcss-place@^4.0.1" = s."postcss-place@4.0.1";
        "postcss-pseudo-class-any-link@6.0.0" = f "postcss-pseudo-class-any-link" "6.0.0" y "2ed3eed393b3702879dec4a87032b210daeb04d1" [
          (s."postcss@^7.0.2")
          (s."postcss-selector-parser@^5.0.0-rc.3")
          ];
        "postcss-pseudo-class-any-link@^6.0.0" = s."postcss-pseudo-class-any-link@6.0.0";
        "postcss-replace-overflow-wrap@3.0.0" = f "postcss-replace-overflow-wrap" "3.0.0" y "61b360ffdaedca84c7c918d2b0f0d0ea559ab01c" [
          (s."postcss@^7.0.2")
          ];
        "postcss-replace-overflow-wrap@^3.0.0" = s."postcss-replace-overflow-wrap@3.0.0";
        "postcss-selector-matches@4.0.0" = f "postcss-selector-matches" "4.0.0" y "71c8248f917ba2cc93037c9637ee09c64436fcff" [
          (s."balanced-match@^1.0.0")
          (s."postcss@^7.0.2")
          ];
        "postcss-selector-matches@^4.0.0" = s."postcss-selector-matches@4.0.0";
        "postcss-selector-not@4.0.0" = f "postcss-selector-not" "4.0.0" y "c68ff7ba96527499e832724a2674d65603b645c0" [
          (s."balanced-match@^1.0.0")
          (s."postcss@^7.0.2")
          ];
        "postcss-selector-not@^4.0.0" = s."postcss-selector-not@4.0.0";
        "postcss-selector-parser@5.0.0" = f "postcss-selector-parser" "5.0.0" y "249044356697b33b64f1a8f7c80922dddee7195c" [
          (s."cssesc@^2.0.0")
          (s."indexes-of@^1.0.1")
          (s."uniq@^1.0.1")
          ];
        "postcss-selector-parser@6.0.4" = f "postcss-selector-parser" "6.0.4" y "56075a1380a04604c38b063ea7767a129af5c2b3" [
          (s."cssesc@^3.0.0")
          (s."indexes-of@^1.0.1")
          (s."uniq@^1.0.1")
          (s."util-deprecate@^1.0.2")
          ];
        "postcss-selector-parser@^5.0.0-rc.3" = s."postcss-selector-parser@5.0.0";
        "postcss-selector-parser@^5.0.0-rc.4" = s."postcss-selector-parser@5.0.0";
        "postcss-selector-parser@^6.0.2" = s."postcss-selector-parser@6.0.4";
        "postcss-simple-vars@5.0.2" = f "postcss-simple-vars" "5.0.2" y "e2f81b3d0847ddd4169816b6d141b91d51e6e22e" [
          (s."postcss@^7.0.14")
          ];
        "postcss-simple-vars@^5.0.2" = s."postcss-simple-vars@5.0.2";
        "postcss-tape@4.0.0" = f "postcss-tape" "4.0.0" y "7327bd9cfd12bab334b998b50d84d93fe907b46d" [];
        "postcss-tape@^4.0.0" = s."postcss-tape@4.0.0";
        "postcss-value-parser@4.1.0" = f "postcss-value-parser" "4.1.0" y "443f6a20ced6481a2bda4fa8532a6e55d789a2cb" [];
        "postcss-value-parser@^4.1.0" = s."postcss-value-parser@4.1.0";
        "postcss-values-parser@2.0.1" = f "postcss-values-parser" "2.0.1" y "da8b472d901da1e205b47bdc98637b9e9e550e5f" [
          (s."flatten@^1.0.2")
          (s."indexes-of@^1.0.1")
          (s."uniq@^1.0.1")
          ];
        "postcss-values-parser@^2.0.0" = s."postcss-values-parser@2.0.1";
        "postcss-values-parser@^2.0.1" = s."postcss-values-parser@2.0.1";
        "postcss@7.0.35" = f "postcss" "7.0.35" y "d2be00b998f7f211d8a276974079f2e92b970e24" [
          (s."chalk@^2.4.2")
          (s."source-map@^0.6.1")
          (s."supports-color@^6.1.0")
          ];
        "postcss@^7.0.14" = s."postcss@7.0.35";
        "postcss@^7.0.17" = s."postcss@7.0.35";
        "postcss@^7.0.2" = s."postcss@7.0.35";
        "postcss@^7.0.32" = s."postcss@7.0.35";
        "postcss@^7.0.5" = s."postcss@7.0.35";
        "postcss@^7.0.6" = s."postcss@7.0.35";
        "pre-commit@1.2.2" = f "pre-commit" "1.2.2" y "dbcee0ee9de7235e57f79c56d7ce94641a69eec6" [
          (s."cross-spawn@^5.0.1")
          (s."spawn-sync@^1.0.15")
          (s."which@1.2.x")
          ];
        "pre-commit@^1.2.2" = s."pre-commit@1.2.2";
        "prelude-ls@1.1.2" = f "prelude-ls" "1.1.2" y "21932a549f5e52ffd9a827f570e04be62a97da54" [];
        "prelude-ls@~1.1.2" = s."prelude-ls@1.1.2";
        "process-nextick-args@2.0.1" = f "process-nextick-args" "2.0.1" y "7820d9b16120cc55ca9ae7792680ae7dba6d7fe2" [];
        "process-nextick-args@~2.0.0" = s."process-nextick-args@2.0.1";
        "progress@2.0.3" = f "progress" "2.0.3" y "7e8cf8d8f5b8f239c1bc68beb4eb78567d572ef8" [];
        "progress@^2.0.0" = s."progress@2.0.3";
        "pseudomap@1.0.2" = f "pseudomap" "1.0.2" y "f052a28da70e618917ef0a8ac34c1ae5a68286b3" [];
        "pseudomap@^1.0.2" = s."pseudomap@1.0.2";
        "punycode@2.1.1" = f "punycode" "2.1.1" y "b58b010ac40c22c5657616c8d2c2c02c7bf479ec" [];
        "punycode@^2.1.0" = s."punycode@2.1.1";
        "readable-stream@2.3.7" = f "readable-stream" "2.3.7" y "1eca1cf711aef814c04f62252a36a62f6cb23b57" [
          (s."core-util-is@~1.0.0")
          (s."inherits@~2.0.3")
          (s."isarray@~1.0.0")
          (s."process-nextick-args@~2.0.0")
          (s."safe-buffer@~5.1.1")
          (s."string_decoder@~1.1.1")
          (s."util-deprecate@~1.0.1")
          ];
        "readable-stream@^2.2.2" = s."readable-stream@2.3.7";
        "regenerate-unicode-properties@8.2.0" = f "regenerate-unicode-properties" "8.2.0" y "e5de7111d655e7ba60c057dbe9ff37c87e65cdec" [
          (s."regenerate@^1.4.0")
          ];
        "regenerate-unicode-properties@^8.2.0" = s."regenerate-unicode-properties@8.2.0";
        "regenerate@1.4.1" = f "regenerate" "1.4.1" y "cad92ad8e6b591773485fbe05a485caf4f457e6f" [];
        "regenerate@^1.4.0" = s."regenerate@1.4.1";
        "regenerator-runtime@0.13.7" = f "regenerator-runtime" "0.13.7" y "cac2dacc8a1ea675feaabaeb8ae833898ae46f55" [];
        "regenerator-runtime@^0.13.4" = s."regenerator-runtime@0.13.7";
        "regenerator-transform@0.14.5" = f "regenerator-transform" "0.14.5" y "c98da154683671c9c4dcb16ece736517e1b7feb4" [
          (s."@babel/runtime@^7.8.4")
          ];
        "regenerator-transform@^0.14.2" = s."regenerator-transform@0.14.5";
        "regexpp@2.0.1" = f "regexpp" "2.0.1" y "8d19d31cf632482b589049f8281f93dbcba4d07f" [];
        "regexpp@^2.0.1" = s."regexpp@2.0.1";
        "regexpu-core@4.7.1" = f "regexpu-core" "4.7.1" y "2dea5a9a07233298fbf0db91fa9abc4c6e0f8ad6" [
          (s."regenerate@^1.4.0")
          (s."regenerate-unicode-properties@^8.2.0")
          (s."regjsgen@^0.5.1")
          (s."regjsparser@^0.6.4")
          (s."unicode-match-property-ecmascript@^1.0.4")
          (s."unicode-match-property-value-ecmascript@^1.2.0")
          ];
        "regexpu-core@^4.7.0" = s."regexpu-core@4.7.1";
        "regjsgen@0.5.2" = f "regjsgen" "0.5.2" y "92ff295fb1deecbf6ecdab2543d207e91aa33733" [];
        "regjsgen@^0.5.1" = s."regjsgen@0.5.2";
        "regjsparser@0.6.4" = f "regjsparser" "0.6.4" y "a769f8684308401a66e9b529d2436ff4d0666272" [
          (s."jsesc@~0.5.0")
          ];
        "regjsparser@^0.6.4" = s."regjsparser@0.6.4";
        "resolve-from@4.0.0" = f "resolve-from" "4.0.0" y "4abcd852ad32dd7baabfe9b40e00a36db5f392e6" [];
        "resolve-from@^4.0.0" = s."resolve-from@4.0.0";
        "resolve@1.17.0" = f "resolve" "1.17.0" y "b25941b54968231cc2d1bb76a79cb7f2c0bf8444" [
          (s."path-parse@^1.0.6")
          ];
        "resolve@^1.12.0" = s."resolve@1.17.0";
        "resolve@^1.3.2" = s."resolve@1.17.0";
        "restore-cursor@2.0.0" = f "restore-cursor" "2.0.0" y "9f7ee287f82fd326d4fd162923d62129eee0dfaf" [
          (s."onetime@^2.0.0")
          (s."signal-exit@^3.0.2")
          ];
        "restore-cursor@^2.0.0" = s."restore-cursor@2.0.0";
        "rimraf@2.6.3" = f "rimraf" "2.6.3" y "b2d104fe0d8fb27cf9e0a1cda8262dd3833c6cab" [
          (s."glob@^7.1.3")
          ];
        "rollup-plugin-babel@4.4.0" = f "rollup-plugin-babel" "4.4.0" y "d15bd259466a9d1accbdb2fe2fff17c52d030acb" [
          (s."@babel/helper-module-imports@^7.0.0")
          (s."rollup-pluginutils@^2.8.1")
          ];
        "rollup-plugin-babel@^4.3.3" = s."rollup-plugin-babel@4.4.0";
        "rollup-pluginutils@2.8.2" = f "rollup-pluginutils" "2.8.2" y "72f2af0748b592364dbd3389e600e5a9444a351e" [
          (s."estree-walker@^0.6.1")
          ];
        "rollup-pluginutils@^2.8.1" = s."rollup-pluginutils@2.8.2";
        "rollup@1.32.1" = f "rollup" "1.32.1" y "4480e52d9d9e2ae4b46ba0d9ddeaf3163940f9c4" [
          (s."@types/estree@*")
          (s."@types/node@*")
          (s."acorn@^7.1.0")
          ];
        "rollup@^1.16.6" = s."rollup@1.32.1";
        "run-async@2.4.1" = f "run-async" "2.4.1" y "8440eccf99ea3e70bd409d49aab88e10c189a455" [];
        "run-async@^2.2.0" = s."run-async@2.4.1";
        "rxjs@6.6.3" = f "rxjs" "6.6.3" y "8ca84635c4daa900c0d3967a6ee7ac60271ee552" [
          (s."tslib@^1.9.0")
          ];
        "rxjs@^6.4.0" = s."rxjs@6.6.3";
        "safe-buffer@5.1.2" = f "safe-buffer" "5.1.2" y "991ec69d296e0313747d59bdfd2b745c35f8828d" [];
        "safe-buffer@~5.1.0" = s."safe-buffer@5.1.2";
        "safe-buffer@~5.1.1" = s."safe-buffer@5.1.2";
        "safer-buffer@2.1.2" = f "safer-buffer" "2.1.2" y "44fa161b0187b9549dd84bb91802f9bd8385cd6a" [];
        "safer-buffer@>= 2.1.2 < 3" = s."safer-buffer@2.1.2";
        "semver@5.7.1" = f "semver" "5.7.1" y "a954f931aeba508d307bbf069eff0c01c96116f7" [];
        "semver@7.0.0" = f "semver" "7.0.0" y "5f3ca35761e47e05b206c6daff2cf814f0316b8e" [];
        "semver@^5.4.1" = s."semver@5.7.1";
        "semver@^5.5.0" = s."semver@5.7.1";
        "semver@^5.5.1" = s."semver@5.7.1";
        "shebang-command@1.2.0" = f "shebang-command" "1.2.0" y "44aac65b695b03398968c39f363fee5deafdf1ea" [
          (s."shebang-regex@^1.0.0")
          ];
        "shebang-command@^1.2.0" = s."shebang-command@1.2.0";
        "shebang-regex@1.0.0" = f "shebang-regex" "1.0.0" y "da42f49740c0b42db2ca9728571cb190c98efea3" [];
        "shebang-regex@^1.0.0" = s."shebang-regex@1.0.0";
        "signal-exit@3.0.3" = f "signal-exit" "3.0.3" y "a1410c2edd8f077b08b4e253c8eacfcaf057461c" [];
        "signal-exit@^3.0.2" = s."signal-exit@3.0.3";
        "slice-ansi@2.1.0" = f "slice-ansi" "2.1.0" y "cacd7693461a637a5788d92a7dd4fba068e81636" [
          (s."ansi-styles@^3.2.0")
          (s."astral-regex@^1.0.0")
          (s."is-fullwidth-code-point@^2.0.0")
          ];
        "slice-ansi@^2.1.0" = s."slice-ansi@2.1.0";
        "source-map@0.5.7" = f "source-map" "0.5.7" y "8a039d2d1021d22d1ea14c80d8ea468ba2ef3fcc" [];
        "source-map@0.6.1" = f "source-map" "0.6.1" y "74722af32e9614e9c287a8d0bbde48b5e2f1a263" [];
        "source-map@^0.5.0" = s."source-map@0.5.7";
        "source-map@^0.6.1" = s."source-map@0.6.1";
        "spawn-sync@1.0.15" = f "spawn-sync" "1.0.15" y "b00799557eb7fb0c8376c29d44e8a1ea67e57476" [
          (s."concat-stream@^1.4.7")
          (s."os-shim@^0.1.2")
          ];
        "spawn-sync@^1.0.15" = s."spawn-sync@1.0.15";
        "sprintf-js@1.0.3" = f "sprintf-js" "1.0.3" y "04e6926f662895354f3dd015203633b857297e2c" [];
        "sprintf-js@~1.0.2" = s."sprintf-js@1.0.3";
        "string-width@2.1.1" = f "string-width" "2.1.1" y "ab93f27a8dc13d28cac815c462143a6d9012ae9e" [
          (s."is-fullwidth-code-point@^2.0.0")
          (s."strip-ansi@^4.0.0")
          ];
        "string-width@3.1.0" = f "string-width" "3.1.0" y "22767be21b62af1081574306f69ac51b62203961" [
          (s."emoji-regex@^7.0.1")
          (s."is-fullwidth-code-point@^2.0.0")
          (s."strip-ansi@^5.1.0")
          ];
        "string-width@^2.1.0" = s."string-width@2.1.1";
        "string-width@^3.0.0" = s."string-width@3.1.0";
        "string.prototype.trimend@1.0.1" = f "string.prototype.trimend" "1.0.1" y "85812a6b847ac002270f5808146064c995fb6913" [
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.17.5")
          ];
        "string.prototype.trimend@^1.0.1" = s."string.prototype.trimend@1.0.1";
        "string.prototype.trimstart@1.0.1" = f "string.prototype.trimstart" "1.0.1" y "14af6d9f34b053f7cfc89b72f8f2ee14b9039a54" [
          (s."define-properties@^1.1.3")
          ];
        "string.prototype.trimstart@^1.0.1" = s."string.prototype.trimstart@1.0.1";
        "string_decoder@1.1.1" = f "string_decoder" "1.1.1" y "9cf1611ba62685d7030ae9e4ba34149c3af03fc8" [
          (s."safe-buffer@~5.1.0")
          ];
        "string_decoder@~1.1.1" = s."string_decoder@1.1.1";
        "strip-ansi@4.0.0" = f "strip-ansi" "4.0.0" y "a8479022eb1ac368a871389b635262c505ee368f" [
          (s."ansi-regex@^3.0.0")
          ];
        "strip-ansi@5.2.0" = f "strip-ansi" "5.2.0" y "8c9a536feb6afc962bdfa5b104a5091c1ad9c0ae" [
          (s."ansi-regex@^4.1.0")
          ];
        "strip-ansi@^4.0.0" = s."strip-ansi@4.0.0";
        "strip-ansi@^5.1.0" = s."strip-ansi@5.2.0";
        "strip-json-comments@2.0.1" = f "strip-json-comments" "2.0.1" y "3c531942e908c2697c0ec344858c286c7ca0a60a" [];
        "strip-json-comments@^2.0.1" = s."strip-json-comments@2.0.1";
        "supports-color@5.5.0" = f "supports-color" "5.5.0" y "e2e69a44ac8772f78a1ec0b35b689df6530efc8f" [
          (s."has-flag@^3.0.0")
          ];
        "supports-color@6.1.0" = f "supports-color" "6.1.0" y "0764abc69c63d5ac842dd4867e8d025e880df8f3" [
          (s."has-flag@^3.0.0")
          ];
        "supports-color@^5.3.0" = s."supports-color@5.5.0";
        "supports-color@^6.1.0" = s."supports-color@6.1.0";
        "table@5.4.6" = f "table" "5.4.6" y "1292d19500ce3f86053b05f0e8e7e4a3bb21079e" [
          (s."ajv@^6.10.2")
          (s."lodash@^4.17.14")
          (s."slice-ansi@^2.1.0")
          (s."string-width@^3.0.0")
          ];
        "table@^5.2.3" = s."table@5.4.6";
        "text-table@0.2.0" = f "text-table" "0.2.0" y "7f5ee823ae805207c00af2df4a84ec3fcfa570b4" [];
        "text-table@^0.2.0" = s."text-table@0.2.0";
        "through@2.3.8" = f "through" "2.3.8" y "0dd4c9ffaabc357960b1b724115d7e0e86a2e1f5" [];
        "through@^2.3.6" = s."through@2.3.8";
        "tmp@0.0.33" = f "tmp" "0.0.33" y "6d34335889768d21b2bcda0aa277ced3b1bfadf9" [
          (s."os-tmpdir@~1.0.2")
          ];
        "tmp@^0.0.33" = s."tmp@0.0.33";
        "to-fast-properties@2.0.0" = f "to-fast-properties" "2.0.0" y "dc5e698cbd079265bc73e0377681a4e4e83f616e" [];
        "to-fast-properties@^2.0.0" = s."to-fast-properties@2.0.0";
        "tslib@1.14.0" = f "tslib" "1.14.0" y "d624983f3e2c5e0b55307c3dd6c86acd737622c6" [];
        "tslib@^1.9.0" = s."tslib@1.14.0";
        "type-check@0.3.2" = f "type-check" "0.3.2" y "5884cab512cf1d355e3fb784f30804b2b520db72" [
          (s."prelude-ls@~1.1.2")
          ];
        "type-check@~0.3.2" = s."type-check@0.3.2";
        "typedarray@0.0.6" = f "typedarray" "0.0.6" y "867ac74e3864187b1d3d47d996a78ec5c8830777" [];
        "typedarray@^0.0.6" = s."typedarray@0.0.6";
        "unicode-canonical-property-names-ecmascript@1.0.4" = f "unicode-canonical-property-names-ecmascript" "1.0.4" y "2619800c4c825800efdd8343af7dd9933cbe2818" [];
        "unicode-canonical-property-names-ecmascript@^1.0.4" = s."unicode-canonical-property-names-ecmascript@1.0.4";
        "unicode-match-property-ecmascript@1.0.4" = f "unicode-match-property-ecmascript" "1.0.4" y "8ed2a32569961bce9227d09cd3ffbb8fed5f020c" [
          (s."unicode-canonical-property-names-ecmascript@^1.0.4")
          (s."unicode-property-aliases-ecmascript@^1.0.4")
          ];
        "unicode-match-property-ecmascript@^1.0.4" = s."unicode-match-property-ecmascript@1.0.4";
        "unicode-match-property-value-ecmascript@1.2.0" = f "unicode-match-property-value-ecmascript" "1.2.0" y "0d91f600eeeb3096aa962b1d6fc88876e64ea531" [];
        "unicode-match-property-value-ecmascript@^1.2.0" = s."unicode-match-property-value-ecmascript@1.2.0";
        "unicode-property-aliases-ecmascript@1.1.0" = f "unicode-property-aliases-ecmascript" "1.1.0" y "dd57a99f6207bedff4628abefb94c50db941c8f4" [];
        "unicode-property-aliases-ecmascript@^1.0.4" = s."unicode-property-aliases-ecmascript@1.1.0";
        "uniq@1.0.1" = f "uniq" "1.0.1" y "b31c5ae8254844a3a8281541ce2b04b865a734ff" [];
        "uniq@^1.0.1" = s."uniq@1.0.1";
        "uri-js@4.4.0" = f "uri-js" "4.4.0" y "aa714261de793e8a82347a7bcc9ce74e86f28602" [
          (s."punycode@^2.1.0")
          ];
        "uri-js@^4.2.2" = s."uri-js@4.4.0";
        "util-deprecate@1.0.2" = f "util-deprecate" "1.0.2" y "450d4dc9fa70de732762fbd2d4a28981419a0ccf" [];
        "util-deprecate@^1.0.2" = s."util-deprecate@1.0.2";
        "util-deprecate@~1.0.1" = s."util-deprecate@1.0.2";
        "which@1.2.14" = f "which" "1.2.14" y "9a87c4378f03e827cecaf1acdf56c736c01c14e5" [
          (s."isexe@^2.0.0")
          ];
        "which@1.2.x" = s."which@1.2.14";
        "which@1.3.1" = f "which" "1.3.1" y "a45043d54f5805316da8d62f9f50918d3da70b0a" [
          (s."isexe@^2.0.0")
          ];
        "which@^1.2.9" = s."which@1.3.1";
        "word-wrap@1.2.3" = f "word-wrap" "1.2.3" y "610636f6b1f703891bd34771ccb17fb93b47079c" [];
        "word-wrap@~1.2.3" = s."word-wrap@1.2.3";
        "wrappy@1" = s."wrappy@1.0.2";
        "wrappy@1.0.2" = f "wrappy" "1.0.2" y "b5243d8f3ec1aa35f1364605bc0d1036e30ab69f" [];
        "write@1.0.3" = f "write" "1.0.3" y "0800e14523b923a387e415123c865616aae0f5c3" [
          (s."mkdirp@^0.5.1")
          ];
        "yallist@2.1.2" = f "yallist" "2.1.2" y "1c11f9218f076089a47dd512f93c6699a6a81d52" [];
        "yallist@^2.1.2" = s."yallist@2.1.2";
        }