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
        "@types/q@1.5.1" = f (sc "types" "q") "1.5.1" (ir "https://registry.yarnpkg.com/@types/q/-/q-1.5.1.tgz") "48fd98c1561fe718b61733daed46ff115b496e18" [];
        "@types/q@^1.5.1" = s."@types/q@1.5.1";
        "abbrev@1" = s."abbrev@1.1.1";
        "abbrev@1.1.1" = f "abbrev" "1.1.1" y "f8f2c887ad10bf67f634f005b6987fed3179aac8" [];
        "acorn-dynamic-import@2.0.2" = f "acorn-dynamic-import" "2.0.2" y "c752bd210bef679501b6c6cb7fc84f8f47158cc4" [
          (s."acorn@^4.0.3")
          ];
        "acorn-dynamic-import@^2.0.0" = s."acorn-dynamic-import@2.0.2";
        "acorn@4.0.13" = f "acorn" "4.0.13" y "105495ae5361d697bd195c825192e1ad7f253787" [];
        "acorn@5.7.3" = f "acorn" "5.7.3" y "67aa231bf8812974b85235a96771eb6bd07ea279" [];
        "acorn@^4.0.3" = s."acorn@4.0.13";
        "acorn@^5.0.0" = s."acorn@5.7.3";
        "ajv-keywords@1.5.1" = f "ajv-keywords" "1.5.1" y "314dd0a4b3368fad3dfcdc54ede6171b886daf3c" [];
        "ajv-keywords@^1.1.1" = s."ajv-keywords@1.5.1";
        "ajv@4.11.8" = f "ajv" "4.11.8" y "82ffb02b29e662ae53bdc20af15947706739c536" [
          (s."co@^4.6.0")
          (s."json-stable-stringify@^1.0.1")
          ];
        "ajv@^4.7.0" = s."ajv@4.11.8";
        "align-text@0.1.4" = f "align-text" "0.1.4" y "0cd90a561093f35d0a99256c22b7069433fad117" [
          (s."kind-of@^3.0.2")
          (s."longest@^1.0.1")
          (s."repeat-string@^1.5.2")
          ];
        "align-text@^0.1.1" = s."align-text@0.1.4";
        "align-text@^0.1.3" = s."align-text@0.1.4";
        "alphanum-sort@1.0.2" = f "alphanum-sort" "1.0.2" y "97a1119649b211ad33691d9f9f486a8ec9fbe0a3" [];
        "alphanum-sort@^1.0.0" = s."alphanum-sort@1.0.2";
        "amdefine@1.0.1" = f "amdefine" "1.0.1" y "4a5282ac164729e93619bcfd3ad151f817ce91f5" [];
        "amdefine@>=0.0.4" = s."amdefine@1.0.1";
        "ansi-regex@2.1.1" = f "ansi-regex" "2.1.1" y "c3b33ab5ee360d86e0e628f0468ae7ef27d654df" [];
        "ansi-regex@3.0.0" = f "ansi-regex" "3.0.0" y "ed0317c322064f79466c02966bddb605ab37d998" [];
        "ansi-regex@^2.0.0" = s."ansi-regex@2.1.1";
        "ansi-regex@^3.0.0" = s."ansi-regex@3.0.0";
        "ansi-styles@2.2.1" = f "ansi-styles" "2.2.1" y "b432dd3358b634cf75e1e4664368240533c1ddbe" [];
        "ansi-styles@3.2.1" = f "ansi-styles" "3.2.1" y "41fbb20243e50b12be0f04b8dedbf07520ce841d" [
          (s."color-convert@^1.9.0")
          ];
        "ansi-styles@^2.2.1" = s."ansi-styles@2.2.1";
        "ansi-styles@^3.2.1" = s."ansi-styles@3.2.1";
        "anymatch@1.3.2" = f "anymatch" "1.3.2" y "553dcb8f91e3c889845dfdba34c77721b90b9d7a" [
          (s."micromatch@^2.1.5")
          (s."normalize-path@^2.0.0")
          ];
        "anymatch@2.0.0" = f "anymatch" "2.0.0" y "bcb24b4f37934d9aa7ac17b4adaf89e7c76ef2eb" [
          (s."micromatch@^3.1.4")
          (s."normalize-path@^2.1.1")
          ];
        "anymatch@^1.3.0" = s."anymatch@1.3.2";
        "anymatch@^2.0.0" = s."anymatch@2.0.0";
        "aproba@1.2.0" = f "aproba" "1.2.0" y "6802e6264efd18c790a1b0d517f0f2627bf2c94a" [];
        "aproba@^1.0.3" = s."aproba@1.2.0";
        "are-we-there-yet@1.1.5" = f "are-we-there-yet" "1.1.5" y "4b35c2944f062a8bfcda66410760350fe9ddfc21" [
          (s."delegates@^1.0.0")
          (s."readable-stream@^2.0.6")
          ];
        "are-we-there-yet@~1.1.2" = s."are-we-there-yet@1.1.5";
        "argparse@1.0.10" = f "argparse" "1.0.10" y "bcd6791ea5ae09725e17e5ad988134cd40b3d911" [
          (s."sprintf-js@~1.0.2")
          ];
        "argparse@^1.0.7" = s."argparse@1.0.10";
        "arr-diff@2.0.0" = f "arr-diff" "2.0.0" y "8f3b827f955a8bd669697e4a4256ac3ceae356cf" [
          (s."arr-flatten@^1.0.1")
          ];
        "arr-diff@4.0.0" = f "arr-diff" "4.0.0" y "d6461074febfec71e7e15235761a329a5dc7c520" [];
        "arr-diff@^2.0.0" = s."arr-diff@2.0.0";
        "arr-diff@^4.0.0" = s."arr-diff@4.0.0";
        "arr-flatten@1.1.0" = f "arr-flatten" "1.1.0" y "36048bbff4e7b47e136644316c99669ea5ae91f1" [];
        "arr-flatten@^1.0.1" = s."arr-flatten@1.1.0";
        "arr-flatten@^1.1.0" = s."arr-flatten@1.1.0";
        "arr-union@3.1.0" = f "arr-union" "3.1.0" y "e39b09aea9def866a8f206e288af63919bae39c4" [];
        "arr-union@^3.1.0" = s."arr-union@3.1.0";
        "array-to-sentence@2.0.0" = f "array-to-sentence" "2.0.0" y "1e57691fdc18ba24a47e3ebabda9324baac960b4" [];
        "array-to-sentence@^2.0.0" = s."array-to-sentence@2.0.0";
        "array-unique@0.2.1" = f "array-unique" "0.2.1" y "a1d97ccafcbc2625cc70fadceb36a50c58b01a53" [];
        "array-unique@0.3.2" = f "array-unique" "0.3.2" y "a894b75d4bc4f6cd679ef3244a9fd8f46ae2d428" [];
        "array-unique@^0.2.1" = s."array-unique@0.2.1";
        "array-unique@^0.3.2" = s."array-unique@0.3.2";
        "asn1.js@4.10.1" = f "asn1.js" "4.10.1" y "b9c2bf5805f1e64aadeed6df3a2bfafb5a73f5a0" [
          (s."bn.js@^4.0.0")
          (s."inherits@^2.0.1")
          (s."minimalistic-assert@^1.0.0")
          ];
        "asn1.js@^4.0.0" = s."asn1.js@4.10.1";
        "assert@1.4.1" = f "assert" "1.4.1" y "99912d591836b5a6f5b345c0f07eefc08fc65d91" [
          (s."util@0.10.3")
          ];
        "assert@^1.1.1" = s."assert@1.4.1";
        "assign-symbols@1.0.0" = f "assign-symbols" "1.0.0" y "59667f41fadd4f20ccbc2bb96b8d4f7f78ec0367" [];
        "assign-symbols@^1.0.0" = s."assign-symbols@1.0.0";
        "async-each@1.0.1" = f "async-each" "1.0.1" y "19d386a1d9edc6e7c1c85d388aedbcc56d33602d" [];
        "async-each@^1.0.0" = s."async-each@1.0.1";
        "async-each@^1.0.1" = s."async-each@1.0.1";
        "async@2.6.1" = f "async" "2.6.1" y "b245a23ca71930044ec53fa46aa00a3e87c6a610" [
          (s."lodash@^4.17.10")
          ];
        "async@^2.1.2" = s."async@2.6.1";
        "atob@2.1.2" = f "atob" "2.1.2" y "6d9517eb9e030d2436666651e86bd9f6f13533c9" [];
        "atob@^2.1.1" = s."atob@2.1.2";
        "autoprefixer@9.4.7" = f "autoprefixer" "9.4.7" y "f997994f9a810eae47b38fa6d8a119772051c4ff" [
          (s."browserslist@^4.4.1")
          (s."caniuse-lite@^1.0.30000932")
          (s."normalize-range@^0.1.2")
          (s."num2fraction@^1.2.2")
          (s."postcss@^7.0.14")
          (s."postcss-value-parser@^3.3.1")
          ];
        "autoprefixer@^9.4.7" = s."autoprefixer@9.4.7";
        "b3b@0.0.1" = f "b3b" "0.0.1" y "ff69f8a58d891ac732b20175e47546799754ef9b" [];
        "babel-cli@6.26.0" = f "babel-cli" "6.26.0" y "502ab54874d7db88ad00b887a06383ce03d002f1" [
          (s."babel-core@^6.26.0")
          (s."babel-polyfill@^6.26.0")
          (s."babel-register@^6.26.0")
          (s."babel-runtime@^6.26.0")
          (s."commander@^2.11.0")
          (s."convert-source-map@^1.5.0")
          (s."fs-readdir-recursive@^1.0.0")
          (s."glob@^7.1.2")
          (s."lodash@^4.17.4")
          (s."output-file-sync@^1.1.2")
          (s."path-is-absolute@^1.0.1")
          (s."slash@^1.0.0")
          (s."source-map@^0.5.6")
          (s."v8flags@^2.1.1")
          (s."chokidar@^1.6.1")
          ];
        "babel-cli@^6.0.0" = s."babel-cli@6.26.0";
        "babel-code-frame@6.26.0" = f "babel-code-frame" "6.26.0" y "63fd43f7dc1e3bb7ce35947db8fe369a3f58c74b" [
          (s."chalk@^1.1.3")
          (s."esutils@^2.0.2")
          (s."js-tokens@^3.0.2")
          ];
        "babel-code-frame@^6.26.0" = s."babel-code-frame@6.26.0";
        "babel-core@6.26.3" = f "babel-core" "6.26.3" y "b2e2f09e342d0f0c88e2f02e067794125e75c207" [
          (s."babel-code-frame@^6.26.0")
          (s."babel-generator@^6.26.0")
          (s."babel-helpers@^6.24.1")
          (s."babel-messages@^6.23.0")
          (s."babel-register@^6.26.0")
          (s."babel-runtime@^6.26.0")
          (s."babel-template@^6.26.0")
          (s."babel-traverse@^6.26.0")
          (s."babel-types@^6.26.0")
          (s."babylon@^6.18.0")
          (s."convert-source-map@^1.5.1")
          (s."debug@^2.6.9")
          (s."json5@^0.5.1")
          (s."lodash@^4.17.4")
          (s."minimatch@^3.0.4")
          (s."path-is-absolute@^1.0.1")
          (s."private@^0.1.8")
          (s."slash@^1.0.0")
          (s."source-map@^0.5.7")
          ];
        "babel-core@^6.0.0" = s."babel-core@6.26.3";
        "babel-core@^6.26.0" = s."babel-core@6.26.3";
        "babel-generator@6.26.1" = f "babel-generator" "6.26.1" y "1844408d3b8f0d35a404ea7ac180f087a601bd90" [
          (s."babel-messages@^6.23.0")
          (s."babel-runtime@^6.26.0")
          (s."babel-types@^6.26.0")
          (s."detect-indent@^4.0.0")
          (s."jsesc@^1.3.0")
          (s."lodash@^4.17.4")
          (s."source-map@^0.5.7")
          (s."trim-right@^1.0.1")
          ];
        "babel-generator@^6.26.0" = s."babel-generator@6.26.1";
        "babel-helpers@6.24.1" = f "babel-helpers" "6.24.1" y "3471de9caec388e5c850e597e58a26ddf37602b2" [
          (s."babel-runtime@^6.22.0")
          (s."babel-template@^6.24.1")
          ];
        "babel-helpers@^6.24.1" = s."babel-helpers@6.24.1";
        "babel-loader@7.1.5" = f "babel-loader" "7.1.5" y "e3ee0cd7394aa557e013b02d3e492bfd07aa6d68" [
          (s."find-cache-dir@^1.0.0")
          (s."loader-utils@^1.0.2")
          (s."mkdirp@^0.5.1")
          ];
        "babel-loader@^7.0.0" = s."babel-loader@7.1.5";
        "babel-messages@6.23.0" = f "babel-messages" "6.23.0" y "f3cdf4703858035b2a2951c6ec5edf6c62f2630e" [
          (s."babel-runtime@^6.22.0")
          ];
        "babel-messages@^6.23.0" = s."babel-messages@6.23.0";
        "babel-polyfill@6.26.0" = f "babel-polyfill" "6.26.0" y "379937abc67d7895970adc621f284cd966cf2153" [
          (s."babel-runtime@^6.26.0")
          (s."core-js@^2.5.0")
          (s."regenerator-runtime@^0.10.5")
          ];
        "babel-polyfill@^6.26.0" = s."babel-polyfill@6.26.0";
        "babel-register@6.26.0" = f "babel-register" "6.26.0" y "6ed021173e2fcb486d7acb45c6009a856f647071" [
          (s."babel-runtime@^6.26.0")
          (s."core-js@^2.5.0")
          (s."home-or-tmp@^2.0.0")
          (s."lodash@^4.17.4")
          (s."mkdirp@^0.5.1")
          (s."source-map-support@^0.4.15")
          ];
        "babel-register@^6.26.0" = s."babel-register@6.26.0";
        "babel-runtime@6.26.0" = f "babel-runtime" "6.26.0" y "965c7058668e82b55d7bfe04ff2337bc8b5647fe" [
          (s."core-js@^2.4.0")
          (s."regenerator-runtime@^0.11.0")
          ];
        "babel-runtime@^6.22.0" = s."babel-runtime@6.26.0";
        "babel-runtime@^6.26.0" = s."babel-runtime@6.26.0";
        "babel-template@6.26.0" = f "babel-template" "6.26.0" y "de03e2d16396b069f46dd9fff8521fb1a0e35e02" [
          (s."babel-runtime@^6.26.0")
          (s."babel-traverse@^6.26.0")
          (s."babel-types@^6.26.0")
          (s."babylon@^6.18.0")
          (s."lodash@^4.17.4")
          ];
        "babel-template@^6.24.1" = s."babel-template@6.26.0";
        "babel-template@^6.26.0" = s."babel-template@6.26.0";
        "babel-traverse@6.26.0" = f "babel-traverse" "6.26.0" y "46a9cbd7edcc62c8e5c064e2d2d8d0f4035766ee" [
          (s."babel-code-frame@^6.26.0")
          (s."babel-messages@^6.23.0")
          (s."babel-runtime@^6.26.0")
          (s."babel-types@^6.26.0")
          (s."babylon@^6.18.0")
          (s."debug@^2.6.8")
          (s."globals@^9.18.0")
          (s."invariant@^2.2.2")
          (s."lodash@^4.17.4")
          ];
        "babel-traverse@^6.26.0" = s."babel-traverse@6.26.0";
        "babel-types@6.26.0" = f "babel-types" "6.26.0" y "a3b073f94ab49eb6fa55cd65227a334380632497" [
          (s."babel-runtime@^6.26.0")
          (s."esutils@^2.0.2")
          (s."lodash@^4.17.4")
          (s."to-fast-properties@^1.0.3")
          ];
        "babel-types@^6.26.0" = s."babel-types@6.26.0";
        "babylon@6.18.0" = f "babylon" "6.18.0" y "af2f3b88fa6f5c1e4c634d1a0f8eac4f55b395e3" [];
        "babylon@^6.18.0" = s."babylon@6.18.0";
        "balanced-match@1.0.0" = f "balanced-match" "1.0.0" y "89b4d199ab2bee49de164ea02b89ce462d71b767" [];
        "balanced-match@^1.0.0" = s."balanced-match@1.0.0";
        "base64-js@1.3.0" = f "base64-js" "1.3.0" y "cab1e6118f051095e58b5281aea8c1cd22bfc0e3" [];
        "base64-js@^1.0.2" = s."base64-js@1.3.0";
        "base64-js@^1.1.2" = s."base64-js@1.3.0";
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
        "big.js@3.2.0" = f "big.js" "3.2.0" y "a5fc298b81b9e0dca2e458824784b65c52ba588e" [];
        "big.js@5.2.2" = f "big.js" "5.2.2" y "65f0af382f578bcdc742bd9c281e9cb2d7768328" [];
        "big.js@^3.1.3" = s."big.js@3.2.0";
        "big.js@^5.2.2" = s."big.js@5.2.2";
        "binary-extensions@1.13.0" = f "binary-extensions" "1.13.0" y "9523e001306a32444b907423f1de2164222f6ab1" [];
        "binary-extensions@^1.0.0" = s."binary-extensions@1.13.0";
        "bn.js@4.11.8" = f "bn.js" "4.11.8" y "2cde09eb5ee341f484746bb0309b3253b1b1442f" [];
        "bn.js@^4.0.0" = s."bn.js@4.11.8";
        "bn.js@^4.1.0" = s."bn.js@4.11.8";
        "bn.js@^4.1.1" = s."bn.js@4.11.8";
        "bn.js@^4.4.0" = s."bn.js@4.11.8";
        "boolbase@1.0.0" = f "boolbase" "1.0.0" y "68dff5fbe60c51eb37725ea9e3ed310dcc1e776e" [];
        "boolbase@^1.0.0" = s."boolbase@1.0.0";
        "boolbase@~1.0.0" = s."boolbase@1.0.0";
        "bootstrap-fonts-complete@1.0.0" = f "bootstrap-fonts-complete" "1.0.0" y "037a987c008722313fd5889f8689cf3cc58ca06e" [
          (s."postcss@^4.1.16")
          ];
        "bootstrap-fonts-complete@^1.0.0" = s."bootstrap-fonts-complete@1.0.0";
        "brace-expansion@1.1.11" = f "brace-expansion" "1.1.11" y "3c7fcbf529d87226f3d2f52b966ff5271eb441dd" [
          (s."balanced-match@^1.0.0")
          (s."concat-map@0.0.1")
          ];
        "brace-expansion@^1.1.7" = s."brace-expansion@1.1.11";
        "braces@1.8.5" = f "braces" "1.8.5" y "ba77962e12dff969d6b76711e914b737857bf6a7" [
          (s."expand-range@^1.8.1")
          (s."preserve@^0.2.0")
          (s."repeat-element@^1.1.2")
          ];
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
        "braces@^1.8.2" = s."braces@1.8.5";
        "braces@^2.3.1" = s."braces@2.3.2";
        "braces@^2.3.2" = s."braces@2.3.2";
        "brorand@1.1.0" = f "brorand" "1.1.0" y "12c25efe40a45e3c323eb8675a0a0ce57b22371f" [];
        "brorand@^1.0.1" = s."brorand@1.1.0";
        "brotli@1.3.2" = f "brotli" "1.3.2" y "525a9cad4fcba96475d7d388f6aecb13eed52f46" [
          (s."base64-js@^1.1.2")
          ];
        "brotli@^1.3.2" = s."brotli@1.3.2";
        "browserify-aes@1.2.0" = f "browserify-aes" "1.2.0" y "326734642f403dabc3003209853bb70ad428ef48" [
          (s."buffer-xor@^1.0.3")
          (s."cipher-base@^1.0.0")
          (s."create-hash@^1.1.0")
          (s."evp_bytestokey@^1.0.3")
          (s."inherits@^2.0.1")
          (s."safe-buffer@^5.0.1")
          ];
        "browserify-aes@^1.0.0" = s."browserify-aes@1.2.0";
        "browserify-aes@^1.0.4" = s."browserify-aes@1.2.0";
        "browserify-cipher@1.0.1" = f "browserify-cipher" "1.0.1" y "8d6474c1b870bfdabcd3bcfcc1934a10e94f15f0" [
          (s."browserify-aes@^1.0.4")
          (s."browserify-des@^1.0.0")
          (s."evp_bytestokey@^1.0.0")
          ];
        "browserify-cipher@^1.0.0" = s."browserify-cipher@1.0.1";
        "browserify-des@1.0.2" = f "browserify-des" "1.0.2" y "3af4f1f59839403572f1c66204375f7a7f703e9c" [
          (s."cipher-base@^1.0.1")
          (s."des.js@^1.0.0")
          (s."inherits@^2.0.1")
          (s."safe-buffer@^5.1.2")
          ];
        "browserify-des@^1.0.0" = s."browserify-des@1.0.2";
        "browserify-rsa@4.0.1" = f "browserify-rsa" "4.0.1" y "21e0abfaf6f2029cf2fafb133567a701d4135524" [
          (s."bn.js@^4.1.0")
          (s."randombytes@^2.0.1")
          ];
        "browserify-rsa@^4.0.0" = s."browserify-rsa@4.0.1";
        "browserify-sign@4.0.4" = f "browserify-sign" "4.0.4" y "aa4eb68e5d7b658baa6bf6a57e630cbd7a93d298" [
          (s."bn.js@^4.1.1")
          (s."browserify-rsa@^4.0.0")
          (s."create-hash@^1.1.0")
          (s."create-hmac@^1.1.2")
          (s."elliptic@^6.0.0")
          (s."inherits@^2.0.1")
          (s."parse-asn1@^5.0.0")
          ];
        "browserify-sign@^4.0.0" = s."browserify-sign@4.0.4";
        "browserify-zlib@0.2.0" = f "browserify-zlib" "0.2.0" y "2869459d9aa3be245fe8fe2ca1f46e2e7f54d73f" [
          (s."pako@~1.0.5")
          ];
        "browserify-zlib@^0.2.0" = s."browserify-zlib@0.2.0";
        "browserslist@4.4.1" = f "browserslist" "4.4.1" y "42e828954b6b29a7a53e352277be429478a69062" [
          (s."caniuse-lite@^1.0.30000929")
          (s."electron-to-chromium@^1.3.103")
          (s."node-releases@^1.1.3")
          ];
        "browserslist@^4.0.0" = s."browserslist@4.4.1";
        "browserslist@^4.4.1" = s."browserslist@4.4.1";
        "buffer-xor@1.0.3" = f "buffer-xor" "1.0.3" y "26e61ed1422fb70dd42e6e36729ed51d855fe8d9" [];
        "buffer-xor@^1.0.3" = s."buffer-xor@1.0.3";
        "buffer@4.9.1" = f "buffer" "4.9.1" y "6d1bb601b07a4efced97094132093027c95bc298" [
          (s."base64-js@^1.0.2")
          (s."ieee754@^1.1.4")
          (s."isarray@^1.0.0")
          ];
        "buffer@^4.3.0" = s."buffer@4.9.1";
        "builtin-status-codes@3.0.0" = f "builtin-status-codes" "3.0.0" y "85982878e21b98e1c66425e03d0174788f569ee8" [];
        "builtin-status-codes@^3.0.0" = s."builtin-status-codes@3.0.0";
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
        "caller-callsite@2.0.0" = f "caller-callsite" "2.0.0" y "847e0fce0a223750a9a027c54b33731ad3154134" [
          (s."callsites@^2.0.0")
          ];
        "caller-callsite@^2.0.0" = s."caller-callsite@2.0.0";
        "caller-path@2.0.0" = f "caller-path" "2.0.0" y "468f83044e369ab2010fac5f06ceee15bb2cb1f4" [
          (s."caller-callsite@^2.0.0")
          ];
        "caller-path@^2.0.0" = s."caller-path@2.0.0";
        "callsites@2.0.0" = f "callsites" "2.0.0" y "06eb84f00eea413da86affefacbffb36093b3c50" [];
        "callsites@^2.0.0" = s."callsites@2.0.0";
        "camelcase@1.2.1" = f "camelcase" "1.2.1" y "9bb5304d2e0b56698b2c758b08a3eaa9daa58a39" [];
        "camelcase@3.0.0" = f "camelcase" "3.0.0" y "32fc4b9fcdaf845fcdf7e73bb97cac2261f0ab0a" [];
        "camelcase@^1.0.2" = s."camelcase@1.2.1";
        "camelcase@^3.0.0" = s."camelcase@3.0.0";
        "caniuse-api@3.0.0" = f "caniuse-api" "3.0.0" y "5e4d90e2274961d46291997df599e3ed008ee4c0" [
          (s."browserslist@^4.0.0")
          (s."caniuse-lite@^1.0.0")
          (s."lodash.memoize@^4.1.2")
          (s."lodash.uniq@^4.5.0")
          ];
        "caniuse-api@^3.0.0" = s."caniuse-api@3.0.0";
        "caniuse-lite@1.0.30000936" = f "caniuse-lite" "1.0.30000936" y "5d33b118763988bf721b9b8ad436d0400e4a116b" [];
        "caniuse-lite@^1.0.0" = s."caniuse-lite@1.0.30000936";
        "caniuse-lite@^1.0.30000929" = s."caniuse-lite@1.0.30000936";
        "caniuse-lite@^1.0.30000932" = s."caniuse-lite@1.0.30000936";
        "center-align@0.1.3" = f "center-align" "0.1.3" y "aa0d32629b6ee972200411cbd4461c907bc2b7ad" [
          (s."align-text@^0.1.3")
          (s."lazy-cache@^1.0.3")
          ];
        "center-align@^0.1.1" = s."center-align@0.1.3";
        "chalk@1.1.3" = f "chalk" "1.1.3" y "a8115c55e4a702fe4d150abd3872822a7e09fc98" [
          (s."ansi-styles@^2.2.1")
          (s."escape-string-regexp@^1.0.2")
          (s."has-ansi@^2.0.0")
          (s."strip-ansi@^3.0.0")
          (s."supports-color@^2.0.0")
          ];
        "chalk@2.4.2" = f "chalk" "2.4.2" y "cd42541677a54333cf541a49108c1432b44c9424" [
          (s."ansi-styles@^3.2.1")
          (s."escape-string-regexp@^1.0.5")
          (s."supports-color@^5.3.0")
          ];
        "chalk@^1.1.3" = s."chalk@1.1.3";
        "chalk@^2.4.1" = s."chalk@2.4.2";
        "chalk@^2.4.2" = s."chalk@2.4.2";
        "chokidar@1.7.0" = f "chokidar" "1.7.0" y "798e689778151c8076b4b360e5edd28cda2bb468" [
          (s."anymatch@^1.3.0")
          (s."async-each@^1.0.0")
          (s."glob-parent@^2.0.0")
          (s."inherits@^2.0.1")
          (s."is-binary-path@^1.0.0")
          (s."is-glob@^2.0.0")
          (s."path-is-absolute@^1.0.0")
          (s."readdirp@^2.0.0")
          (s."fsevents@^1.0.0")
          ];
        "chokidar@2.1.1" = f "chokidar" "2.1.1" y "adc39ad55a2adf26548bd2afa048f611091f9184" [
          (s."anymatch@^2.0.0")
          (s."async-each@^1.0.1")
          (s."braces@^2.3.2")
          (s."glob-parent@^3.1.0")
          (s."inherits@^2.0.3")
          (s."is-binary-path@^1.0.0")
          (s."is-glob@^4.0.0")
          (s."normalize-path@^3.0.0")
          (s."path-is-absolute@^1.0.0")
          (s."readdirp@^2.2.1")
          (s."upath@^1.1.0")
          (s."fsevents@^1.2.7")
          ];
        "chokidar@^1.6.1" = s."chokidar@1.7.0";
        "chokidar@^2.0.2" = s."chokidar@2.1.1";
        "chownr@1.1.1" = f "chownr" "1.1.1" y "54726b8b8fff4df053c42187e801fb4412df1494" [];
        "chownr@^1.1.1" = s."chownr@1.1.1";
        "cipher-base@1.0.4" = f "cipher-base" "1.0.4" y "8760e4ecc272f4c363532f926d874aae2c1397de" [
          (s."inherits@^2.0.1")
          (s."safe-buffer@^5.0.1")
          ];
        "cipher-base@^1.0.0" = s."cipher-base@1.0.4";
        "cipher-base@^1.0.1" = s."cipher-base@1.0.4";
        "cipher-base@^1.0.3" = s."cipher-base@1.0.4";
        "class-utils@0.3.6" = f "class-utils" "0.3.6" y "f93369ae8b9a7ce02fd41faad0ca83033190c463" [
          (s."arr-union@^3.1.0")
          (s."define-property@^0.2.5")
          (s."isobject@^3.0.0")
          (s."static-extend@^0.1.1")
          ];
        "class-utils@^0.3.5" = s."class-utils@0.3.6";
        "cliui@2.1.0" = f "cliui" "2.1.0" y "4b475760ff80264c762c3a1719032e91c7fea0d1" [
          (s."center-align@^0.1.1")
          (s."right-align@^0.1.1")
          (s."wordwrap@0.0.2")
          ];
        "cliui@3.2.0" = f "cliui" "3.2.0" y "120601537a916d29940f934da3b48d585a39213d" [
          (s."string-width@^1.0.1")
          (s."strip-ansi@^3.0.1")
          (s."wrap-ansi@^2.0.0")
          ];
        "cliui@^2.1.0" = s."cliui@2.1.0";
        "cliui@^3.2.0" = s."cliui@3.2.0";
        "co@4.6.0" = f "co" "4.6.0" y "6ea6bdf3d853ae54ccb8e47bfa0bf3f9031fb184" [];
        "co@^4.6.0" = s."co@4.6.0";
        "coa@2.0.2" = f "coa" "2.0.2" y "43f6c21151b4ef2bf57187db0d73de229e3e7ec3" [
          (s."@types/q@^1.5.1")
          (s."chalk@^2.4.1")
          (s."q@^1.1.2")
          ];
        "coa@~2.0.1" = s."coa@2.0.2";
        "code-point-at@1.1.0" = f "code-point-at" "1.1.0" y "0d070b4d043a5bea33a2f1a40e2edb3d9a4ccf77" [];
        "code-point-at@^1.0.0" = s."code-point-at@1.1.0";
        "collection-visit@1.0.0" = f "collection-visit" "1.0.0" y "4bc0373c164bc3291b4d368c829cf1a80a59dca0" [
          (s."map-visit@^1.0.0")
          (s."object-visit@^1.0.0")
          ];
        "collection-visit@^1.0.0" = s."collection-visit@1.0.0";
        "color-convert@1.9.3" = f "color-convert" "1.9.3" y "bb71850690e1f136567de629d2d5471deda4c1e8" [
          (s."color-name@1.1.3")
          ];
        "color-convert@^1.9.0" = s."color-convert@1.9.3";
        "color-convert@^1.9.1" = s."color-convert@1.9.3";
        "color-name@1.1.3" = f "color-name" "1.1.3" y "a7d0558bd89c42f795dd42328f740831ca53bc25" [];
        "color-name@1.1.4" = f "color-name" "1.1.4" y "c2a09a87acbde69543de6f63fa3995c826c536a2" [];
        "color-name@^1.0.0" = s."color-name@1.1.4";
        "color-string@1.5.3" = f "color-string" "1.5.3" y "c9bbc5f01b58b5492f3d6857459cb6590ce204cc" [
          (s."color-name@^1.0.0")
          (s."simple-swizzle@^0.2.2")
          ];
        "color-string@^1.5.2" = s."color-string@1.5.3";
        "color@3.1.0" = f "color" "3.1.0" y "d8e9fb096732875774c84bf922815df0308d0ffc" [
          (s."color-convert@^1.9.1")
          (s."color-string@^1.5.2")
          ];
        "color@^3.0.0" = s."color@3.1.0";
        "colors@1.1.2" = f "colors" "1.1.2" y "168a4701756b6a7f51a12ce0c97bfa28c084ed63" [];
        "colors@~1.1.2" = s."colors@1.1.2";
        "commander@2.19.0" = f "commander" "2.19.0" y "f6198aa84e5b83c46054b94ddedbfed5ee9ff12a" [];
        "commander@^2.11.0" = s."commander@2.19.0";
        "commander@^2.7.1" = s."commander@2.19.0";
        "commondir@1.0.1" = f "commondir" "1.0.1" y "ddd800da0c66127393cca5950ea968a3aaf1253b" [];
        "commondir@^1.0.1" = s."commondir@1.0.1";
        "component-emitter@1.2.1" = f "component-emitter" "1.2.1" y "137918d6d78283f7df7a6b7c5a63e140e69425e6" [];
        "component-emitter@^1.2.1" = s."component-emitter@1.2.1";
        "concat-map@0.0.1" = f "concat-map" "0.0.1" y "d8a96bd77fd68df7793a73036a3ba0d5405d477b" [];
        "console-browserify@1.1.0" = f "console-browserify" "1.1.0" y "f0241c45730a9fc6323b206dbf38edc741d0bb10" [
          (s."date-now@^0.1.4")
          ];
        "console-browserify@^1.1.0" = s."console-browserify@1.1.0";
        "console-control-strings@1.1.0" = f "console-control-strings" "1.1.0" y "3d7cf4464db6446ea644bf4b39507f9851008e8e" [];
        "console-control-strings@^1.0.0" = s."console-control-strings@1.1.0";
        "console-control-strings@~1.1.0" = s."console-control-strings@1.1.0";
        "constants-browserify@1.0.0" = f "constants-browserify" "1.0.0" y "c20b96d8c617748aaf1c16021760cd27fcb8cb75" [];
        "constants-browserify@^1.0.0" = s."constants-browserify@1.0.0";
        "convert-source-map@1.6.0" = f "convert-source-map" "1.6.0" y "51b537a8c43e0f04dec1993bffcdd504e758ac20" [
          (s."safe-buffer@~5.1.1")
          ];
        "convert-source-map@^1.5.0" = s."convert-source-map@1.6.0";
        "convert-source-map@^1.5.1" = s."convert-source-map@1.6.0";
        "copy-descriptor@0.1.1" = f "copy-descriptor" "0.1.1" y "676f6eb3c39997c2ee1ac3a924fd6124748f578d" [];
        "copy-descriptor@^0.1.0" = s."copy-descriptor@0.1.1";
        "core-js@2.6.4" = f "core-js" "2.6.4" y "b8897c062c4d769dd30a0ac5c73976c47f92ea0d" [];
        "core-js@^2.4.0" = s."core-js@2.6.4";
        "core-js@^2.5.0" = s."core-js@2.6.4";
        "core-util-is@1.0.2" = f "core-util-is" "1.0.2" y "b5fd54220aa2bc5ab57aab7140c940754503c1a7" [];
        "core-util-is@~1.0.0" = s."core-util-is@1.0.2";
        "cosmiconfig@5.0.7" = f "cosmiconfig" "5.0.7" y "39826b292ee0d78eda137dfa3173bd1c21a43b04" [
          (s."import-fresh@^2.0.0")
          (s."is-directory@^0.3.1")
          (s."js-yaml@^3.9.0")
          (s."parse-json@^4.0.0")
          ];
        "cosmiconfig@^5.0.0" = s."cosmiconfig@5.0.7";
        "create-ecdh@4.0.3" = f "create-ecdh" "4.0.3" y "c9111b6f33045c4697f144787f9254cdc77c45ff" [
          (s."bn.js@^4.1.0")
          (s."elliptic@^6.0.0")
          ];
        "create-ecdh@^4.0.0" = s."create-ecdh@4.0.3";
        "create-hash@1.2.0" = f "create-hash" "1.2.0" y "889078af11a63756bcfb59bd221996be3a9ef196" [
          (s."cipher-base@^1.0.1")
          (s."inherits@^2.0.1")
          (s."md5.js@^1.3.4")
          (s."ripemd160@^2.0.1")
          (s."sha.js@^2.4.0")
          ];
        "create-hash@^1.1.0" = s."create-hash@1.2.0";
        "create-hash@^1.1.2" = s."create-hash@1.2.0";
        "create-hmac@1.1.7" = f "create-hmac" "1.1.7" y "69170c78b3ab957147b2b8b04572e47ead2243ff" [
          (s."cipher-base@^1.0.3")
          (s."create-hash@^1.1.0")
          (s."inherits@^2.0.1")
          (s."ripemd160@^2.0.0")
          (s."safe-buffer@^5.0.1")
          (s."sha.js@^2.4.8")
          ];
        "create-hmac@^1.1.0" = s."create-hmac@1.1.7";
        "create-hmac@^1.1.2" = s."create-hmac@1.1.7";
        "create-hmac@^1.1.4" = s."create-hmac@1.1.7";
        "cross-env@5.2.0" = f "cross-env" "5.2.0" y "6ecd4c015d5773e614039ee529076669b9d126f2" [
          (s."cross-spawn@^6.0.5")
          (s."is-windows@^1.0.0")
          ];
        "cross-env@^5.0.0" = s."cross-env@5.2.0";
        "cross-spawn@6.0.5" = f "cross-spawn" "6.0.5" y "4a5ec7c64dfae22c3a14124dbacdee846d80cbc4" [
          (s."nice-try@^1.0.4")
          (s."path-key@^2.0.1")
          (s."semver@^5.5.0")
          (s."shebang-command@^1.2.0")
          (s."which@^1.2.9")
          ];
        "cross-spawn@^6.0.5" = s."cross-spawn@6.0.5";
        "crypto-browserify@3.12.0" = f "crypto-browserify" "3.12.0" y "396cf9f3137f03e4b8e532c58f698254e00f80ec" [
          (s."browserify-cipher@^1.0.0")
          (s."browserify-sign@^4.0.0")
          (s."create-ecdh@^4.0.0")
          (s."create-hash@^1.1.0")
          (s."create-hmac@^1.1.0")
          (s."diffie-hellman@^5.0.0")
          (s."inherits@^2.0.1")
          (s."pbkdf2@^3.0.3")
          (s."public-encrypt@^4.0.0")
          (s."randombytes@^2.0.0")
          (s."randomfill@^1.0.3")
          ];
        "crypto-browserify@^3.11.0" = s."crypto-browserify@3.12.0";
        "css-color-names@0.0.4" = f "css-color-names" "0.0.4" y "808adc2e79cf84738069b646cb20ec27beb629e0" [];
        "css-color-names@^0.0.4" = s."css-color-names@0.0.4";
        "css-declaration-sorter@4.0.1" = f "css-declaration-sorter" "4.0.1" y "c198940f63a76d7e36c1e71018b001721054cb22" [
          (s."postcss@^7.0.1")
          (s."timsort@^0.3.0")
          ];
        "css-declaration-sorter@^4.0.1" = s."css-declaration-sorter@4.0.1";
        "css-select-base-adapter@0.1.1" = f "css-select-base-adapter" "0.1.1" y "3b2ff4972cc362ab88561507a95408a1432135d7" [];
        "css-select-base-adapter@~0.1.0" = s."css-select-base-adapter@0.1.1";
        "css-select@2.0.2" = f "css-select" "2.0.2" y "ab4386cec9e1f668855564b17c3733b43b2a5ede" [
          (s."boolbase@^1.0.0")
          (s."css-what@^2.1.2")
          (s."domutils@^1.7.0")
          (s."nth-check@^1.0.2")
          ];
        "css-select@^2.0.0" = s."css-select@2.0.2";
        "css-tree@1.0.0-alpha.28" = f "css-tree" "1.0.0-alpha.28" y "8e8968190d886c9477bc8d61e96f61af3f7ffa7f" [
          (s."mdn-data@~1.1.0")
          (s."source-map@^0.5.3")
          ];
        "css-tree@1.0.0-alpha.29" = f "css-tree" "1.0.0-alpha.29" y "3fa9d4ef3142cbd1c301e7664c1f352bd82f5a39" [
          (s."mdn-data@~1.1.0")
          (s."source-map@^0.5.3")
          ];
        "css-unit-converter@1.1.1" = f "css-unit-converter" "1.1.1" y "d9b9281adcfd8ced935bdbaba83786897f64e996" [];
        "css-unit-converter@^1.1.1" = s."css-unit-converter@1.1.1";
        "css-url-regex@1.1.0" = f "css-url-regex" "1.1.0" y "83834230cc9f74c457de59eebd1543feeb83b7ec" [];
        "css-url-regex@^1.1.0" = s."css-url-regex@1.1.0";
        "css-what@2.1.2" = f "css-what" "2.1.2" y "c0876d9d0480927d7d4920dcd72af3595649554d" [];
        "css-what@^2.1.2" = s."css-what@2.1.2";
        "cssesc@2.0.0" = f "cssesc" "2.0.0" y "3b13bd1bb1cb36e1bcb5a4dcd27f54c5dcb35703" [];
        "cssesc@^2.0.0" = s."cssesc@2.0.0";
        "cssnano-preset-advanced@4.0.7" = f "cssnano-preset-advanced" "4.0.7" y "d981527b77712e2f3f3f09c73313e9b71b278b88" [
          (s."autoprefixer@^9.4.7")
          (s."cssnano-preset-default@^4.0.7")
          (s."postcss-discard-unused@^4.0.1")
          (s."postcss-merge-idents@^4.0.1")
          (s."postcss-reduce-idents@^4.0.2")
          (s."postcss-zindex@^4.0.1")
          ];
        "cssnano-preset-advanced@^4.0.7" = s."cssnano-preset-advanced@4.0.7";
        "cssnano-preset-default@4.0.7" = f "cssnano-preset-default" "4.0.7" y "51ec662ccfca0f88b396dcd9679cdb931be17f76" [
          (s."css-declaration-sorter@^4.0.1")
          (s."cssnano-util-raw-cache@^4.0.1")
          (s."postcss@^7.0.0")
          (s."postcss-calc@^7.0.1")
          (s."postcss-colormin@^4.0.3")
          (s."postcss-convert-values@^4.0.1")
          (s."postcss-discard-comments@^4.0.2")
          (s."postcss-discard-duplicates@^4.0.2")
          (s."postcss-discard-empty@^4.0.1")
          (s."postcss-discard-overridden@^4.0.1")
          (s."postcss-merge-longhand@^4.0.11")
          (s."postcss-merge-rules@^4.0.3")
          (s."postcss-minify-font-values@^4.0.2")
          (s."postcss-minify-gradients@^4.0.2")
          (s."postcss-minify-params@^4.0.2")
          (s."postcss-minify-selectors@^4.0.2")
          (s."postcss-normalize-charset@^4.0.1")
          (s."postcss-normalize-display-values@^4.0.2")
          (s."postcss-normalize-positions@^4.0.2")
          (s."postcss-normalize-repeat-style@^4.0.2")
          (s."postcss-normalize-string@^4.0.2")
          (s."postcss-normalize-timing-functions@^4.0.2")
          (s."postcss-normalize-unicode@^4.0.1")
          (s."postcss-normalize-url@^4.0.1")
          (s."postcss-normalize-whitespace@^4.0.2")
          (s."postcss-ordered-values@^4.1.2")
          (s."postcss-reduce-initial@^4.0.3")
          (s."postcss-reduce-transforms@^4.0.2")
          (s."postcss-svgo@^4.0.2")
          (s."postcss-unique-selectors@^4.0.1")
          ];
        "cssnano-preset-default@^4.0.7" = s."cssnano-preset-default@4.0.7";
        "cssnano-util-get-arguments@4.0.0" = f "cssnano-util-get-arguments" "4.0.0" y "ed3a08299f21d75741b20f3b81f194ed49cc150f" [];
        "cssnano-util-get-arguments@^4.0.0" = s."cssnano-util-get-arguments@4.0.0";
        "cssnano-util-get-match@4.0.0" = f "cssnano-util-get-match" "4.0.0" y "c0e4ca07f5386bb17ec5e52250b4f5961365156d" [];
        "cssnano-util-get-match@^4.0.0" = s."cssnano-util-get-match@4.0.0";
        "cssnano-util-raw-cache@4.0.1" = f "cssnano-util-raw-cache" "4.0.1" y "b26d5fd5f72a11dfe7a7846fb4c67260f96bf282" [
          (s."postcss@^7.0.0")
          ];
        "cssnano-util-raw-cache@^4.0.1" = s."cssnano-util-raw-cache@4.0.1";
        "cssnano-util-same-parent@4.0.1" = f "cssnano-util-same-parent" "4.0.1" y "574082fb2859d2db433855835d9a8456ea18bbf3" [];
        "cssnano-util-same-parent@^4.0.0" = s."cssnano-util-same-parent@4.0.1";
        "csso@3.5.1" = f "csso" "3.5.1" y "7b9eb8be61628973c1b261e169d2f024008e758b" [
          (s."css-tree@1.0.0-alpha.29")
          ];
        "csso@^3.5.0" = s."csso@3.5.1";
        "date-now@0.1.4" = f "date-now" "0.1.4" y "eaf439fd4d4848ad74e5cc7dbef200672b9e345b" [];
        "date-now@^0.1.4" = s."date-now@0.1.4";
        "debug@2.6.9" = f "debug" "2.6.9" y "5d128515df134ff327e90a4c93f4e077a536341f" [
          (s."ms@2.0.0")
          ];
        "debug@^2.1.2" = s."debug@2.6.9";
        "debug@^2.2.0" = s."debug@2.6.9";
        "debug@^2.3.3" = s."debug@2.6.9";
        "debug@^2.6.8" = s."debug@2.6.9";
        "debug@^2.6.9" = s."debug@2.6.9";
        "decamelize@1.2.0" = f "decamelize" "1.2.0" y "f6534d15148269b20352e7bee26f501f9a191290" [];
        "decamelize@^1.0.0" = s."decamelize@1.2.0";
        "decamelize@^1.1.1" = s."decamelize@1.2.0";
        "decode-uri-component@0.2.0" = f "decode-uri-component" "0.2.0" y "eb3913333458775cb84cd1a1fae062106bb87545" [];
        "decode-uri-component@^0.2.0" = s."decode-uri-component@0.2.0";
        "deep-extend@0.6.0" = f "deep-extend" "0.6.0" y "c4fa7c95404a17a9c3e8ca7e1537312b736330ac" [];
        "deep-extend@^0.6.0" = s."deep-extend@0.6.0";
        "define-properties@1.1.3" = f "define-properties" "1.1.3" y "cf88da6cbee26fe6db7094f61d870cbd84cee9f1" [
          (s."object-keys@^1.0.12")
          ];
        "define-properties@^1.1.2" = s."define-properties@1.1.3";
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
        "delegates@1.0.0" = f "delegates" "1.0.0" y "84c6e159b81904fdca59a0ef44cd870d31250f9a" [];
        "delegates@^1.0.0" = s."delegates@1.0.0";
        "des.js@1.0.0" = f "des.js" "1.0.0" y "c074d2e2aa6a8a9a07dbd61f9a15c2cd83ec8ecc" [
          (s."inherits@^2.0.1")
          (s."minimalistic-assert@^1.0.0")
          ];
        "des.js@^1.0.0" = s."des.js@1.0.0";
        "detect-indent@4.0.0" = f "detect-indent" "4.0.0" y "f76d064352cdf43a1cb6ce619c4ee3a9475de208" [
          (s."repeating@^2.0.0")
          ];
        "detect-indent@^4.0.0" = s."detect-indent@4.0.0";
        "detect-libc@1.0.3" = f "detect-libc" "1.0.3" y "fa137c4bd698edf55cd5cd02ac559f91a4c4ba9b" [];
        "detect-libc@^1.0.2" = s."detect-libc@1.0.3";
        "diffie-hellman@5.0.3" = f "diffie-hellman" "5.0.3" y "40e8ee98f55a2149607146921c63e1ae5f3d2875" [
          (s."bn.js@^4.1.0")
          (s."miller-rabin@^4.0.0")
          (s."randombytes@^2.0.0")
          ];
        "diffie-hellman@^5.0.0" = s."diffie-hellman@5.0.3";
        "directory-fonts-complete@1.2.0" = f "directory-fonts-complete" "1.2.0" y "0980c1f0ea262fd17d1b32094a97c86789f9aa8b" [
          (s."brotli@^1.3.2")
          (s."is-eot@^1.0.0")
          (s."is-otf@^0.1.1")
          (s."is-ttf@^0.2.1")
          (s."is-woff@^1.0.1")
          (s."is-woff2@^1.0.0")
          ];
        "directory-fonts-complete@^1.2.0" = s."directory-fonts-complete@1.2.0";
        "dom-serializer@0" = s."dom-serializer@0.1.0";
        "dom-serializer@0.1.0" = f "dom-serializer" "0.1.0" y "073c697546ce0780ce23be4a28e293e40bc30c82" [
          (s."domelementtype@~1.1.1")
          (s."entities@~1.1.1")
          ];
        "domain-browser@1.2.0" = f "domain-browser" "1.2.0" y "3d31f50191a6749dd1375a7f522e823d42e54eda" [];
        "domain-browser@^1.1.1" = s."domain-browser@1.2.0";
        "domelementtype@1" = s."domelementtype@1.3.1";
        "domelementtype@1.1.3" = f "domelementtype" "1.1.3" y "bd28773e2642881aec51544924299c5cd822185b" [];
        "domelementtype@1.3.1" = f "domelementtype" "1.3.1" y "d048c44b37b0d10a7f2a3d5fee3f4333d790481f" [];
        "domelementtype@~1.1.1" = s."domelementtype@1.1.3";
        "domutils@1.7.0" = f "domutils" "1.7.0" y "56ea341e834e06e6748af7a1cb25da67ea9f8c2a" [
          (s."dom-serializer@0")
          (s."domelementtype@1")
          ];
        "domutils@^1.7.0" = s."domutils@1.7.0";
        "dot-prop@4.2.0" = f "dot-prop" "4.2.0" y "1f19e0c2e1aa0e32797c49799f2837ac6af69c57" [
          (s."is-obj@^1.0.0")
          ];
        "dot-prop@^4.1.1" = s."dot-prop@4.2.0";
        "electron-to-chromium@1.3.113" = f "electron-to-chromium" "1.3.113" y "b1ccf619df7295aea17bc6951dc689632629e4a9" [];
        "electron-to-chromium@^1.3.103" = s."electron-to-chromium@1.3.113";
        "elliptic@6.4.1" = f "elliptic" "6.4.1" y "c2d0b7776911b86722c632c3c06c60f2f819939a" [
          (s."bn.js@^4.4.0")
          (s."brorand@^1.0.1")
          (s."hash.js@^1.0.0")
          (s."hmac-drbg@^1.0.0")
          (s."inherits@^2.0.1")
          (s."minimalistic-assert@^1.0.0")
          (s."minimalistic-crypto-utils@^1.0.0")
          ];
        "elliptic@^6.0.0" = s."elliptic@6.4.1";
        "emojis-list@2.1.0" = f "emojis-list" "2.1.0" y "4daa4d9db00f9819880c79fa457ae5b09a1fd389" [];
        "emojis-list@^2.0.0" = s."emojis-list@2.1.0";
        "enhanced-resolve@3.4.1" = f "enhanced-resolve" "3.4.1" y "0421e339fd71419b3da13d129b3979040230476e" [
          (s."graceful-fs@^4.1.2")
          (s."memory-fs@^0.4.0")
          (s."object-assign@^4.0.1")
          (s."tapable@^0.2.7")
          ];
        "enhanced-resolve@^3.3.0" = s."enhanced-resolve@3.4.1";
        "entities@1.1.2" = f "entities" "1.1.2" y "bdfa735299664dfafd34529ed4f8522a275fea56" [];
        "entities@~1.1.1" = s."entities@1.1.2";
        "errno@0.1.7" = f "errno" "0.1.7" y "4684d71779ad39af177e3f007996f7c67c852618" [
          (s."prr@~1.0.1")
          ];
        "errno@^0.1.3" = s."errno@0.1.7";
        "error-ex@1.3.2" = f "error-ex" "1.3.2" y "b4ac40648107fdcdcfae242f428bea8a14d4f1bf" [
          (s."is-arrayish@^0.2.1")
          ];
        "error-ex@^1.2.0" = s."error-ex@1.3.2";
        "error-ex@^1.3.1" = s."error-ex@1.3.2";
        "es-abstract@1.13.0" = f "es-abstract" "1.13.0" y "ac86145fdd5099d8dd49558ccba2eaf9b88e24e9" [
          (s."es-to-primitive@^1.2.0")
          (s."function-bind@^1.1.1")
          (s."has@^1.0.3")
          (s."is-callable@^1.1.4")
          (s."is-regex@^1.0.4")
          (s."object-keys@^1.0.12")
          ];
        "es-abstract@^1.12.0" = s."es-abstract@1.13.0";
        "es-abstract@^1.5.1" = s."es-abstract@1.13.0";
        "es-to-primitive@1.2.0" = f "es-to-primitive" "1.2.0" y "edf72478033456e8dda8ef09e00ad9650707f377" [
          (s."is-callable@^1.1.4")
          (s."is-date-object@^1.0.1")
          (s."is-symbol@^1.0.2")
          ];
        "es-to-primitive@^1.2.0" = s."es-to-primitive@1.2.0";
        "es6-promise@2.3.0" = f "es6-promise" "2.3.0" y "96edb9f2fdb01995822b263dd8aadab6748181bc" [];
        "es6-promise@~2.3.0" = s."es6-promise@2.3.0";
        "escape-string-regexp@1.0.5" = f "escape-string-regexp" "1.0.5" y "1b61c0562190a8dff6ae3bb2cf0200ca130b86d4" [];
        "escape-string-regexp@^1.0.2" = s."escape-string-regexp@1.0.5";
        "escape-string-regexp@^1.0.5" = s."escape-string-regexp@1.0.5";
        "esprima@4.0.1" = f "esprima" "4.0.1" y "13b04cdb3e6c5d19df91ab6987a8695619b0aa71" [];
        "esprima@^4.0.0" = s."esprima@4.0.1";
        "esutils@2.0.2" = f "esutils" "2.0.2" y "0abf4f1caa5bcb1f7a9d8acc6dea4faaa04bac9b" [];
        "esutils@^2.0.2" = s."esutils@2.0.2";
        "events@3.0.0" = f "events" "3.0.0" y "9a0a0dfaf62893d92b875b8f2698ca4114973e88" [];
        "events@^3.0.0" = s."events@3.0.0";
        "evp_bytestokey@1.0.3" = f "evp_bytestokey" "1.0.3" y "7fcbdb198dc71959432efe13842684e0525acb02" [
          (s."md5.js@^1.3.4")
          (s."safe-buffer@^5.1.1")
          ];
        "evp_bytestokey@^1.0.0" = s."evp_bytestokey@1.0.3";
        "evp_bytestokey@^1.0.3" = s."evp_bytestokey@1.0.3";
        "expand-brackets@0.1.5" = f "expand-brackets" "0.1.5" y "df07284e342a807cd733ac5af72411e581d1177b" [
          (s."is-posix-bracket@^0.1.0")
          ];
        "expand-brackets@2.1.4" = f "expand-brackets" "2.1.4" y "b77735e315ce30f6b6eff0f83b04151a22449622" [
          (s."debug@^2.3.3")
          (s."define-property@^0.2.5")
          (s."extend-shallow@^2.0.1")
          (s."posix-character-classes@^0.1.0")
          (s."regex-not@^1.0.0")
          (s."snapdragon@^0.8.1")
          (s."to-regex@^3.0.1")
          ];
        "expand-brackets@^0.1.4" = s."expand-brackets@0.1.5";
        "expand-brackets@^2.1.4" = s."expand-brackets@2.1.4";
        "expand-range@1.8.2" = f "expand-range" "1.8.2" y "a299effd335fe2721ebae8e257ec79644fc85337" [
          (s."fill-range@^2.1.0")
          ];
        "expand-range@^1.8.1" = s."expand-range@1.8.2";
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
        "extglob@0.3.2" = f "extglob" "0.3.2" y "2e18ff3d2f49ab2765cec9023f011daa8d8349a1" [
          (s."is-extglob@^1.0.0")
          ];
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
        "extglob@^0.3.1" = s."extglob@0.3.2";
        "extglob@^2.0.4" = s."extglob@2.0.4";
        "filename-regex@2.0.1" = f "filename-regex" "2.0.1" y "c1c4b9bee3e09725ddb106b75c1e301fe2f18b26" [];
        "filename-regex@^2.0.0" = s."filename-regex@2.0.1";
        "filesize@3.6.1" = f "filesize" "3.6.1" y "090bb3ee01b6f801a8a8be99d31710b3422bb317" [];
        "filesize@^3.1.2" = s."filesize@3.6.1";
        "fill-range@2.2.4" = f "fill-range" "2.2.4" y "eb1e773abb056dcd8df2bfdf6af59b8b3a936565" [
          (s."is-number@^2.1.0")
          (s."isobject@^2.0.0")
          (s."randomatic@^3.0.0")
          (s."repeat-element@^1.1.2")
          (s."repeat-string@^1.5.2")
          ];
        "fill-range@4.0.0" = f "fill-range" "4.0.0" y "d544811d428f98eb06a63dc402d2403c328c38f7" [
          (s."extend-shallow@^2.0.1")
          (s."is-number@^3.0.0")
          (s."repeat-string@^1.6.1")
          (s."to-regex-range@^2.1.0")
          ];
        "fill-range@^2.1.0" = s."fill-range@2.2.4";
        "fill-range@^4.0.0" = s."fill-range@4.0.0";
        "find-cache-dir@1.0.0" = f "find-cache-dir" "1.0.0" y "9288e3e9e3cc3748717d39eade17cf71fc30ee6f" [
          (s."commondir@^1.0.1")
          (s."make-dir@^1.0.0")
          (s."pkg-dir@^2.0.0")
          ];
        "find-cache-dir@^1.0.0" = s."find-cache-dir@1.0.0";
        "find-up@1.1.2" = f "find-up" "1.1.2" y "6b2e9822b1a2ce0a60ab64d610eccad53cb24d0f" [
          (s."path-exists@^2.0.0")
          (s."pinkie-promise@^2.0.0")
          ];
        "find-up@2.1.0" = f "find-up" "2.1.0" y "45d1b7e506c717ddd482775a2b77920a3c0c57a7" [
          (s."locate-path@^2.0.0")
          ];
        "find-up@^1.0.0" = s."find-up@1.1.2";
        "find-up@^2.1.0" = s."find-up@2.1.0";
        "for-in@1.0.2" = f "for-in" "1.0.2" y "81068d295a8142ec0ac726c6e2200c30fb6d5e80" [];
        "for-in@^1.0.1" = s."for-in@1.0.2";
        "for-in@^1.0.2" = s."for-in@1.0.2";
        "for-own@0.1.5" = f "for-own" "0.1.5" y "5265c681a4f294dabbf17c9509b6763aa84510ce" [
          (s."for-in@^1.0.1")
          ];
        "for-own@^0.1.4" = s."for-own@0.1.5";
        "fragment-cache@0.2.1" = f "fragment-cache" "0.2.1" y "4290fad27f13e89be7f33799c6bc5a0abfff0d19" [
          (s."map-cache@^0.2.2")
          ];
        "fragment-cache@^0.2.1" = s."fragment-cache@0.2.1";
        "fs-minipass@1.2.5" = f "fs-minipass" "1.2.5" y "06c277218454ec288df77ada54a03b8702aacb9d" [
          (s."minipass@^2.2.1")
          ];
        "fs-minipass@^1.2.5" = s."fs-minipass@1.2.5";
        "fs-readdir-recursive@1.1.0" = f "fs-readdir-recursive" "1.1.0" y "e32fc030a2ccee44a6b5371308da54be0b397d27" [];
        "fs-readdir-recursive@^1.0.0" = s."fs-readdir-recursive@1.1.0";
        "fs.realpath@1.0.0" = f "fs.realpath" "1.0.0" y "1504ad2523158caa40db4a2787cb01411994ea4f" [];
        "fs.realpath@^1.0.0" = s."fs.realpath@1.0.0";
        "fsevents@1.2.7" = f "fsevents" "1.2.7" y "4851b664a3783e52003b3c66eb0eee1074933aa4" [
          (s."nan@^2.9.2")
          (s."node-pre-gyp@^0.10.0")
          ];
        "fsevents@^1.0.0" = s."fsevents@1.2.7";
        "fsevents@^1.2.7" = s."fsevents@1.2.7";
        "function-bind@1.1.1" = f "function-bind" "1.1.1" y "a56899d3ea3c9bab874bb9773b7c5ede92f4895d" [];
        "function-bind@^1.1.1" = s."function-bind@1.1.1";
        "gauge@2.7.4" = f "gauge" "2.7.4" y "2c03405c7538c39d7eb37b317022e325fb018bf7" [
          (s."aproba@^1.0.3")
          (s."console-control-strings@^1.0.0")
          (s."has-unicode@^2.0.0")
          (s."object-assign@^4.1.0")
          (s."signal-exit@^3.0.0")
          (s."string-width@^1.0.1")
          (s."strip-ansi@^3.0.1")
          (s."wide-align@^1.1.0")
          ];
        "gauge@~2.7.3" = s."gauge@2.7.4";
        "get-caller-file@1.0.3" = f "get-caller-file" "1.0.3" y "f978fa4c90d1dfe7ff2d6beda2a515e713bdcf4a" [];
        "get-caller-file@^1.0.1" = s."get-caller-file@1.0.3";
        "get-value@2.0.6" = f "get-value" "2.0.6" y "dc15ca1c672387ca76bd37ac0a395ba2042a2c28" [];
        "get-value@^2.0.3" = s."get-value@2.0.6";
        "get-value@^2.0.6" = s."get-value@2.0.6";
        "glob-base@0.3.0" = f "glob-base" "0.3.0" y "dbb164f6221b1c0b1ccf82aea328b497df0ea3c4" [
          (s."glob-parent@^2.0.0")
          (s."is-glob@^2.0.0")
          ];
        "glob-base@^0.3.0" = s."glob-base@0.3.0";
        "glob-parent@2.0.0" = f "glob-parent" "2.0.0" y "81383d72db054fcccf5336daa902f182f6edbb28" [
          (s."is-glob@^2.0.0")
          ];
        "glob-parent@3.1.0" = f "glob-parent" "3.1.0" y "9e6af6299d8d3bd2bd40430832bd113df906c5ae" [
          (s."is-glob@^3.1.0")
          (s."path-dirname@^1.0.0")
          ];
        "glob-parent@^2.0.0" = s."glob-parent@2.0.0";
        "glob-parent@^3.1.0" = s."glob-parent@3.1.0";
        "glob@7.1.3" = f "glob" "7.1.3" y "3960832d3f1574108342dafd3a67b332c0969df1" [
          (s."fs.realpath@^1.0.0")
          (s."inflight@^1.0.4")
          (s."inherits@2")
          (s."minimatch@^3.0.4")
          (s."once@^1.3.0")
          (s."path-is-absolute@^1.0.0")
          ];
        "glob@^7.1.2" = s."glob@7.1.3";
        "glob@^7.1.3" = s."glob@7.1.3";
        "globals@9.18.0" = f "globals" "9.18.0" y "aa3896b3e69b487f17e31ed2143d69a8e30c2d8a" [];
        "globals@^9.18.0" = s."globals@9.18.0";
        "google-fonts-complete@1.2.2" = f "google-fonts-complete" "1.2.2" y "3ad95d4022a2f278acc41d4539b33a2899e8f76c" [
          (s."postcss@^4.1.16")
          ];
        "google-fonts-complete@^1.2.2" = s."google-fonts-complete@1.2.2";
        "graceful-fs@4.1.15" = f "graceful-fs" "4.1.15" y "ffb703e1066e8a0eeaa4c8b80ba9253eeefbfb00" [];
        "graceful-fs@^4.1.11" = s."graceful-fs@4.1.15";
        "graceful-fs@^4.1.2" = s."graceful-fs@4.1.15";
        "graceful-fs@^4.1.4" = s."graceful-fs@4.1.15";
        "has-ansi@2.0.0" = f "has-ansi" "2.0.0" y "34f5049ce1ecdf2b0649af3ef24e45ed35416d91" [
          (s."ansi-regex@^2.0.0")
          ];
        "has-ansi@^2.0.0" = s."has-ansi@2.0.0";
        "has-flag@1.0.0" = f "has-flag" "1.0.0" y "9d9e793165ce017a00f00418c43f942a7b1d11fa" [];
        "has-flag@3.0.0" = f "has-flag" "3.0.0" y "b5d454dc2199ae225699f3467e5a07f3b955bafd" [];
        "has-flag@^1.0.0" = s."has-flag@1.0.0";
        "has-flag@^3.0.0" = s."has-flag@3.0.0";
        "has-symbols@1.0.0" = f "has-symbols" "1.0.0" y "ba1a8f1af2a0fc39650f5c850367704122063b44" [];
        "has-symbols@^1.0.0" = s."has-symbols@1.0.0";
        "has-unicode@2.0.1" = f "has-unicode" "2.0.1" y "e0e6fe6a28cf51138855e086d1691e771de2a8b9" [];
        "has-unicode@^2.0.0" = s."has-unicode@2.0.1";
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
        "has@^1.0.0" = s."has@1.0.3";
        "has@^1.0.1" = s."has@1.0.3";
        "has@^1.0.3" = s."has@1.0.3";
        "hash-base@3.0.4" = f "hash-base" "3.0.4" y "5fc8686847ecd73499403319a6b0a3f3f6ae4918" [
          (s."inherits@^2.0.1")
          (s."safe-buffer@^5.0.1")
          ];
        "hash-base@^3.0.0" = s."hash-base@3.0.4";
        "hash.js@1.1.7" = f "hash.js" "1.1.7" y "0babca538e8d4ee4a0f8988d68866537a003cf42" [
          (s."inherits@^2.0.3")
          (s."minimalistic-assert@^1.0.1")
          ];
        "hash.js@^1.0.0" = s."hash.js@1.1.7";
        "hash.js@^1.0.3" = s."hash.js@1.1.7";
        "hex-color-regex@1.1.0" = f "hex-color-regex" "1.1.0" y "4c06fccb4602fe2602b3c93df82d7e7dbf1a8a8e" [];
        "hex-color-regex@^1.1.0" = s."hex-color-regex@1.1.0";
        "hmac-drbg@1.0.1" = f "hmac-drbg" "1.0.1" y "d2745701025a6c775a6c545793ed502fc0c649a1" [
          (s."hash.js@^1.0.3")
          (s."minimalistic-assert@^1.0.0")
          (s."minimalistic-crypto-utils@^1.0.1")
          ];
        "hmac-drbg@^1.0.0" = s."hmac-drbg@1.0.1";
        "home-or-tmp@2.0.0" = f "home-or-tmp" "2.0.0" y "e36c3f2d2cae7d746a857e38d18d5f32a7882db8" [
          (s."os-homedir@^1.0.0")
          (s."os-tmpdir@^1.0.1")
          ];
        "home-or-tmp@^2.0.0" = s."home-or-tmp@2.0.0";
        "hosted-git-info@2.7.1" = f "hosted-git-info" "2.7.1" y "97f236977bd6e125408930ff6de3eec6281ec047" [];
        "hosted-git-info@^2.1.4" = s."hosted-git-info@2.7.1";
        "hsl-regex@1.0.0" = f "hsl-regex" "1.0.0" y "d49330c789ed819e276a4c0d272dffa30b18fe6e" [];
        "hsl-regex@^1.0.0" = s."hsl-regex@1.0.0";
        "hsla-regex@1.0.0" = f "hsla-regex" "1.0.0" y "c1ce7a3168c8c6614033a4b5f7877f3b225f9c38" [];
        "hsla-regex@^1.0.0" = s."hsla-regex@1.0.0";
        "html-comment-regex@1.1.2" = f "html-comment-regex" "1.1.2" y "97d4688aeb5c81886a364faa0cad1dda14d433a7" [];
        "html-comment-regex@^1.1.0" = s."html-comment-regex@1.1.2";
        "https-browserify@1.0.0" = f "https-browserify" "1.0.0" y "ec06c10e0a34c0f2faf199f7fd7fc78fffd03c73" [];
        "https-browserify@^1.0.0" = s."https-browserify@1.0.0";
        "humanize@0.0.9" = f "humanize" "0.0.9" y "1994ffaecdfe9c441ed2bdac7452b7bb4c9e41a4" [];
        "iconv-lite@0.4.24" = f "iconv-lite" "0.4.24" y "2022b4b25fbddc21d2f524974a474aafe733908b" [
          (s."safer-buffer@>= 2.1.2 < 3")
          ];
        "iconv-lite@^0.4.4" = s."iconv-lite@0.4.24";
        "ieee754@1.1.12" = f "ieee754" "1.1.12" y "50bf24e5b9c8bb98af4964c941cdb0918da7b60b" [];
        "ieee754@^1.1.4" = s."ieee754@1.1.12";
        "ignore-walk@3.0.1" = f "ignore-walk" "3.0.1" y "a83e62e7d272ac0e3b551aaa82831a19b69f82f8" [
          (s."minimatch@^3.0.4")
          ];
        "ignore-walk@^3.0.1" = s."ignore-walk@3.0.1";
        "import-fresh@2.0.0" = f "import-fresh" "2.0.0" y "d81355c15612d386c61f9ddd3922d4304822a546" [
          (s."caller-path@^2.0.0")
          (s."resolve-from@^3.0.0")
          ];
        "import-fresh@^2.0.0" = s."import-fresh@2.0.0";
        "indexes-of@1.0.1" = f "indexes-of" "1.0.1" y "f30f716c8e2bd346c7b67d3df3915566a7c05607" [];
        "indexes-of@^1.0.1" = s."indexes-of@1.0.1";
        "indexof@0.0.1" = f "indexof" "0.0.1" y "82dc336d232b9062179d05ab3293a66059fd435d" [];
        "inflight@1.0.6" = f "inflight" "1.0.6" y "49bd6331d7d02d0c09bc910a1075ba8165b56df9" [
          (s."once@^1.3.0")
          (s."wrappy@1")
          ];
        "inflight@^1.0.4" = s."inflight@1.0.6";
        "inherits@2" = s."inherits@2.0.3";
        "inherits@2.0.1" = f "inherits" "2.0.1" y "b17d08d326b4423e568eff719f91b0b1cbdf69f1" [];
        "inherits@2.0.3" = f "inherits" "2.0.3" y "633c2c83e3da42a502f52466022480f4208261de" [];
        "inherits@^2.0.1" = s."inherits@2.0.3";
        "inherits@^2.0.3" = s."inherits@2.0.3";
        "inherits@~2.0.1" = s."inherits@2.0.3";
        "inherits@~2.0.3" = s."inherits@2.0.3";
        "ini@1.3.5" = f "ini" "1.3.5" y "eee25f56db1c9ec6085e0c22778083f596abf927" [];
        "ini@~1.3.0" = s."ini@1.3.5";
        "interpret@1.2.0" = f "interpret" "1.2.0" y "d5061a6224be58e8083985f5014d844359576296" [];
        "interpret@^1.0.0" = s."interpret@1.2.0";
        "invariant@2.2.4" = f "invariant" "2.2.4" y "610f3c92c9359ce1db616e538008d23ff35158e6" [
          (s."loose-envify@^1.0.0")
          ];
        "invariant@^2.2.2" = s."invariant@2.2.4";
        "invert-kv@1.0.0" = f "invert-kv" "1.0.0" y "104a8e4aaca6d3d8cd157a8ef8bfab2d7a3ffdb6" [];
        "invert-kv@^1.0.0" = s."invert-kv@1.0.0";
        "is-absolute-url@2.1.0" = f "is-absolute-url" "2.1.0" y "50530dfb84fcc9aa7dbe7852e83a37b93b9f2aa6" [];
        "is-absolute-url@^2.0.0" = s."is-absolute-url@2.1.0";
        "is-accessor-descriptor@0.1.6" = f "is-accessor-descriptor" "0.1.6" y "a9e12cb3ae8d876727eeef3843f8a0897b5c98d6" [
          (s."kind-of@^3.0.2")
          ];
        "is-accessor-descriptor@1.0.0" = f "is-accessor-descriptor" "1.0.0" y "169c2f6d3df1f992618072365c9b0ea1f6878656" [
          (s."kind-of@^6.0.0")
          ];
        "is-accessor-descriptor@^0.1.6" = s."is-accessor-descriptor@0.1.6";
        "is-accessor-descriptor@^1.0.0" = s."is-accessor-descriptor@1.0.0";
        "is-arrayish@0.2.1" = f "is-arrayish" "0.2.1" y "77c99840527aa8ecb1a8ba697b80645a7a926a9d" [];
        "is-arrayish@0.3.2" = f "is-arrayish" "0.3.2" y "4574a2ae56f7ab206896fb431eaeed066fdf8f03" [];
        "is-arrayish@^0.2.1" = s."is-arrayish@0.2.1";
        "is-arrayish@^0.3.1" = s."is-arrayish@0.3.2";
        "is-binary-path@1.0.1" = f "is-binary-path" "1.0.1" y "75f16642b480f187a711c814161fd3a4a7655898" [
          (s."binary-extensions@^1.0.0")
          ];
        "is-binary-path@^1.0.0" = s."is-binary-path@1.0.1";
        "is-buffer@1.1.6" = f "is-buffer" "1.1.6" y "efaa2ea9daa0d7ab2ea13a97b2b8ad51fefbe8be" [];
        "is-buffer@^1.1.5" = s."is-buffer@1.1.6";
        "is-callable@1.1.4" = f "is-callable" "1.1.4" y "1e1adf219e1eeb684d691f9d6a05ff0d30a24d75" [];
        "is-callable@^1.1.4" = s."is-callable@1.1.4";
        "is-color-stop@1.1.0" = f "is-color-stop" "1.1.0" y "cfff471aee4dd5c9e158598fbe12967b5cdad345" [
          (s."css-color-names@^0.0.4")
          (s."hex-color-regex@^1.1.0")
          (s."hsl-regex@^1.0.0")
          (s."hsla-regex@^1.0.0")
          (s."rgb-regex@^1.0.1")
          (s."rgba-regex@^1.0.0")
          ];
        "is-color-stop@^1.0.0" = s."is-color-stop@1.1.0";
        "is-data-descriptor@0.1.4" = f "is-data-descriptor" "0.1.4" y "0b5ee648388e2c860282e793f1856fec3f301b56" [
          (s."kind-of@^3.0.2")
          ];
        "is-data-descriptor@1.0.0" = f "is-data-descriptor" "1.0.0" y "d84876321d0e7add03990406abbbbd36ba9268c7" [
          (s."kind-of@^6.0.0")
          ];
        "is-data-descriptor@^0.1.4" = s."is-data-descriptor@0.1.4";
        "is-data-descriptor@^1.0.0" = s."is-data-descriptor@1.0.0";
        "is-date-object@1.0.1" = f "is-date-object" "1.0.1" y "9aa20eb6aeebbff77fbd33e74ca01b33581d3a16" [];
        "is-date-object@^1.0.1" = s."is-date-object@1.0.1";
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
        "is-directory@0.3.1" = f "is-directory" "0.3.1" y "61339b6f2475fc772fd9c9d83f5c8575dc154ae1" [];
        "is-directory@^0.3.1" = s."is-directory@0.3.1";
        "is-dotfile@1.0.3" = f "is-dotfile" "1.0.3" y "a6a2f32ffd2dfb04f5ca25ecd0f6b83cf798a1e1" [];
        "is-dotfile@^1.0.0" = s."is-dotfile@1.0.3";
        "is-eot@1.0.0" = f "is-eot" "1.0.0" y "e849c40f0e18a6853c0d6b6bac24ef1f2c739e6b" [];
        "is-eot@^1.0.0" = s."is-eot@1.0.0";
        "is-equal-shallow@0.1.3" = f "is-equal-shallow" "0.1.3" y "2238098fc221de0bcfa5d9eac4c45d638aa1c534" [
          (s."is-primitive@^2.0.0")
          ];
        "is-equal-shallow@^0.1.3" = s."is-equal-shallow@0.1.3";
        "is-extendable@0.1.1" = f "is-extendable" "0.1.1" y "62b110e289a471418e3ec36a617d472e301dfc89" [];
        "is-extendable@1.0.1" = f "is-extendable" "1.0.1" y "a7470f9e426733d81bd81e1155264e3a3507cab4" [
          (s."is-plain-object@^2.0.4")
          ];
        "is-extendable@^0.1.0" = s."is-extendable@0.1.1";
        "is-extendable@^0.1.1" = s."is-extendable@0.1.1";
        "is-extendable@^1.0.1" = s."is-extendable@1.0.1";
        "is-extglob@1.0.0" = f "is-extglob" "1.0.0" y "ac468177c4943405a092fc8f29760c6ffc6206c0" [];
        "is-extglob@2.1.1" = f "is-extglob" "2.1.1" y "a88c02535791f02ed37c76a1b9ea9773c833f8c2" [];
        "is-extglob@^1.0.0" = s."is-extglob@1.0.0";
        "is-extglob@^2.1.0" = s."is-extglob@2.1.1";
        "is-extglob@^2.1.1" = s."is-extglob@2.1.1";
        "is-finite@1.0.2" = f "is-finite" "1.0.2" y "cc6677695602be550ef11e8b4aa6305342b6d0aa" [
          (s."number-is-nan@^1.0.0")
          ];
        "is-finite@^1.0.0" = s."is-finite@1.0.2";
        "is-fullwidth-code-point@1.0.0" = f "is-fullwidth-code-point" "1.0.0" y "ef9e31386f031a7f0d643af82fde50c457ef00cb" [
          (s."number-is-nan@^1.0.0")
          ];
        "is-fullwidth-code-point@2.0.0" = f "is-fullwidth-code-point" "2.0.0" y "a3b30a5c4f199183167aaab93beefae3ddfb654f" [];
        "is-fullwidth-code-point@^1.0.0" = s."is-fullwidth-code-point@1.0.0";
        "is-fullwidth-code-point@^2.0.0" = s."is-fullwidth-code-point@2.0.0";
        "is-glob@2.0.1" = f "is-glob" "2.0.1" y "d096f926a3ded5600f3fdfd91198cb0888c2d863" [
          (s."is-extglob@^1.0.0")
          ];
        "is-glob@3.1.0" = f "is-glob" "3.1.0" y "7ba5ae24217804ac70707b96922567486cc3e84a" [
          (s."is-extglob@^2.1.0")
          ];
        "is-glob@4.0.0" = f "is-glob" "4.0.0" y "9521c76845cc2610a85203ddf080a958c2ffabc0" [
          (s."is-extglob@^2.1.1")
          ];
        "is-glob@^2.0.0" = s."is-glob@2.0.1";
        "is-glob@^2.0.1" = s."is-glob@2.0.1";
        "is-glob@^3.1.0" = s."is-glob@3.1.0";
        "is-glob@^4.0.0" = s."is-glob@4.0.0";
        "is-number@2.1.0" = f "is-number" "2.1.0" y "01fcbbb393463a548f2f466cce16dece49db908f" [
          (s."kind-of@^3.0.2")
          ];
        "is-number@3.0.0" = f "is-number" "3.0.0" y "24fd6201a4782cf50561c810276afc7d12d71195" [
          (s."kind-of@^3.0.2")
          ];
        "is-number@4.0.0" = f "is-number" "4.0.0" y "0026e37f5454d73e356dfe6564699867c6a7f0ff" [];
        "is-number@^2.1.0" = s."is-number@2.1.0";
        "is-number@^3.0.0" = s."is-number@3.0.0";
        "is-number@^4.0.0" = s."is-number@4.0.0";
        "is-obj@1.0.1" = f "is-obj" "1.0.1" y "3e4729ac1f5fde025cd7d83a896dab9f4f67db0f" [];
        "is-obj@^1.0.0" = s."is-obj@1.0.1";
        "is-otf@0.1.2" = f "is-otf" "0.1.2" y "5a6e2ab3a0b13b92a2912c1a95c73b5a574b44cc" [
          (s."b3b@0.0.1")
          ];
        "is-otf@^0.1.1" = s."is-otf@0.1.2";
        "is-plain-object@2.0.4" = f "is-plain-object" "2.0.4" y "2c163b3fafb1b606d9d17928f05c2a1c38e07677" [
          (s."isobject@^3.0.1")
          ];
        "is-plain-object@^2.0.1" = s."is-plain-object@2.0.4";
        "is-plain-object@^2.0.3" = s."is-plain-object@2.0.4";
        "is-plain-object@^2.0.4" = s."is-plain-object@2.0.4";
        "is-posix-bracket@0.1.1" = f "is-posix-bracket" "0.1.1" y "3334dc79774368e92f016e6fbc0a88f5cd6e6bc4" [];
        "is-posix-bracket@^0.1.0" = s."is-posix-bracket@0.1.1";
        "is-primitive@2.0.0" = f "is-primitive" "2.0.0" y "207bab91638499c07b2adf240a41a87210034575" [];
        "is-primitive@^2.0.0" = s."is-primitive@2.0.0";
        "is-regex@1.0.4" = f "is-regex" "1.0.4" y "5517489b547091b0930e095654ced25ee97e9491" [
          (s."has@^1.0.1")
          ];
        "is-regex@^1.0.4" = s."is-regex@1.0.4";
        "is-resolvable@1.1.0" = f "is-resolvable" "1.1.0" y "fb18f87ce1feb925169c9a407c19318a3206ed88" [];
        "is-resolvable@^1.0.0" = s."is-resolvable@1.1.0";
        "is-svg@3.0.0" = f "is-svg" "3.0.0" y "9321dbd29c212e5ca99c4fa9794c714bcafa2f75" [
          (s."html-comment-regex@^1.1.0")
          ];
        "is-svg@^3.0.0" = s."is-svg@3.0.0";
        "is-symbol@1.0.2" = f "is-symbol" "1.0.2" y "a055f6ae57192caee329e7a860118b497a950f38" [
          (s."has-symbols@^1.0.0")
          ];
        "is-symbol@^1.0.2" = s."is-symbol@1.0.2";
        "is-ttf@0.2.2" = f "is-ttf" "0.2.2" y "7155824a33867ee4fa89c79e615e3d4716eb1b3a" [
          (s."b3b@0.0.1")
          ];
        "is-ttf@^0.2.1" = s."is-ttf@0.2.2";
        "is-utf8@0.2.1" = f "is-utf8" "0.2.1" y "4b0da1442104d1b336340e80797e865cf39f7d72" [];
        "is-utf8@^0.2.0" = s."is-utf8@0.2.1";
        "is-windows@1.0.2" = f "is-windows" "1.0.2" y "d1850eb9791ecd18e6182ce12a30f396634bb19d" [];
        "is-windows@^1.0.0" = s."is-windows@1.0.2";
        "is-windows@^1.0.2" = s."is-windows@1.0.2";
        "is-woff2@1.0.0" = f "is-woff2" "1.0.0" y "5eb9cad96d9c3d1d384f26792f95324e1582edd8" [];
        "is-woff2@^1.0.0" = s."is-woff2@1.0.0";
        "is-woff@1.0.3" = f "is-woff" "1.0.3" y "4951de604a9218f458c2c18c64c835802e02fa6b" [];
        "is-woff@^1.0.1" = s."is-woff@1.0.3";
        "isarray@1.0.0" = f "isarray" "1.0.0" y "bb935d48582cba168c06834957a54a3e07124f11" [];
        "isarray@^1.0.0" = s."isarray@1.0.0";
        "isarray@~1.0.0" = s."isarray@1.0.0";
        "isexe@2.0.0" = f "isexe" "2.0.0" y "e8fbf374dc556ff8947a10dcb0572d633f2cfa10" [];
        "isexe@^2.0.0" = s."isexe@2.0.0";
        "isobject@2.1.0" = f "isobject" "2.1.0" y "f065561096a3f1da2ef46272f815c840d87e0c89" [
          (s."isarray@1.0.0")
          ];
        "isobject@3.0.1" = f "isobject" "3.0.1" y "4e431e92b11a9731636aa1f9c8d1ccbcfdab78df" [];
        "isobject@^2.0.0" = s."isobject@2.1.0";
        "isobject@^3.0.0" = s."isobject@3.0.1";
        "isobject@^3.0.1" = s."isobject@3.0.1";
        "js-base64@2.1.9" = f "js-base64" "2.1.9" y "f0e80ae039a4bd654b5f281fc93f04a914a7fcce" [];
        "js-base64@~2.1.8" = s."js-base64@2.1.9";
        "js-tokens@3.0.2" = f "js-tokens" "3.0.2" y "9866df395102130e38f7f996bceb65443209c25b" [];
        "js-tokens@4.0.0" = f "js-tokens" "4.0.0" y "19203fb59991df98e3a287050d4647cdeaf32499" [];
        "js-tokens@^3.0.0 || ^4.0.0" = s."js-tokens@4.0.0";
        "js-tokens@^3.0.2" = s."js-tokens@3.0.2";
        "js-yaml@3.12.1" = f "js-yaml" "3.12.1" y "295c8632a18a23e054cf5c9d3cecafe678167600" [
          (s."argparse@^1.0.7")
          (s."esprima@^4.0.0")
          ];
        "js-yaml@^3.12.0" = s."js-yaml@3.12.1";
        "js-yaml@^3.9.0" = s."js-yaml@3.12.1";
        "jsesc@1.3.0" = f "jsesc" "1.3.0" y "46c3fec8c1892b12b0833db9bc7622176dbab34b" [];
        "jsesc@^1.3.0" = s."jsesc@1.3.0";
        "json-loader@0.5.7" = f "json-loader" "0.5.7" y "dca14a70235ff82f0ac9a3abeb60d337a365185d" [];
        "json-loader@^0.5.4" = s."json-loader@0.5.7";
        "json-parse-better-errors@1.0.2" = f "json-parse-better-errors" "1.0.2" y "bb867cfb3450e69107c131d1c514bab3dc8bcaa9" [];
        "json-parse-better-errors@^1.0.1" = s."json-parse-better-errors@1.0.2";
        "json-stable-stringify@1.0.1" = f "json-stable-stringify" "1.0.1" y "9a759d39c5f2ff503fd5300646ed445f88c4f9af" [
          (s."jsonify@~0.0.0")
          ];
        "json-stable-stringify@^1.0.1" = s."json-stable-stringify@1.0.1";
        "json5@0.5.1" = f "json5" "0.5.1" y "1eade7acc012034ad84e2396767ead9fa5495821" [];
        "json5@1.0.1" = f "json5" "1.0.1" y "779fb0018604fa854eacbf6252180d83543e3dbe" [
          (s."minimist@^1.2.0")
          ];
        "json5@^0.5.0" = s."json5@0.5.1";
        "json5@^0.5.1" = s."json5@0.5.1";
        "json5@^1.0.1" = s."json5@1.0.1";
        "jsonify@0.0.0" = f "jsonify" "0.0.0" y "2c74b6ee41d93ca51b7b5aaee8f503631d252a73" [];
        "jsonify@~0.0.0" = s."jsonify@0.0.0";
        "kind-of@3.2.2" = f "kind-of" "3.2.2" y "31ea21a734bab9bbb0f32466d893aea51e4a3c64" [
          (s."is-buffer@^1.1.5")
          ];
        "kind-of@4.0.0" = f "kind-of" "4.0.0" y "20813df3d712928b207378691a45066fae72dd57" [
          (s."is-buffer@^1.1.5")
          ];
        "kind-of@5.1.0" = f "kind-of" "5.1.0" y "729c91e2d857b7a419a1f9aa65685c4c33f5845d" [];
        "kind-of@6.0.2" = f "kind-of" "6.0.2" y "01146b36a6218e64e58f3a8d66de5d7fc6f6d051" [];
        "kind-of@^3.0.2" = s."kind-of@3.2.2";
        "kind-of@^3.0.3" = s."kind-of@3.2.2";
        "kind-of@^3.2.0" = s."kind-of@3.2.2";
        "kind-of@^4.0.0" = s."kind-of@4.0.0";
        "kind-of@^5.0.0" = s."kind-of@5.1.0";
        "kind-of@^6.0.0" = s."kind-of@6.0.2";
        "kind-of@^6.0.2" = s."kind-of@6.0.2";
        "lazy-cache@1.0.4" = f "lazy-cache" "1.0.4" y "a1d78fc3a50474cb80845d3b3b6e1da49a446e8e" [];
        "lazy-cache@^1.0.3" = s."lazy-cache@1.0.4";
        "lcid@1.0.0" = f "lcid" "1.0.0" y "308accafa0bc483a3867b4b6f2b9506251d1b835" [
          (s."invert-kv@^1.0.0")
          ];
        "lcid@^1.0.0" = s."lcid@1.0.0";
        "load-json-file@1.1.0" = f "load-json-file" "1.1.0" y "956905708d58b4bab4c2261b04f59f31c99374c0" [
          (s."graceful-fs@^4.1.2")
          (s."parse-json@^2.2.0")
          (s."pify@^2.0.0")
          (s."pinkie-promise@^2.0.0")
          (s."strip-bom@^2.0.0")
          ];
        "load-json-file@^1.0.0" = s."load-json-file@1.1.0";
        "loader-runner@2.4.0" = f "loader-runner" "2.4.0" y "ed47066bfe534d7e84c4c7b9998c2a75607d9357" [];
        "loader-runner@^2.3.0" = s."loader-runner@2.4.0";
        "loader-utils@0.2.17" = f "loader-utils" "0.2.17" y "f86e6374d43205a6e6c60e9196f17c0299bfb348" [
          (s."big.js@^3.1.3")
          (s."emojis-list@^2.0.0")
          (s."json5@^0.5.0")
          (s."object-assign@^4.0.1")
          ];
        "loader-utils@1.2.3" = f "loader-utils" "1.2.3" y "1ff5dc6911c9f0a062531a4c04b609406108c2c7" [
          (s."big.js@^5.2.2")
          (s."emojis-list@^2.0.0")
          (s."json5@^1.0.1")
          ];
        "loader-utils@^0.2.16" = s."loader-utils@0.2.17";
        "loader-utils@^1.0.2" = s."loader-utils@1.2.3";
        "locate-path@2.0.0" = f "locate-path" "2.0.0" y "2b568b265eec944c6d9c0de9c3dbbbca0354cd8e" [
          (s."p-locate@^2.0.0")
          (s."path-exists@^3.0.0")
          ];
        "locate-path@^2.0.0" = s."locate-path@2.0.0";
        "lodash.memoize@4.1.2" = f "lodash.memoize" "4.1.2" y "bcc6c49a42a2840ed997f323eada5ecd182e0bfe" [];
        "lodash.memoize@^4.1.2" = s."lodash.memoize@4.1.2";
        "lodash.uniq@4.5.0" = f "lodash.uniq" "4.5.0" y "d0225373aeb652adc1bc82e4945339a842754773" [];
        "lodash.uniq@^4.5.0" = s."lodash.uniq@4.5.0";
        "lodash@4.17.11" = f "lodash" "4.17.11" y "b39ea6229ef607ecd89e2c8df12536891cac9b8d" [];
        "lodash@^4.17.10" = s."lodash@4.17.11";
        "lodash@^4.17.4" = s."lodash@4.17.11";
        "longest@1.0.1" = f "longest" "1.0.1" y "30a0b2da38f73770e8294a0d22e6625ed77d0097" [];
        "longest@^1.0.1" = s."longest@1.0.1";
        "loose-envify@1.4.0" = f "loose-envify" "1.4.0" y "71ee51fa7be4caec1a63839f7e682d8132d30caf" [
          (s."js-tokens@^3.0.0 || ^4.0.0")
          ];
        "loose-envify@^1.0.0" = s."loose-envify@1.4.0";
        "make-dir@1.3.0" = f "make-dir" "1.3.0" y "79c1033b80515bd6d24ec9933e860ca75ee27f0c" [
          (s."pify@^3.0.0")
          ];
        "make-dir@^1.0.0" = s."make-dir@1.3.0";
        "map-cache@0.2.2" = f "map-cache" "0.2.2" y "c32abd0bd6525d9b051645bb4f26ac5dc98a0dbf" [];
        "map-cache@^0.2.2" = s."map-cache@0.2.2";
        "map-visit@1.0.0" = f "map-visit" "1.0.0" y "ecdca8f13144e660f1b5bd41f12f3479d98dfb8f" [
          (s."object-visit@^1.0.0")
          ];
        "map-visit@^1.0.0" = s."map-visit@1.0.0";
        "math-random@1.0.4" = f "math-random" "1.0.4" y "5dd6943c938548267016d4e34f057583080c514c" [];
        "math-random@^1.0.1" = s."math-random@1.0.4";
        "md5.js@1.3.5" = f "md5.js" "1.3.5" y "b5d07b8e3216e3e27cd728d72f70d1e6a342005f" [
          (s."hash-base@^3.0.0")
          (s."inherits@^2.0.1")
          (s."safe-buffer@^5.1.2")
          ];
        "md5.js@^1.3.4" = s."md5.js@1.3.5";
        "mdn-data@1.1.4" = f "mdn-data" "1.1.4" y "50b5d4ffc4575276573c4eedb8780812a8419f01" [];
        "mdn-data@~1.1.0" = s."mdn-data@1.1.4";
        "memory-fs@0.4.1" = f "memory-fs" "0.4.1" y "3a9a20b8462523e447cfbc7e8bb80ed667bfc552" [
          (s."errno@^0.1.3")
          (s."readable-stream@^2.0.1")
          ];
        "memory-fs@^0.4.0" = s."memory-fs@0.4.1";
        "memory-fs@~0.4.1" = s."memory-fs@0.4.1";
        "micromatch@2.3.11" = f "micromatch" "2.3.11" y "86677c97d1720b363431d04d0d15293bd38c1565" [
          (s."arr-diff@^2.0.0")
          (s."array-unique@^0.2.1")
          (s."braces@^1.8.2")
          (s."expand-brackets@^0.1.4")
          (s."extglob@^0.3.1")
          (s."filename-regex@^2.0.0")
          (s."is-extglob@^1.0.0")
          (s."is-glob@^2.0.1")
          (s."kind-of@^3.0.2")
          (s."normalize-path@^2.0.1")
          (s."object.omit@^2.0.0")
          (s."parse-glob@^3.0.4")
          (s."regex-cache@^0.4.2")
          ];
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
        "micromatch@^2.1.5" = s."micromatch@2.3.11";
        "micromatch@^3.1.10" = s."micromatch@3.1.10";
        "micromatch@^3.1.4" = s."micromatch@3.1.10";
        "miller-rabin@4.0.1" = f "miller-rabin" "4.0.1" y "f080351c865b0dc562a8462966daa53543c78a4d" [
          (s."bn.js@^4.0.0")
          (s."brorand@^1.0.1")
          ];
        "miller-rabin@^4.0.0" = s."miller-rabin@4.0.1";
        "minimalistic-assert@1.0.1" = f "minimalistic-assert" "1.0.1" y "2e194de044626d4a10e7f7fbc00ce73e83e4d5c7" [];
        "minimalistic-assert@^1.0.0" = s."minimalistic-assert@1.0.1";
        "minimalistic-assert@^1.0.1" = s."minimalistic-assert@1.0.1";
        "minimalistic-crypto-utils@1.0.1" = f "minimalistic-crypto-utils" "1.0.1" y "f6c00c1c0b082246e5c4d99dfb8c7c083b2b582a" [];
        "minimalistic-crypto-utils@^1.0.0" = s."minimalistic-crypto-utils@1.0.1";
        "minimalistic-crypto-utils@^1.0.1" = s."minimalistic-crypto-utils@1.0.1";
        "minimatch@3.0.4" = f "minimatch" "3.0.4" y "5166e286457f03306064be5497e8dbb0c3d32083" [
          (s."brace-expansion@^1.1.7")
          ];
        "minimatch@^3.0.4" = s."minimatch@3.0.4";
        "minimist@0.0.8" = f "minimist" "0.0.8" y "857fcabfc3397d2625b8228262e86aa7a011b05d" [];
        "minimist@1.2.0" = f "minimist" "1.2.0" y "a35008b20f41383eec1fb914f4cd5df79a264284" [];
        "minimist@^1.2.0" = s."minimist@1.2.0";
        "minipass@2.3.5" = f "minipass" "2.3.5" y "cacebe492022497f656b0f0f51e2682a9ed2d848" [
          (s."safe-buffer@^5.1.2")
          (s."yallist@^3.0.0")
          ];
        "minipass@^2.2.1" = s."minipass@2.3.5";
        "minipass@^2.3.4" = s."minipass@2.3.5";
        "minizlib@1.2.1" = f "minizlib" "1.2.1" y "dd27ea6136243c7c880684e8672bb3a45fd9b614" [
          (s."minipass@^2.2.1")
          ];
        "minizlib@^1.1.1" = s."minizlib@1.2.1";
        "mixin-deep@1.3.1" = f "mixin-deep" "1.3.1" y "a49e7268dce1a0d9698e45326c5626df3543d0fe" [
          (s."for-in@^1.0.2")
          (s."is-extendable@^1.0.1")
          ];
        "mixin-deep@^1.2.0" = s."mixin-deep@1.3.1";
        "mkdirp@0.5.1" = f "mkdirp" "0.5.1" y "30057438eac6cf7f8c4767f38648d6697d75c903" [
          (s."minimist@0.0.8")
          ];
        "mkdirp@^0.5.0" = s."mkdirp@0.5.1";
        "mkdirp@^0.5.1" = s."mkdirp@0.5.1";
        "mkdirp@~0.5.0" = s."mkdirp@0.5.1";
        "mkdirp@~0.5.1" = s."mkdirp@0.5.1";
        "ms@2.0.0" = f "ms" "2.0.0" y "5608aeadfc00be6c2901df5f9861788de0d597c8" [];
        "nan@2.12.1" = f "nan" "2.12.1" y "7b1aa193e9aa86057e3c7bbd0ac448e770925552" [];
        "nan@^2.9.2" = s."nan@2.12.1";
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
        "needle@2.2.4" = f "needle" "2.2.4" y "51931bff82533b1928b7d1d69e01f1b00ffd2a4e" [
          (s."debug@^2.1.2")
          (s."iconv-lite@^0.4.4")
          (s."sax@^1.2.4")
          ];
        "needle@^2.2.1" = s."needle@2.2.4";
        "neo-async@2.6.0" = f "neo-async" "2.6.0" y "b9d15e4d71c6762908654b5183ed38b753340835" [];
        "neo-async@^2.5.0" = s."neo-async@2.6.0";
        "nice-try@1.0.5" = f "nice-try" "1.0.5" y "a3378a7696ce7d223e88fc9b764bd7ef1089e366" [];
        "nice-try@^1.0.4" = s."nice-try@1.0.5";
        "node-libs-browser@2.2.0" = f "node-libs-browser" "2.2.0" y "c72f60d9d46de08a940dedbb25f3ffa2f9bbaa77" [
          (s."assert@^1.1.1")
          (s."browserify-zlib@^0.2.0")
          (s."buffer@^4.3.0")
          (s."console-browserify@^1.1.0")
          (s."constants-browserify@^1.0.0")
          (s."crypto-browserify@^3.11.0")
          (s."domain-browser@^1.1.1")
          (s."events@^3.0.0")
          (s."https-browserify@^1.0.0")
          (s."os-browserify@^0.3.0")
          (s."path-browserify@0.0.0")
          (s."process@^0.11.10")
          (s."punycode@^1.2.4")
          (s."querystring-es3@^0.2.0")
          (s."readable-stream@^2.3.3")
          (s."stream-browserify@^2.0.1")
          (s."stream-http@^2.7.2")
          (s."string_decoder@^1.0.0")
          (s."timers-browserify@^2.0.4")
          (s."tty-browserify@0.0.0")
          (s."url@^0.11.0")
          (s."util@^0.11.0")
          (s."vm-browserify@0.0.4")
          ];
        "node-libs-browser@^2.0.0" = s."node-libs-browser@2.2.0";
        "node-pre-gyp@0.10.3" = f "node-pre-gyp" "0.10.3" y "3070040716afdc778747b61b6887bf78880b80fc" [
          (s."detect-libc@^1.0.2")
          (s."mkdirp@^0.5.1")
          (s."needle@^2.2.1")
          (s."nopt@^4.0.1")
          (s."npm-packlist@^1.1.6")
          (s."npmlog@^4.0.2")
          (s."rc@^1.2.7")
          (s."rimraf@^2.6.1")
          (s."semver@^5.3.0")
          (s."tar@^4")
          ];
        "node-pre-gyp@^0.10.0" = s."node-pre-gyp@0.10.3";
        "node-releases@1.1.7" = f "node-releases" "1.1.7" y "b09a10394d0ed8f7778f72bb861dde68b146303b" [
          (s."semver@^5.3.0")
          ];
        "node-releases@^1.1.3" = s."node-releases@1.1.7";
        "nopt@4.0.1" = f "nopt" "4.0.1" y "d0d4685afd5415193c8c7505602d0d17cd64474d" [
          (s."abbrev@1")
          (s."osenv@^0.1.4")
          ];
        "nopt@^4.0.1" = s."nopt@4.0.1";
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
        "normalize-path@3.0.0" = f "normalize-path" "3.0.0" y "0dcd69ff23a1c9b11fd0978316644a0388216a65" [];
        "normalize-path@^2.0.0" = s."normalize-path@2.1.1";
        "normalize-path@^2.0.1" = s."normalize-path@2.1.1";
        "normalize-path@^2.1.1" = s."normalize-path@2.1.1";
        "normalize-path@^3.0.0" = s."normalize-path@3.0.0";
        "normalize-range@0.1.2" = f "normalize-range" "0.1.2" y "2d10c06bdfd312ea9777695a4d28439456b75942" [];
        "normalize-range@^0.1.2" = s."normalize-range@0.1.2";
        "normalize-url@3.3.0" = f "normalize-url" "3.3.0" y "b2e1c4dc4f7c6d57743df733a4f5978d18650559" [];
        "normalize-url@^3.0.0" = s."normalize-url@3.3.0";
        "npm-bundled@1.0.6" = f "npm-bundled" "1.0.6" y "e7ba9aadcef962bb61248f91721cd932b3fe6bdd" [];
        "npm-bundled@^1.0.1" = s."npm-bundled@1.0.6";
        "npm-packlist@1.3.0" = f "npm-packlist" "1.3.0" y "7f01e8e44408341379ca98cfd756e7b29bd2626c" [
          (s."ignore-walk@^3.0.1")
          (s."npm-bundled@^1.0.1")
          ];
        "npm-packlist@^1.1.6" = s."npm-packlist@1.3.0";
        "npmlog@4.1.2" = f "npmlog" "4.1.2" y "08a7f2a8bf734604779a9efa4ad5cc717abb954b" [
          (s."are-we-there-yet@~1.1.2")
          (s."console-control-strings@~1.1.0")
          (s."gauge@~2.7.3")
          (s."set-blocking@~2.0.0")
          ];
        "npmlog@^4.0.2" = s."npmlog@4.1.2";
        "nth-check@1.0.2" = f "nth-check" "1.0.2" y "b2bd295c37e3dd58a3bf0700376663ba4d9cf05c" [
          (s."boolbase@~1.0.0")
          ];
        "nth-check@^1.0.2" = s."nth-check@1.0.2";
        "num2fraction@1.2.2" = f "num2fraction" "1.2.2" y "6f682b6a027a4e9ddfa4564cd2589d1d4e669ede" [];
        "num2fraction@^1.2.2" = s."num2fraction@1.2.2";
        "number-is-nan@1.0.1" = f "number-is-nan" "1.0.1" y "097b602b53422a522c1afb8790318336941a011d" [];
        "number-is-nan@^1.0.0" = s."number-is-nan@1.0.1";
        "object-assign@4.1.1" = f "object-assign" "4.1.1" y "2109adc7965887cfc05cbbd442cac8bfbb360863" [];
        "object-assign@^4.0.1" = s."object-assign@4.1.1";
        "object-assign@^4.1.0" = s."object-assign@4.1.1";
        "object-copy@0.1.0" = f "object-copy" "0.1.0" y "7e7d858b781bd7c991a41ba975ed3812754e998c" [
          (s."copy-descriptor@^0.1.0")
          (s."define-property@^0.2.5")
          (s."kind-of@^3.0.3")
          ];
        "object-copy@^0.1.0" = s."object-copy@0.1.0";
        "object-keys@1.1.0" = f "object-keys" "1.1.0" y "11bd22348dd2e096a045ab06f6c85bcc340fa032" [];
        "object-keys@^1.0.12" = s."object-keys@1.1.0";
        "object-visit@1.0.1" = f "object-visit" "1.0.1" y "f79c4493af0c5377b59fe39d395e41042dd045bb" [
          (s."isobject@^3.0.0")
          ];
        "object-visit@^1.0.0" = s."object-visit@1.0.1";
        "object.getownpropertydescriptors@2.0.3" = f "object.getownpropertydescriptors" "2.0.3" y "8758c846f5b407adab0f236e0986f14b051caa16" [
          (s."define-properties@^1.1.2")
          (s."es-abstract@^1.5.1")
          ];
        "object.getownpropertydescriptors@^2.0.3" = s."object.getownpropertydescriptors@2.0.3";
        "object.omit@2.0.1" = f "object.omit" "2.0.1" y "1a9c744829f39dbb858c76ca3579ae2a54ebd1fa" [
          (s."for-own@^0.1.4")
          (s."is-extendable@^0.1.1")
          ];
        "object.omit@^2.0.0" = s."object.omit@2.0.1";
        "object.pick@1.3.0" = f "object.pick" "1.3.0" y "87a10ac4c1694bd2e1cbf53591a66141fb5dd747" [
          (s."isobject@^3.0.1")
          ];
        "object.pick@^1.3.0" = s."object.pick@1.3.0";
        "object.values@1.1.0" = f "object.values" "1.1.0" y "bf6810ef5da3e5325790eaaa2be213ea84624da9" [
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.12.0")
          (s."function-bind@^1.1.1")
          (s."has@^1.0.3")
          ];
        "object.values@^1.0.4" = s."object.values@1.1.0";
        "once@1.4.0" = f "once" "1.4.0" y "583b1aa775961d4b113ac17d9c50baef9dd76bd1" [
          (s."wrappy@1")
          ];
        "once@^1.3.0" = s."once@1.4.0";
        "os-browserify@0.3.0" = f "os-browserify" "0.3.0" y "854373c7f5c2315914fc9bfc6bd8238fdda1ec27" [];
        "os-browserify@^0.3.0" = s."os-browserify@0.3.0";
        "os-homedir@1.0.2" = f "os-homedir" "1.0.2" y "ffbc4988336e0e833de0c168c7ef152121aa7fb3" [];
        "os-homedir@^1.0.0" = s."os-homedir@1.0.2";
        "os-locale@1.4.0" = f "os-locale" "1.4.0" y "20f9f17ae29ed345e8bde583b13d2009803c14d9" [
          (s."lcid@^1.0.0")
          ];
        "os-locale@^1.4.0" = s."os-locale@1.4.0";
        "os-tmpdir@1.0.2" = f "os-tmpdir" "1.0.2" y "bbe67406c79aa85c5cfec766fe5734555dfa1274" [];
        "os-tmpdir@^1.0.0" = s."os-tmpdir@1.0.2";
        "os-tmpdir@^1.0.1" = s."os-tmpdir@1.0.2";
        "osenv@0.1.5" = f "osenv" "0.1.5" y "85cdfafaeb28e8677f416e287592b5f3f49ea410" [
          (s."os-homedir@^1.0.0")
          (s."os-tmpdir@^1.0.0")
          ];
        "osenv@^0.1.4" = s."osenv@0.1.5";
        "output-file-sync@1.1.2" = f "output-file-sync" "1.1.2" y "d0a33eefe61a205facb90092e826598d5245ce76" [
          (s."graceful-fs@^4.1.4")
          (s."mkdirp@^0.5.1")
          (s."object-assign@^4.1.0")
          ];
        "output-file-sync@^1.1.2" = s."output-file-sync@1.1.2";
        "p-limit@1.3.0" = f "p-limit" "1.3.0" y "b86bd5f0c25690911c7590fcbfc2010d54b3ccb8" [
          (s."p-try@^1.0.0")
          ];
        "p-limit@^1.1.0" = s."p-limit@1.3.0";
        "p-locate@2.0.0" = f "p-locate" "2.0.0" y "20a0103b222a70c8fd39cc2e580680f3dde5ec43" [
          (s."p-limit@^1.1.0")
          ];
        "p-locate@^2.0.0" = s."p-locate@2.0.0";
        "p-try@1.0.0" = f "p-try" "1.0.0" y "cbc79cdbaf8fd4228e13f621f2b1a237c1b207b3" [];
        "p-try@^1.0.0" = s."p-try@1.0.0";
        "pako@1.0.8" = f "pako" "1.0.8" y "6844890aab9c635af868ad5fecc62e8acbba3ea4" [];
        "pako@~1.0.5" = s."pako@1.0.8";
        "parse-asn1@5.1.3" = f "parse-asn1" "5.1.3" y "1600c6cc0727365d68b97f3aa78939e735a75204" [
          (s."asn1.js@^4.0.0")
          (s."browserify-aes@^1.0.0")
          (s."create-hash@^1.1.0")
          (s."evp_bytestokey@^1.0.0")
          (s."pbkdf2@^3.0.3")
          (s."safe-buffer@^5.1.1")
          ];
        "parse-asn1@^5.0.0" = s."parse-asn1@5.1.3";
        "parse-glob@3.0.4" = f "parse-glob" "3.0.4" y "b2c376cfb11f35513badd173ef0bb6e3a388391c" [
          (s."glob-base@^0.3.0")
          (s."is-dotfile@^1.0.0")
          (s."is-extglob@^1.0.0")
          (s."is-glob@^2.0.0")
          ];
        "parse-glob@^3.0.4" = s."parse-glob@3.0.4";
        "parse-json@2.2.0" = f "parse-json" "2.2.0" y "f480f40434ef80741f8469099f8dea18f55a4dc9" [
          (s."error-ex@^1.2.0")
          ];
        "parse-json@4.0.0" = f "parse-json" "4.0.0" y "be35f5425be1f7f6c747184f98a788cb99477ee0" [
          (s."error-ex@^1.3.1")
          (s."json-parse-better-errors@^1.0.1")
          ];
        "parse-json@^2.2.0" = s."parse-json@2.2.0";
        "parse-json@^4.0.0" = s."parse-json@4.0.0";
        "pascalcase@0.1.1" = f "pascalcase" "0.1.1" y "b363e55e8006ca6fe21784d2db22bd15d7917f14" [];
        "pascalcase@^0.1.1" = s."pascalcase@0.1.1";
        "path-browserify@0.0.0" = f "path-browserify" "0.0.0" y "a0b870729aae214005b7d5032ec2cbbb0fb4451a" [];
        "path-dirname@1.0.2" = f "path-dirname" "1.0.2" y "cc33d24d525e099a5388c0336c6e32b9160609e0" [];
        "path-dirname@^1.0.0" = s."path-dirname@1.0.2";
        "path-exists@2.1.0" = f "path-exists" "2.1.0" y "0feb6c64f0fc518d9a754dd5efb62c7022761f4b" [
          (s."pinkie-promise@^2.0.0")
          ];
        "path-exists@3.0.0" = f "path-exists" "3.0.0" y "ce0ebeaa5f78cb18925ea7d810d7b59b010fd515" [];
        "path-exists@^2.0.0" = s."path-exists@2.1.0";
        "path-exists@^3.0.0" = s."path-exists@3.0.0";
        "path-is-absolute@1.0.1" = f "path-is-absolute" "1.0.1" y "174b9268735534ffbc7ace6bf53a5a9e1b5c5f5f" [];
        "path-is-absolute@^1.0.0" = s."path-is-absolute@1.0.1";
        "path-is-absolute@^1.0.1" = s."path-is-absolute@1.0.1";
        "path-key@2.0.1" = f "path-key" "2.0.1" y "411cadb574c5a140d3a4b1910d40d80cc9f40b40" [];
        "path-key@^2.0.1" = s."path-key@2.0.1";
        "path-parse@1.0.6" = f "path-parse" "1.0.6" y "d62dbb5679405d72c4737ec58600e9ddcf06d24c" [];
        "path-parse@^1.0.6" = s."path-parse@1.0.6";
        "path-type@1.1.0" = f "path-type" "1.1.0" y "59c44f7ee491da704da415da5a4070ba4f8fe441" [
          (s."graceful-fs@^4.1.2")
          (s."pify@^2.0.0")
          (s."pinkie-promise@^2.0.0")
          ];
        "path-type@^1.0.0" = s."path-type@1.1.0";
        "pbkdf2@3.0.17" = f "pbkdf2" "3.0.17" y "976c206530617b14ebb32114239f7b09336e93a6" [
          (s."create-hash@^1.1.2")
          (s."create-hmac@^1.1.4")
          (s."ripemd160@^2.0.1")
          (s."safe-buffer@^5.0.1")
          (s."sha.js@^2.4.8")
          ];
        "pbkdf2@^3.0.3" = s."pbkdf2@3.0.17";
        "pify@2.3.0" = f "pify" "2.3.0" y "ed141a6ac043a849ea588498e7dca8b15330e90c" [];
        "pify@3.0.0" = f "pify" "3.0.0" y "e5a4acd2c101fdf3d9a4d07f0dbc4db49dd28176" [];
        "pify@^2.0.0" = s."pify@2.3.0";
        "pify@^3.0.0" = s."pify@3.0.0";
        "pinkie-promise@2.0.1" = f "pinkie-promise" "2.0.1" y "2135d6dfa7a358c069ac9b178776288228450ffa" [
          (s."pinkie@^2.0.0")
          ];
        "pinkie-promise@^2.0.0" = s."pinkie-promise@2.0.1";
        "pinkie@2.0.4" = f "pinkie" "2.0.4" y "72556b80cfa0d48a974e80e77248e80ed4f7f870" [];
        "pinkie@^2.0.0" = s."pinkie@2.0.4";
        "pkg-dir@2.0.0" = f "pkg-dir" "2.0.0" y "f6d5d1109e19d63edf428e0bd57e12777615334b" [
          (s."find-up@^2.1.0")
          ];
        "pkg-dir@^2.0.0" = s."pkg-dir@2.0.0";
        "posix-character-classes@0.1.1" = f "posix-character-classes" "0.1.1" y "01eac0fe3b5af71a2a6c02feabb8c1fef7e00eab" [];
        "posix-character-classes@^0.1.0" = s."posix-character-classes@0.1.1";
        "postcss-calc@7.0.1" = f "postcss-calc" "7.0.1" y "36d77bab023b0ecbb9789d84dcb23c4941145436" [
          (s."css-unit-converter@^1.1.1")
          (s."postcss@^7.0.5")
          (s."postcss-selector-parser@^5.0.0-rc.4")
          (s."postcss-value-parser@^3.3.1")
          ];
        "postcss-calc@^7.0.1" = s."postcss-calc@7.0.1";
        "postcss-colormin@4.0.3" = f "postcss-colormin" "4.0.3" y "ae060bce93ed794ac71264f08132d550956bd381" [
          (s."browserslist@^4.0.0")
          (s."color@^3.0.0")
          (s."has@^1.0.0")
          (s."postcss@^7.0.0")
          (s."postcss-value-parser@^3.0.0")
          ];
        "postcss-colormin@^4.0.3" = s."postcss-colormin@4.0.3";
        "postcss-convert-values@4.0.1" = f "postcss-convert-values" "4.0.1" y "ca3813ed4da0f812f9d43703584e449ebe189a7f" [
          (s."postcss@^7.0.0")
          (s."postcss-value-parser@^3.0.0")
          ];
        "postcss-convert-values@^4.0.1" = s."postcss-convert-values@4.0.1";
        "postcss-discard-comments@4.0.2" = f "postcss-discard-comments" "4.0.2" y "1fbabd2c246bff6aaad7997b2b0918f4d7af4033" [
          (s."postcss@^7.0.0")
          ];
        "postcss-discard-comments@^4.0.2" = s."postcss-discard-comments@4.0.2";
        "postcss-discard-duplicates@4.0.2" = f "postcss-discard-duplicates" "4.0.2" y "3fe133cd3c82282e550fc9b239176a9207b784eb" [
          (s."postcss@^7.0.0")
          ];
        "postcss-discard-duplicates@^4.0.2" = s."postcss-discard-duplicates@4.0.2";
        "postcss-discard-empty@4.0.1" = f "postcss-discard-empty" "4.0.1" y "c8c951e9f73ed9428019458444a02ad90bb9f765" [
          (s."postcss@^7.0.0")
          ];
        "postcss-discard-empty@^4.0.1" = s."postcss-discard-empty@4.0.1";
        "postcss-discard-overridden@4.0.1" = f "postcss-discard-overridden" "4.0.1" y "652aef8a96726f029f5e3e00146ee7a4e755ff57" [
          (s."postcss@^7.0.0")
          ];
        "postcss-discard-overridden@^4.0.1" = s."postcss-discard-overridden@4.0.1";
        "postcss-discard-unused@4.0.1" = f "postcss-discard-unused" "4.0.1" y "ee7cc66af8c7e8c19bd36f12d09c4bde4039abea" [
          (s."postcss@^7.0.0")
          (s."postcss-selector-parser@^3.0.0")
          (s."uniqs@^2.0.0")
          ];
        "postcss-discard-unused@^4.0.1" = s."postcss-discard-unused@4.0.1";
        "postcss-font-magician@2.2.1" = f "postcss-font-magician" "2.2.1" y "ea07124f5fd5548f8a8cd097f5f43e476a91c803" [
          (s."bootstrap-fonts-complete@^1.0.0")
          (s."directory-fonts-complete@^1.2.0")
          (s."google-fonts-complete@^1.2.2")
          (s."postcss@^6.0.22")
          ];
        "postcss-font-magician@^2.0.0" = s."postcss-font-magician@2.2.1";
        "postcss-merge-idents@4.0.1" = f "postcss-merge-idents" "4.0.1" y "b7df282a92f052ea0a66c62d8f8812e6d2cbed23" [
          (s."cssnano-util-same-parent@^4.0.0")
          (s."has@^1.0.0")
          (s."postcss@^7.0.0")
          (s."postcss-value-parser@^3.0.0")
          ];
        "postcss-merge-idents@^4.0.1" = s."postcss-merge-idents@4.0.1";
        "postcss-merge-longhand@4.0.11" = f "postcss-merge-longhand" "4.0.11" y "62f49a13e4a0ee04e7b98f42bb16062ca2549e24" [
          (s."css-color-names@0.0.4")
          (s."postcss@^7.0.0")
          (s."postcss-value-parser@^3.0.0")
          (s."stylehacks@^4.0.0")
          ];
        "postcss-merge-longhand@^4.0.11" = s."postcss-merge-longhand@4.0.11";
        "postcss-merge-rules@4.0.3" = f "postcss-merge-rules" "4.0.3" y "362bea4ff5a1f98e4075a713c6cb25aefef9a650" [
          (s."browserslist@^4.0.0")
          (s."caniuse-api@^3.0.0")
          (s."cssnano-util-same-parent@^4.0.0")
          (s."postcss@^7.0.0")
          (s."postcss-selector-parser@^3.0.0")
          (s."vendors@^1.0.0")
          ];
        "postcss-merge-rules@^4.0.3" = s."postcss-merge-rules@4.0.3";
        "postcss-minify-font-values@4.0.2" = f "postcss-minify-font-values" "4.0.2" y "cd4c344cce474343fac5d82206ab2cbcb8afd5a6" [
          (s."postcss@^7.0.0")
          (s."postcss-value-parser@^3.0.0")
          ];
        "postcss-minify-font-values@^4.0.2" = s."postcss-minify-font-values@4.0.2";
        "postcss-minify-gradients@4.0.2" = f "postcss-minify-gradients" "4.0.2" y "93b29c2ff5099c535eecda56c4aa6e665a663471" [
          (s."cssnano-util-get-arguments@^4.0.0")
          (s."is-color-stop@^1.0.0")
          (s."postcss@^7.0.0")
          (s."postcss-value-parser@^3.0.0")
          ];
        "postcss-minify-gradients@^4.0.2" = s."postcss-minify-gradients@4.0.2";
        "postcss-minify-params@4.0.2" = f "postcss-minify-params" "4.0.2" y "6b9cef030c11e35261f95f618c90036d680db874" [
          (s."alphanum-sort@^1.0.0")
          (s."browserslist@^4.0.0")
          (s."cssnano-util-get-arguments@^4.0.0")
          (s."postcss@^7.0.0")
          (s."postcss-value-parser@^3.0.0")
          (s."uniqs@^2.0.0")
          ];
        "postcss-minify-params@^4.0.2" = s."postcss-minify-params@4.0.2";
        "postcss-minify-selectors@4.0.2" = f "postcss-minify-selectors" "4.0.2" y "e2e5eb40bfee500d0cd9243500f5f8ea4262fbd8" [
          (s."alphanum-sort@^1.0.0")
          (s."has@^1.0.0")
          (s."postcss@^7.0.0")
          (s."postcss-selector-parser@^3.0.0")
          ];
        "postcss-minify-selectors@^4.0.2" = s."postcss-minify-selectors@4.0.2";
        "postcss-normalize-charset@4.0.1" = f "postcss-normalize-charset" "4.0.1" y "8b35add3aee83a136b0471e0d59be58a50285dd4" [
          (s."postcss@^7.0.0")
          ];
        "postcss-normalize-charset@^4.0.1" = s."postcss-normalize-charset@4.0.1";
        "postcss-normalize-display-values@4.0.2" = f "postcss-normalize-display-values" "4.0.2" y "0dbe04a4ce9063d4667ed2be476bb830c825935a" [
          (s."cssnano-util-get-match@^4.0.0")
          (s."postcss@^7.0.0")
          (s."postcss-value-parser@^3.0.0")
          ];
        "postcss-normalize-display-values@^4.0.2" = s."postcss-normalize-display-values@4.0.2";
        "postcss-normalize-positions@4.0.2" = f "postcss-normalize-positions" "4.0.2" y "05f757f84f260437378368a91f8932d4b102917f" [
          (s."cssnano-util-get-arguments@^4.0.0")
          (s."has@^1.0.0")
          (s."postcss@^7.0.0")
          (s."postcss-value-parser@^3.0.0")
          ];
        "postcss-normalize-positions@^4.0.2" = s."postcss-normalize-positions@4.0.2";
        "postcss-normalize-repeat-style@4.0.2" = f "postcss-normalize-repeat-style" "4.0.2" y "c4ebbc289f3991a028d44751cbdd11918b17910c" [
          (s."cssnano-util-get-arguments@^4.0.0")
          (s."cssnano-util-get-match@^4.0.0")
          (s."postcss@^7.0.0")
          (s."postcss-value-parser@^3.0.0")
          ];
        "postcss-normalize-repeat-style@^4.0.2" = s."postcss-normalize-repeat-style@4.0.2";
        "postcss-normalize-string@4.0.2" = f "postcss-normalize-string" "4.0.2" y "cd44c40ab07a0c7a36dc5e99aace1eca4ec2690c" [
          (s."has@^1.0.0")
          (s."postcss@^7.0.0")
          (s."postcss-value-parser@^3.0.0")
          ];
        "postcss-normalize-string@^4.0.2" = s."postcss-normalize-string@4.0.2";
        "postcss-normalize-timing-functions@4.0.2" = f "postcss-normalize-timing-functions" "4.0.2" y "8e009ca2a3949cdaf8ad23e6b6ab99cb5e7d28d9" [
          (s."cssnano-util-get-match@^4.0.0")
          (s."postcss@^7.0.0")
          (s."postcss-value-parser@^3.0.0")
          ];
        "postcss-normalize-timing-functions@^4.0.2" = s."postcss-normalize-timing-functions@4.0.2";
        "postcss-normalize-unicode@4.0.1" = f "postcss-normalize-unicode" "4.0.1" y "841bd48fdcf3019ad4baa7493a3d363b52ae1cfb" [
          (s."browserslist@^4.0.0")
          (s."postcss@^7.0.0")
          (s."postcss-value-parser@^3.0.0")
          ];
        "postcss-normalize-unicode@^4.0.1" = s."postcss-normalize-unicode@4.0.1";
        "postcss-normalize-url@4.0.1" = f "postcss-normalize-url" "4.0.1" y "10e437f86bc7c7e58f7b9652ed878daaa95faae1" [
          (s."is-absolute-url@^2.0.0")
          (s."normalize-url@^3.0.0")
          (s."postcss@^7.0.0")
          (s."postcss-value-parser@^3.0.0")
          ];
        "postcss-normalize-url@^4.0.1" = s."postcss-normalize-url@4.0.1";
        "postcss-normalize-whitespace@4.0.2" = f "postcss-normalize-whitespace" "4.0.2" y "bf1d4070fe4fcea87d1348e825d8cc0c5faa7d82" [
          (s."postcss@^7.0.0")
          (s."postcss-value-parser@^3.0.0")
          ];
        "postcss-normalize-whitespace@^4.0.2" = s."postcss-normalize-whitespace@4.0.2";
        "postcss-ordered-values@4.1.2" = f "postcss-ordered-values" "4.1.2" y "0cf75c820ec7d5c4d280189559e0b571ebac0eee" [
          (s."cssnano-util-get-arguments@^4.0.0")
          (s."postcss@^7.0.0")
          (s."postcss-value-parser@^3.0.0")
          ];
        "postcss-ordered-values@^4.1.2" = s."postcss-ordered-values@4.1.2";
        "postcss-reduce-idents@4.0.2" = f "postcss-reduce-idents" "4.0.2" y "30447a6ec20941e78e21bd4482a11f569c4f455b" [
          (s."postcss@^7.0.0")
          (s."postcss-value-parser@^3.0.0")
          ];
        "postcss-reduce-idents@^4.0.2" = s."postcss-reduce-idents@4.0.2";
        "postcss-reduce-initial@4.0.3" = f "postcss-reduce-initial" "4.0.3" y "7fd42ebea5e9c814609639e2c2e84ae270ba48df" [
          (s."browserslist@^4.0.0")
          (s."caniuse-api@^3.0.0")
          (s."has@^1.0.0")
          (s."postcss@^7.0.0")
          ];
        "postcss-reduce-initial@^4.0.3" = s."postcss-reduce-initial@4.0.3";
        "postcss-reduce-transforms@4.0.2" = f "postcss-reduce-transforms" "4.0.2" y "17efa405eacc6e07be3414a5ca2d1074681d4e29" [
          (s."cssnano-util-get-match@^4.0.0")
          (s."has@^1.0.0")
          (s."postcss@^7.0.0")
          (s."postcss-value-parser@^3.0.0")
          ];
        "postcss-reduce-transforms@^4.0.2" = s."postcss-reduce-transforms@4.0.2";
        "postcss-selector-parser@3.1.1" = f "postcss-selector-parser" "3.1.1" y "4f875f4afb0c96573d5cf4d74011aee250a7e865" [
          (s."dot-prop@^4.1.1")
          (s."indexes-of@^1.0.1")
          (s."uniq@^1.0.1")
          ];
        "postcss-selector-parser@5.0.0" = f "postcss-selector-parser" "5.0.0" y "249044356697b33b64f1a8f7c80922dddee7195c" [
          (s."cssesc@^2.0.0")
          (s."indexes-of@^1.0.1")
          (s."uniq@^1.0.1")
          ];
        "postcss-selector-parser@^3.0.0" = s."postcss-selector-parser@3.1.1";
        "postcss-selector-parser@^5.0.0-rc.4" = s."postcss-selector-parser@5.0.0";
        "postcss-svgo@4.0.2" = f "postcss-svgo" "4.0.2" y "17b997bc711b333bab143aaed3b8d3d6e3d38258" [
          (s."is-svg@^3.0.0")
          (s."postcss@^7.0.0")
          (s."postcss-value-parser@^3.0.0")
          (s."svgo@^1.0.0")
          ];
        "postcss-svgo@^4.0.2" = s."postcss-svgo@4.0.2";
        "postcss-unique-selectors@4.0.1" = f "postcss-unique-selectors" "4.0.1" y "9446911f3289bfd64c6d680f073c03b1f9ee4bac" [
          (s."alphanum-sort@^1.0.0")
          (s."postcss@^7.0.0")
          (s."uniqs@^2.0.0")
          ];
        "postcss-unique-selectors@^4.0.1" = s."postcss-unique-selectors@4.0.1";
        "postcss-value-parser@3.3.1" = f "postcss-value-parser" "3.3.1" y "9ff822547e2893213cf1c30efa51ac5fd1ba8281" [];
        "postcss-value-parser@^3.0.0" = s."postcss-value-parser@3.3.1";
        "postcss-value-parser@^3.3.1" = s."postcss-value-parser@3.3.1";
        "postcss-zindex@4.0.1" = f "postcss-zindex" "4.0.1" y "8db6a4cec3111e5d3fd99ea70abeda61873d10c1" [
          (s."has@^1.0.0")
          (s."postcss@^7.0.0")
          (s."uniqs@^2.0.0")
          ];
        "postcss-zindex@^4.0.1" = s."postcss-zindex@4.0.1";
        "postcss@4.1.16" = f "postcss" "4.1.16" y "4c449b4c8af9df3caf6d37f8e1e575d0361758dc" [
          (s."es6-promise@~2.3.0")
          (s."js-base64@~2.1.8")
          (s."source-map@~0.4.2")
          ];
        "postcss@6.0.23" = f "postcss" "6.0.23" y "61c82cc328ac60e677645f979054eb98bc0e3324" [
          (s."chalk@^2.4.1")
          (s."source-map@^0.6.1")
          (s."supports-color@^5.4.0")
          ];
        "postcss@7.0.14" = f "postcss" "7.0.14" y "4527ed6b1ca0d82c53ce5ec1a2041c2346bbd6e5" [
          (s."chalk@^2.4.2")
          (s."source-map@^0.6.1")
          (s."supports-color@^6.1.0")
          ];
        "postcss@^4.1.16" = s."postcss@4.1.16";
        "postcss@^6.0.22" = s."postcss@6.0.23";
        "postcss@^7.0.0" = s."postcss@7.0.14";
        "postcss@^7.0.1" = s."postcss@7.0.14";
        "postcss@^7.0.14" = s."postcss@7.0.14";
        "postcss@^7.0.5" = s."postcss@7.0.14";
        "preserve@0.2.0" = f "preserve" "0.2.0" y "815ed1f6ebc65926f865b310c0713bcb3315ce4b" [];
        "preserve@^0.2.0" = s."preserve@0.2.0";
        "private@0.1.8" = f "private" "0.1.8" y "2381edb3689f7a53d653190060fcf822d2f368ff" [];
        "private@^0.1.8" = s."private@0.1.8";
        "process-nextick-args@2.0.0" = f "process-nextick-args" "2.0.0" y "a37d732f4271b4ab1ad070d35508e8290788ffaa" [];
        "process-nextick-args@~2.0.0" = s."process-nextick-args@2.0.0";
        "process@0.11.10" = f "process" "0.11.10" y "7332300e840161bda3e69a1d1d91a7d4bc16f182" [];
        "process@^0.11.10" = s."process@0.11.10";
        "prr@1.0.1" = f "prr" "1.0.1" y "d3fc114ba06995a45ec6893f484ceb1d78f5f476" [];
        "prr@~1.0.1" = s."prr@1.0.1";
        "public-encrypt@4.0.3" = f "public-encrypt" "4.0.3" y "4fcc9d77a07e48ba7527e7cbe0de33d0701331e0" [
          (s."bn.js@^4.1.0")
          (s."browserify-rsa@^4.0.0")
          (s."create-hash@^1.1.0")
          (s."parse-asn1@^5.0.0")
          (s."randombytes@^2.0.1")
          (s."safe-buffer@^5.1.2")
          ];
        "public-encrypt@^4.0.0" = s."public-encrypt@4.0.3";
        "punycode@1.3.2" = f "punycode" "1.3.2" y "9653a036fb7c1ee42342f2325cceefea3926c48d" [];
        "punycode@1.4.1" = f "punycode" "1.4.1" y "c0d5a63b2718800ad8e1eb0fa5269c84dd41845e" [];
        "punycode@^1.2.4" = s."punycode@1.4.1";
        "q@1.5.1" = f "q" "1.5.1" y "7e32f75b41381291d04611f1bf14109ac00651d7" [];
        "q@^1.1.2" = s."q@1.5.1";
        "querystring-es3@0.2.1" = f "querystring-es3" "0.2.1" y "9ec61f79049875707d69414596fd907a4d711e73" [];
        "querystring-es3@^0.2.0" = s."querystring-es3@0.2.1";
        "querystring@0.2.0" = f "querystring" "0.2.0" y "b209849203bb25df820da756e747005878521620" [];
        "randomatic@3.1.1" = f "randomatic" "3.1.1" y "b776efc59375984e36c537b2f51a1f0aff0da1ed" [
          (s."is-number@^4.0.0")
          (s."kind-of@^6.0.0")
          (s."math-random@^1.0.1")
          ];
        "randomatic@^3.0.0" = s."randomatic@3.1.1";
        "randombytes@2.0.6" = f "randombytes" "2.0.6" y "d302c522948588848a8d300c932b44c24231da80" [
          (s."safe-buffer@^5.1.0")
          ];
        "randombytes@^2.0.0" = s."randombytes@2.0.6";
        "randombytes@^2.0.1" = s."randombytes@2.0.6";
        "randombytes@^2.0.5" = s."randombytes@2.0.6";
        "randomfill@1.0.4" = f "randomfill" "1.0.4" y "c92196fc86ab42be983f1bf31778224931d61458" [
          (s."randombytes@^2.0.5")
          (s."safe-buffer@^5.1.0")
          ];
        "randomfill@^1.0.3" = s."randomfill@1.0.4";
        "rc@1.2.8" = f "rc" "1.2.8" y "cd924bf5200a075b83c188cd6b9e211b7fc0d3ed" [
          (s."deep-extend@^0.6.0")
          (s."ini@~1.3.0")
          (s."minimist@^1.2.0")
          (s."strip-json-comments@~2.0.1")
          ];
        "rc@^1.2.7" = s."rc@1.2.8";
        "read-pkg-up@1.0.1" = f "read-pkg-up" "1.0.1" y "9d63c13276c065918d57f002a57f40a1b643fb02" [
          (s."find-up@^1.0.0")
          (s."read-pkg@^1.0.0")
          ];
        "read-pkg-up@^1.0.1" = s."read-pkg-up@1.0.1";
        "read-pkg@1.1.0" = f "read-pkg" "1.1.0" y "f5ffaa5ecd29cb31c0474bca7d756b6bb29e3f28" [
          (s."load-json-file@^1.0.0")
          (s."normalize-package-data@^2.3.2")
          (s."path-type@^1.0.0")
          ];
        "read-pkg@^1.0.0" = s."read-pkg@1.1.0";
        "readable-stream@2.3.6" = f "readable-stream" "2.3.6" y "b11c27d88b8ff1fbe070643cf94b0c79ae1b0aaf" [
          (s."core-util-is@~1.0.0")
          (s."inherits@~2.0.3")
          (s."isarray@~1.0.0")
          (s."process-nextick-args@~2.0.0")
          (s."safe-buffer@~5.1.1")
          (s."string_decoder@~1.1.1")
          (s."util-deprecate@~1.0.1")
          ];
        "readable-stream@^2.0.1" = s."readable-stream@2.3.6";
        "readable-stream@^2.0.2" = s."readable-stream@2.3.6";
        "readable-stream@^2.0.6" = s."readable-stream@2.3.6";
        "readable-stream@^2.3.3" = s."readable-stream@2.3.6";
        "readable-stream@^2.3.6" = s."readable-stream@2.3.6";
        "readdirp@2.2.1" = f "readdirp" "2.2.1" y "0e87622a3325aa33e892285caf8b4e846529a525" [
          (s."graceful-fs@^4.1.11")
          (s."micromatch@^3.1.10")
          (s."readable-stream@^2.0.2")
          ];
        "readdirp@^2.0.0" = s."readdirp@2.2.1";
        "readdirp@^2.2.1" = s."readdirp@2.2.1";
        "regenerator-runtime@0.10.5" = f "regenerator-runtime" "0.10.5" y "336c3efc1220adcedda2c9fab67b5a7955a33658" [];
        "regenerator-runtime@0.11.1" = f "regenerator-runtime" "0.11.1" y "be05ad7f9bf7d22e056f9726cee5017fbf19e2e9" [];
        "regenerator-runtime@^0.10.5" = s."regenerator-runtime@0.10.5";
        "regenerator-runtime@^0.11.0" = s."regenerator-runtime@0.11.1";
        "regex-cache@0.4.4" = f "regex-cache" "0.4.4" y "75bdc58a2a1496cec48a12835bc54c8d562336dd" [
          (s."is-equal-shallow@^0.1.3")
          ];
        "regex-cache@^0.4.2" = s."regex-cache@0.4.4";
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
        "repeat-string@^1.5.2" = s."repeat-string@1.6.1";
        "repeat-string@^1.6.1" = s."repeat-string@1.6.1";
        "repeating@2.0.1" = f "repeating" "2.0.1" y "5214c53a926d3552707527fbab415dbc08d06dda" [
          (s."is-finite@^1.0.0")
          ];
        "repeating@^2.0.0" = s."repeating@2.0.1";
        "require-directory@2.1.1" = f "require-directory" "2.1.1" y "8c64ad5fd30dab1c976e2344ffe7f792a6a6df42" [];
        "require-directory@^2.1.1" = s."require-directory@2.1.1";
        "require-main-filename@1.0.1" = f "require-main-filename" "1.0.1" y "97f717b69d48784f5f526a6c5aa8ffdda055a4d1" [];
        "require-main-filename@^1.0.1" = s."require-main-filename@1.0.1";
        "resolve-from@3.0.0" = f "resolve-from" "3.0.0" y "b22c7af7d9d6881bc8b6e653335eebcb0a188748" [];
        "resolve-from@^3.0.0" = s."resolve-from@3.0.0";
        "resolve-url@0.2.1" = f "resolve-url" "0.2.1" y "2c637fe77c893afd2a663fe21aa9080068e2052a" [];
        "resolve-url@^0.2.1" = s."resolve-url@0.2.1";
        "resolve@1.10.0" = f "resolve" "1.10.0" y "3bdaaeaf45cc07f375656dfd2e54ed0810b101ba" [
          (s."path-parse@^1.0.6")
          ];
        "resolve@^1.10.0" = s."resolve@1.10.0";
        "ret@0.1.15" = f "ret" "0.1.15" y "b8a4825d5bdb1fc3f6f53c2bc33f81388681c7bc" [];
        "ret@~0.1.10" = s."ret@0.1.15";
        "rgb-regex@1.0.1" = f "rgb-regex" "1.0.1" y "c0e0d6882df0e23be254a475e8edd41915feaeb1" [];
        "rgb-regex@^1.0.1" = s."rgb-regex@1.0.1";
        "rgba-regex@1.0.0" = f "rgba-regex" "1.0.0" y "43374e2e2ca0968b0ef1523460b7d730ff22eeb3" [];
        "rgba-regex@^1.0.0" = s."rgba-regex@1.0.0";
        "right-align@0.1.3" = f "right-align" "0.1.3" y "61339b722fe6a3515689210d24e14c96148613ef" [
          (s."align-text@^0.1.1")
          ];
        "right-align@^0.1.1" = s."right-align@0.1.3";
        "rimraf@2.6.3" = f "rimraf" "2.6.3" y "b2d104fe0d8fb27cf9e0a1cda8262dd3833c6cab" [
          (s."glob@^7.1.3")
          ];
        "rimraf@^2.6.1" = s."rimraf@2.6.3";
        "ripemd160@2.0.2" = f "ripemd160" "2.0.2" y "a1c1a6f624751577ba5d07914cbc92850585890c" [
          (s."hash-base@^3.0.0")
          (s."inherits@^2.0.1")
          ];
        "ripemd160@^2.0.0" = s."ripemd160@2.0.2";
        "ripemd160@^2.0.1" = s."ripemd160@2.0.2";
        "safe-buffer@5.1.2" = f "safe-buffer" "5.1.2" y "991ec69d296e0313747d59bdfd2b745c35f8828d" [];
        "safe-buffer@^5.0.1" = s."safe-buffer@5.1.2";
        "safe-buffer@^5.1.0" = s."safe-buffer@5.1.2";
        "safe-buffer@^5.1.1" = s."safe-buffer@5.1.2";
        "safe-buffer@^5.1.2" = s."safe-buffer@5.1.2";
        "safe-buffer@~5.1.0" = s."safe-buffer@5.1.2";
        "safe-buffer@~5.1.1" = s."safe-buffer@5.1.2";
        "safe-regex@1.1.0" = f "safe-regex" "1.1.0" y "40a3669f3b077d1e943d44629e157dd48023bf2e" [
          (s."ret@~0.1.10")
          ];
        "safe-regex@^1.1.0" = s."safe-regex@1.1.0";
        "safer-buffer@2.1.2" = f "safer-buffer" "2.1.2" y "44fa161b0187b9549dd84bb91802f9bd8385cd6a" [];
        "safer-buffer@>= 2.1.2 < 3" = s."safer-buffer@2.1.2";
        "sax@1.2.4" = f "sax" "1.2.4" y "2816234e2378bddc4e5354fab5caa895df7100d9" [];
        "sax@^1.2.4" = s."sax@1.2.4";
        "sax@~1.2.4" = s."sax@1.2.4";
        "semver@2 || 3 || 4 || 5" = s."semver@5.6.0";
        "semver@5.6.0" = f "semver" "5.6.0" y "7e74256fbaa49c75aa7c7a205cc22799cac80004" [];
        "semver@^5.3.0" = s."semver@5.6.0";
        "semver@^5.5.0" = s."semver@5.6.0";
        "set-blocking@2.0.0" = f "set-blocking" "2.0.0" y "045f9782d011ae9a6803ddd382b24392b3d890f7" [];
        "set-blocking@^2.0.0" = s."set-blocking@2.0.0";
        "set-blocking@~2.0.0" = s."set-blocking@2.0.0";
        "set-value@0.4.3" = f "set-value" "0.4.3" y "7db08f9d3d22dc7f78e53af3c3bf4666ecdfccf1" [
          (s."extend-shallow@^2.0.1")
          (s."is-extendable@^0.1.1")
          (s."is-plain-object@^2.0.1")
          (s."to-object-path@^0.3.0")
          ];
        "set-value@2.0.0" = f "set-value" "2.0.0" y "71ae4a88f0feefbbf52d1ea604f3fb315ebb6274" [
          (s."extend-shallow@^2.0.1")
          (s."is-extendable@^0.1.1")
          (s."is-plain-object@^2.0.3")
          (s."split-string@^3.0.1")
          ];
        "set-value@^0.4.3" = s."set-value@0.4.3";
        "set-value@^2.0.0" = s."set-value@2.0.0";
        "setimmediate@1.0.5" = f "setimmediate" "1.0.5" y "290cbb232e306942d7d7ea9b83732ab7856f8285" [];
        "setimmediate@^1.0.4" = s."setimmediate@1.0.5";
        "sha.js@2.4.11" = f "sha.js" "2.4.11" y "37a5cf0b81ecbc6943de109ba2960d1b26584ae7" [
          (s."inherits@^2.0.1")
          (s."safe-buffer@^5.0.1")
          ];
        "sha.js@^2.4.0" = s."sha.js@2.4.11";
        "sha.js@^2.4.8" = s."sha.js@2.4.11";
        "shebang-command@1.2.0" = f "shebang-command" "1.2.0" y "44aac65b695b03398968c39f363fee5deafdf1ea" [
          (s."shebang-regex@^1.0.0")
          ];
        "shebang-command@^1.2.0" = s."shebang-command@1.2.0";
        "shebang-regex@1.0.0" = f "shebang-regex" "1.0.0" y "da42f49740c0b42db2ca9728571cb190c98efea3" [];
        "shebang-regex@^1.0.0" = s."shebang-regex@1.0.0";
        "signal-exit@3.0.2" = f "signal-exit" "3.0.2" y "b5fdc08f1287ea1178628e415e25132b73646c6d" [];
        "signal-exit@^3.0.0" = s."signal-exit@3.0.2";
        "simple-swizzle@0.2.2" = f "simple-swizzle" "0.2.2" y "a4da6b635ffcccca33f70d17cb92592de95e557a" [
          (s."is-arrayish@^0.3.1")
          ];
        "simple-swizzle@^0.2.2" = s."simple-swizzle@0.2.2";
        "slash@1.0.0" = f "slash" "1.0.0" y "c41f2f6c39fc16d1cd17ad4b5d896114ae470d55" [];
        "slash@^1.0.0" = s."slash@1.0.0";
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
        "source-list-map@2.0.1" = f "source-list-map" "2.0.1" y "3993bd873bfc48479cca9ea3a547835c7c154b34" [];
        "source-list-map@^2.0.0" = s."source-list-map@2.0.1";
        "source-map-resolve@0.5.2" = f "source-map-resolve" "0.5.2" y "72e2cc34095543e43b2c62b2c4c10d4a9054f259" [
          (s."atob@^2.1.1")
          (s."decode-uri-component@^0.2.0")
          (s."resolve-url@^0.2.1")
          (s."source-map-url@^0.4.0")
          (s."urix@^0.1.0")
          ];
        "source-map-resolve@^0.5.0" = s."source-map-resolve@0.5.2";
        "source-map-support@0.4.18" = f "source-map-support" "0.4.18" y "0286a6de8be42641338594e97ccea75f0a2c585f" [
          (s."source-map@^0.5.6")
          ];
        "source-map-support@^0.4.15" = s."source-map-support@0.4.18";
        "source-map-url@0.4.0" = f "source-map-url" "0.4.0" y "3e935d7ddd73631b97659956d55128e87b5084a3" [];
        "source-map-url@^0.4.0" = s."source-map-url@0.4.0";
        "source-map@0.4.4" = f "source-map" "0.4.4" y "eba4f5da9c0dc999de68032d8b4f76173652036b" [
          (s."amdefine@>=0.0.4")
          ];
        "source-map@0.5.7" = f "source-map" "0.5.7" y "8a039d2d1021d22d1ea14c80d8ea468ba2ef3fcc" [];
        "source-map@0.6.1" = f "source-map" "0.6.1" y "74722af32e9614e9c287a8d0bbde48b5e2f1a263" [];
        "source-map@^0.5.3" = s."source-map@0.5.7";
        "source-map@^0.5.6" = s."source-map@0.5.7";
        "source-map@^0.5.7" = s."source-map@0.5.7";
        "source-map@^0.6.1" = s."source-map@0.6.1";
        "source-map@~0.4.2" = s."source-map@0.4.4";
        "source-map@~0.5.1" = s."source-map@0.5.7";
        "source-map@~0.6.1" = s."source-map@0.6.1";
        "spdx-correct@3.1.0" = f "spdx-correct" "3.1.0" y "fb83e504445268f154b074e218c87c003cd31df4" [
          (s."spdx-expression-parse@^3.0.0")
          (s."spdx-license-ids@^3.0.0")
          ];
        "spdx-correct@^3.0.0" = s."spdx-correct@3.1.0";
        "spdx-exceptions@2.2.0" = f "spdx-exceptions" "2.2.0" y "2ea450aee74f2a89bfb94519c07fcd6f41322977" [];
        "spdx-exceptions@^2.1.0" = s."spdx-exceptions@2.2.0";
        "spdx-expression-parse@3.0.0" = f "spdx-expression-parse" "3.0.0" y "99e119b7a5da00e05491c9fa338b7904823b41d0" [
          (s."spdx-exceptions@^2.1.0")
          (s."spdx-license-ids@^3.0.0")
          ];
        "spdx-expression-parse@^3.0.0" = s."spdx-expression-parse@3.0.0";
        "spdx-license-ids@3.0.3" = f "spdx-license-ids" "3.0.3" y "81c0ce8f21474756148bbb5f3bfc0f36bf15d76e" [];
        "spdx-license-ids@^3.0.0" = s."spdx-license-ids@3.0.3";
        "split-string@3.1.0" = f "split-string" "3.1.0" y "7cb09dda3a86585705c64b39a6466038682e8fe2" [
          (s."extend-shallow@^3.0.0")
          ];
        "split-string@^3.0.1" = s."split-string@3.1.0";
        "split-string@^3.0.2" = s."split-string@3.1.0";
        "sprintf-js@1.0.3" = f "sprintf-js" "1.0.3" y "04e6926f662895354f3dd015203633b857297e2c" [];
        "sprintf-js@~1.0.2" = s."sprintf-js@1.0.3";
        "stable@0.1.8" = f "stable" "0.1.8" y "836eb3c8382fe2936feaf544631017ce7d47a3cf" [];
        "stable@~0.1.6" = s."stable@0.1.8";
        "static-extend@0.1.2" = f "static-extend" "0.1.2" y "60809c39cbff55337226fd5e0b520f341f1fb5c6" [
          (s."define-property@^0.2.5")
          (s."object-copy@^0.1.0")
          ];
        "static-extend@^0.1.1" = s."static-extend@0.1.2";
        "stream-browserify@2.0.2" = f "stream-browserify" "2.0.2" y "87521d38a44aa7ee91ce1cd2a47df0cb49dd660b" [
          (s."inherits@~2.0.1")
          (s."readable-stream@^2.0.2")
          ];
        "stream-browserify@^2.0.1" = s."stream-browserify@2.0.2";
        "stream-http@2.8.3" = f "stream-http" "2.8.3" y "b2d242469288a5a27ec4fe8933acf623de6514fc" [
          (s."builtin-status-codes@^3.0.0")
          (s."inherits@^2.0.1")
          (s."readable-stream@^2.3.6")
          (s."to-arraybuffer@^1.0.0")
          (s."xtend@^4.0.0")
          ];
        "stream-http@^2.7.2" = s."stream-http@2.8.3";
        "string-width@1.0.2" = f "string-width" "1.0.2" y "118bdf5b8cdc51a2a7e70d211e07e2b0b9b107d3" [
          (s."code-point-at@^1.0.0")
          (s."is-fullwidth-code-point@^1.0.0")
          (s."strip-ansi@^3.0.0")
          ];
        "string-width@2.1.1" = f "string-width" "2.1.1" y "ab93f27a8dc13d28cac815c462143a6d9012ae9e" [
          (s."is-fullwidth-code-point@^2.0.0")
          (s."strip-ansi@^4.0.0")
          ];
        "string-width@^1.0.1" = s."string-width@1.0.2";
        "string-width@^1.0.2" = s."string-width@1.0.2";
        "string-width@^1.0.2 || 2" = s."string-width@2.1.1";
        "string_decoder@1.1.1" = f "string_decoder" "1.1.1" y "9cf1611ba62685d7030ae9e4ba34149c3af03fc8" [
          (s."safe-buffer@~5.1.0")
          ];
        "string_decoder@1.2.0" = f "string_decoder" "1.2.0" y "fe86e738b19544afe70469243b2a1ee9240eae8d" [
          (s."safe-buffer@~5.1.0")
          ];
        "string_decoder@^1.0.0" = s."string_decoder@1.2.0";
        "string_decoder@~1.1.1" = s."string_decoder@1.1.1";
        "strip-ansi@3.0.1" = f "strip-ansi" "3.0.1" y "6a385fb8853d952d5ff05d0e8aaf94278dc63dcf" [
          (s."ansi-regex@^2.0.0")
          ];
        "strip-ansi@4.0.0" = f "strip-ansi" "4.0.0" y "a8479022eb1ac368a871389b635262c505ee368f" [
          (s."ansi-regex@^3.0.0")
          ];
        "strip-ansi@^3.0.0" = s."strip-ansi@3.0.1";
        "strip-ansi@^3.0.1" = s."strip-ansi@3.0.1";
        "strip-ansi@^4.0.0" = s."strip-ansi@4.0.0";
        "strip-bom@2.0.0" = f "strip-bom" "2.0.0" y "6219a85616520491f35788bdbf1447a99c7e6b0e" [
          (s."is-utf8@^0.2.0")
          ];
        "strip-bom@^2.0.0" = s."strip-bom@2.0.0";
        "strip-json-comments@2.0.1" = f "strip-json-comments" "2.0.1" y "3c531942e908c2697c0ec344858c286c7ca0a60a" [];
        "strip-json-comments@~2.0.1" = s."strip-json-comments@2.0.1";
        "stylehacks@4.0.2" = f "stylehacks" "4.0.2" y "d22eb2767598b1a704341290b42aeafb7945ce38" [
          (s."browserslist@^4.0.0")
          (s."postcss@^7.0.0")
          (s."postcss-selector-parser@^3.0.0")
          ];
        "stylehacks@^4.0.0" = s."stylehacks@4.0.2";
        "supports-color@2.0.0" = f "supports-color" "2.0.0" y "535d045ce6b6363fa40117084629995e9df324c7" [];
        "supports-color@3.2.3" = f "supports-color" "3.2.3" y "65ac0504b3954171d8a64946b2ae3cbb8a5f54f6" [
          (s."has-flag@^1.0.0")
          ];
        "supports-color@5.5.0" = f "supports-color" "5.5.0" y "e2e69a44ac8772f78a1ec0b35b689df6530efc8f" [
          (s."has-flag@^3.0.0")
          ];
        "supports-color@6.1.0" = f "supports-color" "6.1.0" y "0764abc69c63d5ac842dd4867e8d025e880df8f3" [
          (s."has-flag@^3.0.0")
          ];
        "supports-color@^2.0.0" = s."supports-color@2.0.0";
        "supports-color@^3.1.0" = s."supports-color@3.2.3";
        "supports-color@^5.3.0" = s."supports-color@5.5.0";
        "supports-color@^5.4.0" = s."supports-color@5.5.0";
        "supports-color@^6.1.0" = s."supports-color@6.1.0";
        "svgo@1.1.1" = f "svgo" "1.1.1" y "12384b03335bcecd85cfa5f4e3375fed671cb985" [
          (s."coa@~2.0.1")
          (s."colors@~1.1.2")
          (s."css-select@^2.0.0")
          (s."css-select-base-adapter@~0.1.0")
          (s."css-tree@1.0.0-alpha.28")
          (s."css-url-regex@^1.1.0")
          (s."csso@^3.5.0")
          (s."js-yaml@^3.12.0")
          (s."mkdirp@~0.5.1")
          (s."object.values@^1.0.4")
          (s."sax@~1.2.4")
          (s."stable@~0.1.6")
          (s."unquote@~1.1.1")
          (s."util.promisify@~1.0.0")
          ];
        "svgo@^1.0.0" = s."svgo@1.1.1";
        "tapable@0.2.9" = f "tapable" "0.2.9" y "af2d8bbc9b04f74ee17af2b4d9048f807acd18a8" [];
        "tapable@^0.2.7" = s."tapable@0.2.9";
        "tapable@~0.2.5" = s."tapable@0.2.9";
        "tar@4.4.8" = f "tar" "4.4.8" y "b19eec3fde2a96e64666df9fdb40c5ca1bc3747d" [
          (s."chownr@^1.1.1")
          (s."fs-minipass@^1.2.5")
          (s."minipass@^2.3.4")
          (s."minizlib@^1.1.1")
          (s."mkdirp@^0.5.0")
          (s."safe-buffer@^5.1.2")
          (s."yallist@^3.0.2")
          ];
        "tar@^4" = s."tar@4.4.8";
        "timers-browserify@2.0.10" = f "timers-browserify" "2.0.10" y "1d28e3d2aadf1d5a5996c4e9f95601cd053480ae" [
          (s."setimmediate@^1.0.4")
          ];
        "timers-browserify@^2.0.4" = s."timers-browserify@2.0.10";
        "timsort@0.3.0" = f "timsort" "0.3.0" y "405411a8e7e6339fe64db9a234de11dc31e02bd4" [];
        "timsort@^0.3.0" = s."timsort@0.3.0";
        "to-arraybuffer@1.0.1" = f "to-arraybuffer" "1.0.1" y "7d229b1fcc637e466ca081180836a7aabff83f43" [];
        "to-arraybuffer@^1.0.0" = s."to-arraybuffer@1.0.1";
        "to-fast-properties@1.0.3" = f "to-fast-properties" "1.0.3" y "b83571fa4d8c25b82e231b06e3a3055de4ca1a47" [];
        "to-fast-properties@^1.0.3" = s."to-fast-properties@1.0.3";
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
        "trim-right@1.0.1" = f "trim-right" "1.0.1" y "cb2e1203067e0c8de1f614094b9fe45704ea6003" [];
        "trim-right@^1.0.1" = s."trim-right@1.0.1";
        "tty-browserify@0.0.0" = f "tty-browserify" "0.0.0" y "a157ba402da24e9bf957f9aa69d524eed42901a6" [];
        "uglify-js@2.8.29" = f "uglify-js" "2.8.29" y "29c5733148057bb4e1f75df35b7a9cb72e6a59dd" [
          (s."source-map@~0.5.1")
          (s."yargs@~3.10.0")
          (s."uglify-to-browserify@~1.0.0")
          ];
        "uglify-js@^2.8.27" = s."uglify-js@2.8.29";
        "uglify-to-browserify@1.0.2" = f "uglify-to-browserify" "1.0.2" y "6e0924d6bda6b5afe349e39a6d632850a0f882b7" [];
        "uglify-to-browserify@~1.0.0" = s."uglify-to-browserify@1.0.2";
        "union-value@1.0.0" = f "union-value" "1.0.0" y "5c71c34cb5bad5dcebe3ea0cd08207ba5aa1aea4" [
          (s."arr-union@^3.1.0")
          (s."get-value@^2.0.6")
          (s."is-extendable@^0.1.1")
          (s."set-value@^0.4.3")
          ];
        "union-value@^1.0.0" = s."union-value@1.0.0";
        "uniq@1.0.1" = f "uniq" "1.0.1" y "b31c5ae8254844a3a8281541ce2b04b865a734ff" [];
        "uniq@^1.0.1" = s."uniq@1.0.1";
        "uniqs@2.0.0" = f "uniqs" "2.0.0" y "ffede4b36b25290696e6e165d4a59edb998e6b02" [];
        "uniqs@^2.0.0" = s."uniqs@2.0.0";
        "unquote@1.1.1" = f "unquote" "1.1.1" y "8fded7324ec6e88a0ff8b905e7c098cdc086d544" [];
        "unquote@~1.1.1" = s."unquote@1.1.1";
        "unset-value@1.0.0" = f "unset-value" "1.0.0" y "8376873f7d2335179ffb1e6fc3a8ed0dfc8ab559" [
          (s."has-value@^0.3.1")
          (s."isobject@^3.0.0")
          ];
        "unset-value@^1.0.0" = s."unset-value@1.0.0";
        "upath@1.1.0" = f "upath" "1.1.0" y "35256597e46a581db4793d0ce47fa9aebfc9fabd" [];
        "upath@^1.1.0" = s."upath@1.1.0";
        "urix@0.1.0" = f "urix" "0.1.0" y "da937f7a62e21fec1fd18d49b35c2935067a6c72" [];
        "urix@^0.1.0" = s."urix@0.1.0";
        "url@0.11.0" = f "url" "0.11.0" y "3838e97cfc60521eb73c525a8e55bfdd9e2e28f1" [
          (s."punycode@1.3.2")
          (s."querystring@0.2.0")
          ];
        "url@^0.11.0" = s."url@0.11.0";
        "use@3.1.1" = f "use" "3.1.1" y "d50c8cac79a19fbc20f2911f56eb973f4e10070f" [];
        "use@^3.1.0" = s."use@3.1.1";
        "user-home@1.1.1" = f "user-home" "1.1.1" y "2b5be23a32b63a7c9deb8d0f28d485724a3df190" [];
        "user-home@^1.1.1" = s."user-home@1.1.1";
        "util-deprecate@1.0.2" = f "util-deprecate" "1.0.2" y "450d4dc9fa70de732762fbd2d4a28981419a0ccf" [];
        "util-deprecate@~1.0.1" = s."util-deprecate@1.0.2";
        "util.promisify@1.0.0" = f "util.promisify" "1.0.0" y "440f7165a459c9a16dc145eb8e72f35687097030" [
          (s."define-properties@^1.1.2")
          (s."object.getownpropertydescriptors@^2.0.3")
          ];
        "util.promisify@~1.0.0" = s."util.promisify@1.0.0";
        "util@0.10.3" = f "util" "0.10.3" y "7afb1afe50805246489e3db7fe0ed379336ac0f9" [
          (s."inherits@2.0.1")
          ];
        "util@0.11.1" = f "util" "0.11.1" y "3236733720ec64bb27f6e26f421aaa2e1b588d61" [
          (s."inherits@2.0.3")
          ];
        "util@^0.11.0" = s."util@0.11.1";
        "v8flags@2.1.1" = f "v8flags" "2.1.1" y "aab1a1fa30d45f88dd321148875ac02c0b55e5b4" [
          (s."user-home@^1.1.1")
          ];
        "v8flags@^2.1.1" = s."v8flags@2.1.1";
        "validate-npm-package-license@3.0.4" = f "validate-npm-package-license" "3.0.4" y "fc91f6b9c7ba15c857f4cb2c5defeec39d4f410a" [
          (s."spdx-correct@^3.0.0")
          (s."spdx-expression-parse@^3.0.0")
          ];
        "validate-npm-package-license@^3.0.1" = s."validate-npm-package-license@3.0.4";
        "vendors@1.0.2" = f "vendors" "1.0.2" y "7fcb5eef9f5623b156bcea89ec37d63676f21801" [];
        "vendors@^1.0.0" = s."vendors@1.0.2";
        "vm-browserify@0.0.4" = f "vm-browserify" "0.0.4" y "5d7ea45bbef9e4a6ff65f95438e0a87c357d5a73" [
          (s."indexof@0.0.1")
          ];
        "watchpack@1.6.0" = f "watchpack" "1.6.0" y "4bc12c2ebe8aa277a71f1d3f14d685c7b446cd00" [
          (s."chokidar@^2.0.2")
          (s."graceful-fs@^4.1.2")
          (s."neo-async@^2.5.0")
          ];
        "watchpack@^1.3.1" = s."watchpack@1.6.0";
        "webpack-bundle-size-analyzer@2.7.0" = f "webpack-bundle-size-analyzer" "2.7.0" y "2ec0539fd57f8716083898b38b892fe94c88c6bc" [
          (s."commander@^2.7.1")
          (s."filesize@^3.1.2")
          (s."humanize@0.0.9")
          ];
        "webpack-bundle-size-analyzer@^2.0.0" = s."webpack-bundle-size-analyzer@2.7.0";
        "webpack-sources@1.3.0" = f "webpack-sources" "1.3.0" y "2a28dcb9f1f45fe960d8f1493252b5ee6530fa85" [
          (s."source-list-map@^2.0.0")
          (s."source-map@~0.6.1")
          ];
        "webpack-sources@^1.0.1" = s."webpack-sources@1.3.0";
        "webpack@2.7.0" = f "webpack" "2.7.0" y "b2a1226804373ffd3d03ea9c6bd525067034f6b1" [
          (s."acorn@^5.0.0")
          (s."acorn-dynamic-import@^2.0.0")
          (s."ajv@^4.7.0")
          (s."ajv-keywords@^1.1.1")
          (s."async@^2.1.2")
          (s."enhanced-resolve@^3.3.0")
          (s."interpret@^1.0.0")
          (s."json-loader@^0.5.4")
          (s."json5@^0.5.1")
          (s."loader-runner@^2.3.0")
          (s."loader-utils@^0.2.16")
          (s."memory-fs@~0.4.1")
          (s."mkdirp@~0.5.0")
          (s."node-libs-browser@^2.0.0")
          (s."source-map@^0.5.3")
          (s."supports-color@^3.1.0")
          (s."tapable@~0.2.5")
          (s."uglify-js@^2.8.27")
          (s."watchpack@^1.3.1")
          (s."webpack-sources@^1.0.1")
          (s."yargs@^6.0.0")
          ];
        "webpack@^2.0.0" = s."webpack@2.7.0";
        "which-module@1.0.0" = f "which-module" "1.0.0" y "bba63ca861948994ff307736089e3b96026c2a4f" [];
        "which-module@^1.0.0" = s."which-module@1.0.0";
        "which@1.3.1" = f "which" "1.3.1" y "a45043d54f5805316da8d62f9f50918d3da70b0a" [
          (s."isexe@^2.0.0")
          ];
        "which@^1.2.9" = s."which@1.3.1";
        "wide-align@1.1.3" = f "wide-align" "1.1.3" y "ae074e6bdc0c14a431e804e624549c633b000457" [
          (s."string-width@^1.0.2 || 2")
          ];
        "wide-align@^1.1.0" = s."wide-align@1.1.3";
        "window-size@0.1.0" = f "window-size" "0.1.0" y "5438cd2ea93b202efa3a19fe8887aee7c94f9c9d" [];
        "wordwrap@0.0.2" = f "wordwrap" "0.0.2" y "b79669bb42ecb409f83d583cad52ca17eaa1643f" [];
        "wrap-ansi@2.1.0" = f "wrap-ansi" "2.1.0" y "d8fc3d284dd05794fe84973caecdd1cf824fdd85" [
          (s."string-width@^1.0.1")
          (s."strip-ansi@^3.0.1")
          ];
        "wrap-ansi@^2.0.0" = s."wrap-ansi@2.1.0";
        "wrappy@1" = s."wrappy@1.0.2";
        "wrappy@1.0.2" = f "wrappy" "1.0.2" y "b5243d8f3ec1aa35f1364605bc0d1036e30ab69f" [];
        "xtend@4.0.1" = f "xtend" "4.0.1" y "a5c6d532be656e23db820efb943a1f04998d63af" [];
        "xtend@^4.0.0" = s."xtend@4.0.1";
        "y18n@3.2.1" = f "y18n" "3.2.1" y "6d15fba884c08679c0d77e88e7759e811e07fa41" [];
        "y18n@^3.2.1" = s."y18n@3.2.1";
        "yallist@3.0.3" = f "yallist" "3.0.3" y "b4b049e314be545e3ce802236d6cd22cd91c3de9" [];
        "yallist@^3.0.0" = s."yallist@3.0.3";
        "yallist@^3.0.2" = s."yallist@3.0.3";
        "yargs-parser@4.2.1" = f "yargs-parser" "4.2.1" y "29cceac0dc4f03c6c87b4a9f217dd18c9f74871c" [
          (s."camelcase@^3.0.0")
          ];
        "yargs-parser@^4.2.0" = s."yargs-parser@4.2.1";
        "yargs@3.10.0" = f "yargs" "3.10.0" y "f7ee7bd857dd7c1d2d38c0e74efbd681d1431fd1" [
          (s."camelcase@^1.0.2")
          (s."cliui@^2.1.0")
          (s."decamelize@^1.0.0")
          (s."window-size@0.1.0")
          ];
        "yargs@6.6.0" = f "yargs" "6.6.0" y "782ec21ef403345f830a808ca3d513af56065208" [
          (s."camelcase@^3.0.0")
          (s."cliui@^3.2.0")
          (s."decamelize@^1.1.1")
          (s."get-caller-file@^1.0.1")
          (s."os-locale@^1.4.0")
          (s."read-pkg-up@^1.0.1")
          (s."require-directory@^2.1.1")
          (s."require-main-filename@^1.0.1")
          (s."set-blocking@^2.0.0")
          (s."string-width@^1.0.2")
          (s."which-module@^1.0.0")
          (s."y18n@^3.2.1")
          (s."yargs-parser@^4.2.0")
          ];
        "yargs@^6.0.0" = s."yargs@6.6.0";
        "yargs@~3.10.0" = s."yargs@3.10.0";
        }