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
        "@sinonjs/commons@1.8.1" = f (sc "sinonjs" "commons") "1.8.1" (ir "https://registry.yarnpkg.com/@sinonjs/commons/-/commons-1.8.1.tgz") "e7df00f98a203324f6dc7cc606cad9d4a8ab2217" [
          (s."type-detect@4.0.8")
          ];
        "@sinonjs/commons@^1" = s."@sinonjs/commons@1.8.1";
        "@sinonjs/commons@^1.3.0" = s."@sinonjs/commons@1.8.1";
        "@sinonjs/commons@^1.4.0" = s."@sinonjs/commons@1.8.1";
        "@sinonjs/commons@^1.7.0" = s."@sinonjs/commons@1.8.1";
        "@sinonjs/formatio@3.2.2" = f (sc "sinonjs" "formatio") "3.2.2" (ir "https://registry.yarnpkg.com/@sinonjs/formatio/-/formatio-3.2.2.tgz") "771c60dfa75ea7f2d68e3b94c7e888a78781372c" [
          (s."@sinonjs/commons@^1")
          (s."@sinonjs/samsam@^3.1.0")
          ];
        "@sinonjs/formatio@^3.2.1" = s."@sinonjs/formatio@3.2.2";
        "@sinonjs/samsam@3.3.3" = f (sc "sinonjs" "samsam") "3.3.3" (ir "https://registry.yarnpkg.com/@sinonjs/samsam/-/samsam-3.3.3.tgz") "46682efd9967b259b81136b9f120fd54585feb4a" [
          (s."@sinonjs/commons@^1.3.0")
          (s."array-from@^2.1.1")
          (s."lodash@^4.17.15")
          ];
        "@sinonjs/samsam@^3.1.0" = s."@sinonjs/samsam@3.3.3";
        "@sinonjs/samsam@^3.3.3" = s."@sinonjs/samsam@3.3.3";
        "@sinonjs/text-encoding@0.7.1" = f (sc "sinonjs" "text-encoding") "0.7.1" (ir "https://registry.yarnpkg.com/@sinonjs/text-encoding/-/text-encoding-0.7.1.tgz") "8da5c6530915653f3a1f38fd5f101d8c3f8079c5" [];
        "@sinonjs/text-encoding@^0.7.1" = s."@sinonjs/text-encoding@0.7.1";
        "accepts@1.3.7" = f "accepts" "1.3.7" y "531bc726517a3b2b41f850021c6cc15eaab507cd" [
          (s."mime-types@~2.1.24")
          (s."negotiator@0.6.2")
          ];
        "accepts@~1.3.4" = s."accepts@1.3.7";
        "accepts@~1.3.7" = s."accepts@1.3.7";
        "append-field@1.0.0" = f "append-field" "1.0.0" y "1e3440e915f0b1203d23748e78edd7b9b5b43e56" [];
        "append-field@^1.0.0" = s."append-field@1.0.0";
        "array-flatten@1.1.1" = f "array-flatten" "1.1.1" y "9a5f699051b1e7073328f2a008968b64ea2955d2" [];
        "array-from@2.1.1" = f "array-from" "2.1.1" y "cfe9d8c26628b9dc5aecc62a9f5d8f1f352c1195" [];
        "array-from@^2.1.1" = s."array-from@2.1.1";
        "balanced-match@1.0.0" = f "balanced-match" "1.0.0" y "89b4d199ab2bee49de164ea02b89ce462d71b767" [];
        "balanced-match@^1.0.0" = s."balanced-match@1.0.0";
        "batch@0.6.1" = f "batch" "0.6.1" y "dc34314f4e679318093fc760272525f94bf25c16" [];
        "body-parser@1.19.0" = f "body-parser" "1.19.0" y "96b2709e57c9c4e09a6fd66a8fd979844f69f08a" [
          (s."bytes@3.1.0")
          (s."content-type@~1.0.4")
          (s."debug@2.6.9")
          (s."depd@~1.1.2")
          (s."http-errors@1.7.2")
          (s."iconv-lite@0.4.24")
          (s."on-finished@~2.3.0")
          (s."qs@6.7.0")
          (s."raw-body@2.4.0")
          (s."type-is@~1.6.17")
          ];
        "brace-expansion@1.1.11" = f "brace-expansion" "1.1.11" y "3c7fcbf529d87226f3d2f52b966ff5271eb441dd" [
          (s."balanced-match@^1.0.0")
          (s."concat-map@0.0.1")
          ];
        "brace-expansion@^1.1.7" = s."brace-expansion@1.1.11";
        "browser-stdout@1.3.1" = f "browser-stdout" "1.3.1" y "baa559ee14ced73452229bad7326467c61fabd60" [];
        "buffer-from@1.1.1" = f "buffer-from" "1.1.1" y "32713bc028f75c02fdb710d7c7bcec1f2c6070ef" [];
        "buffer-from@^1.0.0" = s."buffer-from@1.1.1";
        "busboy@0.2.14" = f "busboy" "0.2.14" y "6c2a622efcf47c57bbbe1e2a9c37ad36c7925453" [
          (s."dicer@0.2.5")
          (s."readable-stream@1.1.x")
          ];
        "busboy@^0.2.11" = s."busboy@0.2.14";
        "bytes@3.1.0" = f "bytes" "3.1.0" y "f6cf7933a360e0588fa9fde85651cdc7f805d1f6" [];
        "commander@2.15.1" = f "commander" "2.15.1" y "df46e867d0fc2aec66a34662b406a9ccafff5b0f" [];
        "concat-map@0.0.1" = f "concat-map" "0.0.1" y "d8a96bd77fd68df7793a73036a3ba0d5405d477b" [];
        "concat-stream@1.6.2" = f "concat-stream" "1.6.2" y "904bdf194cd3122fc675c77fc4ac3d4ff0fd1a34" [
          (s."buffer-from@^1.0.0")
          (s."inherits@^2.0.3")
          (s."readable-stream@^2.2.2")
          (s."typedarray@^0.0.6")
          ];
        "concat-stream@^1.5.2" = s."concat-stream@1.6.2";
        "content-disposition@0.5.3" = f "content-disposition" "0.5.3" y "e130caf7e7279087c5616c2007d0485698984fbd" [
          (s."safe-buffer@5.1.2")
          ];
        "content-type@1.0.4" = f "content-type" "1.0.4" y "e138cc75e040c727b1966fe5e5f8c9aee256fe3b" [];
        "content-type@~1.0.4" = s."content-type@1.0.4";
        "cookie-signature@1.0.6" = f "cookie-signature" "1.0.6" y "e303a882b342cc3ee8ca513a79999734dab3ae2c" [];
        "cookie@0.4.0" = f "cookie" "0.4.0" y "beb437e7022b3b6d49019d088665303ebe9c14ba" [];
        "core-util-is@1.0.2" = f "core-util-is" "1.0.2" y "b5fd54220aa2bc5ab57aab7140c940754503c1a7" [];
        "core-util-is@~1.0.0" = s."core-util-is@1.0.2";
        "debug@2.6.9" = f "debug" "2.6.9" y "5d128515df134ff327e90a4c93f4e077a536341f" [
          (s."ms@2.0.0")
          ];
        "debug@3.1.0" = f "debug" "3.1.0" y "5bb5a0672628b64149566ba16819e61518c67261" [
          (s."ms@2.0.0")
          ];
        "depd@1.1.2" = f "depd" "1.1.2" y "9bcd52e14c097763e749b274c4346ed2e560b5a9" [];
        "depd@~1.1.2" = s."depd@1.1.2";
        "destroy@1.0.4" = f "destroy" "1.0.4" y "978857442c44749e4206613e37946205826abd80" [];
        "destroy@~1.0.4" = s."destroy@1.0.4";
        "dicer@0.2.5" = f "dicer" "0.2.5" y "5996c086bb33218c812c090bddc09cd12facb70f" [
          (s."readable-stream@1.1.x")
          (s."streamsearch@0.1.2")
          ];
        "diff@3.5.0" = f "diff" "3.5.0" y "800c0dd1e0a8bfbc95835c202ad220fe317e5a12" [];
        "diff@^3.5.0" = s."diff@3.5.0";
        "ee-first@1.1.1" = f "ee-first" "1.1.1" y "590c61156b0ae2f4f0255732a158b266bc56b21d" [];
        "encodeurl@1.0.2" = f "encodeurl" "1.0.2" y "ad3ff4c86ec2d029322f5a02c3a9a606c95b3f59" [];
        "encodeurl@~1.0.2" = s."encodeurl@1.0.2";
        "escape-html@1.0.3" = f "escape-html" "1.0.3" y "0258eae4d3d0c0974de1c169188ef0051d1d1988" [];
        "escape-html@~1.0.3" = s."escape-html@1.0.3";
        "escape-string-regexp@1.0.5" = f "escape-string-regexp" "1.0.5" y "1b61c0562190a8dff6ae3bb2cf0200ca130b86d4" [];
        "etag@1.8.1" = f "etag" "1.8.1" y "41ae2eeb65efa62268aebfea83ac7d79299b0887" [];
        "etag@~1.8.1" = s."etag@1.8.1";
        "express@4.17.1" = f "express" "4.17.1" y "4491fc38605cf51f8629d39c2b5d026f98a4c134" [
          (s."accepts@~1.3.7")
          (s."array-flatten@1.1.1")
          (s."body-parser@1.19.0")
          (s."content-disposition@0.5.3")
          (s."content-type@~1.0.4")
          (s."cookie@0.4.0")
          (s."cookie-signature@1.0.6")
          (s."debug@2.6.9")
          (s."depd@~1.1.2")
          (s."encodeurl@~1.0.2")
          (s."escape-html@~1.0.3")
          (s."etag@~1.8.1")
          (s."finalhandler@~1.1.2")
          (s."fresh@0.5.2")
          (s."merge-descriptors@1.0.1")
          (s."methods@~1.1.2")
          (s."on-finished@~2.3.0")
          (s."parseurl@~1.3.3")
          (s."path-to-regexp@0.1.7")
          (s."proxy-addr@~2.0.5")
          (s."qs@6.7.0")
          (s."range-parser@~1.2.1")
          (s."safe-buffer@5.1.2")
          (s."send@0.17.1")
          (s."serve-static@1.14.1")
          (s."setprototypeof@1.1.1")
          (s."statuses@~1.5.0")
          (s."type-is@~1.6.18")
          (s."utils-merge@1.0.1")
          (s."vary@~1.1.2")
          ];
        "express@^4.17.1" = s."express@4.17.1";
        "finalhandler@1.1.2" = f "finalhandler" "1.1.2" y "b7e7d000ffd11938d0fdb053506f6ebabe9f587d" [
          (s."debug@2.6.9")
          (s."encodeurl@~1.0.2")
          (s."escape-html@~1.0.3")
          (s."on-finished@~2.3.0")
          (s."parseurl@~1.3.3")
          (s."statuses@~1.5.0")
          (s."unpipe@~1.0.0")
          ];
        "finalhandler@~1.1.2" = s."finalhandler@1.1.2";
        "forwarded@0.1.2" = f "forwarded" "0.1.2" y "98c23dab1175657b8c0573e8ceccd91b0ff18c84" [];
        "forwarded@~0.1.2" = s."forwarded@0.1.2";
        "fresh@0.5.2" = f "fresh" "0.5.2" y "3d8cadd90d976569fa835ab1f8e4b23a105605a7" [];
        "fs.realpath@1.0.0" = f "fs.realpath" "1.0.0" y "1504ad2523158caa40db4a2787cb01411994ea4f" [];
        "fs.realpath@^1.0.0" = s."fs.realpath@1.0.0";
        "glob@7.1.2" = f "glob" "7.1.2" y "c19c9df9a028702d678612384a6552404c636d15" [
          (s."fs.realpath@^1.0.0")
          (s."inflight@^1.0.4")
          (s."inherits@2")
          (s."minimatch@^3.0.4")
          (s."once@^1.3.0")
          (s."path-is-absolute@^1.0.0")
          ];
        "glob@7.1.6" = f "glob" "7.1.6" y "141f33b81a7c2492e125594307480c46679278a6" [
          (s."fs.realpath@^1.0.0")
          (s."inflight@^1.0.4")
          (s."inherits@2")
          (s."minimatch@^3.0.4")
          (s."once@^1.3.0")
          (s."path-is-absolute@^1.0.0")
          ];
        "glob@^7.1.3" = s."glob@7.1.6";
        "glob@^7.1.6" = s."glob@7.1.6";
        "growl@1.10.5" = f "growl" "1.10.5" y "f2735dc2283674fa67478b10181059355c369e5e" [];
        "has-flag@3.0.0" = f "has-flag" "3.0.0" y "b5d454dc2199ae225699f3467e5a07f3b955bafd" [];
        "has-flag@^3.0.0" = s."has-flag@3.0.0";
        "he@1.1.1" = f "he" "1.1.1" y "93410fd21b009735151f8868c2f271f3427e23fd" [];
        "http-errors@1.6.3" = f "http-errors" "1.6.3" y "8b55680bb4be283a0b5bf4ea2e38580be1d9320d" [
          (s."depd@~1.1.2")
          (s."inherits@2.0.3")
          (s."setprototypeof@1.1.0")
          (s."statuses@>= 1.4.0 < 2")
          ];
        "http-errors@1.7.2" = f "http-errors" "1.7.2" y "4f5029cf13239f31036e5b2e55292bcfbcc85c8f" [
          (s."depd@~1.1.2")
          (s."inherits@2.0.3")
          (s."setprototypeof@1.1.1")
          (s."statuses@>= 1.5.0 < 2")
          (s."toidentifier@1.0.0")
          ];
        "http-errors@1.7.3" = f "http-errors" "1.7.3" y "6c619e4f9c60308c38519498c14fbb10aacebb06" [
          (s."depd@~1.1.2")
          (s."inherits@2.0.4")
          (s."setprototypeof@1.1.1")
          (s."statuses@>= 1.5.0 < 2")
          (s."toidentifier@1.0.0")
          ];
        "http-errors@~1.6.2" = s."http-errors@1.6.3";
        "http-errors@~1.7.2" = s."http-errors@1.7.3";
        "iconv-lite@0.4.24" = f "iconv-lite" "0.4.24" y "2022b4b25fbddc21d2f524974a474aafe733908b" [
          (s."safer-buffer@>= 2.1.2 < 3")
          ];
        "immediate@3.0.6" = f "immediate" "3.0.6" y "9db1dbd0faf8de6fbe0f5dd5e56bb606280de69b" [];
        "immediate@~3.0.5" = s."immediate@3.0.6";
        "inflight@1.0.6" = f "inflight" "1.0.6" y "49bd6331d7d02d0c09bc910a1075ba8165b56df9" [
          (s."once@^1.3.0")
          (s."wrappy@1")
          ];
        "inflight@^1.0.4" = s."inflight@1.0.6";
        "inherits@2" = s."inherits@2.0.4";
        "inherits@2.0.3" = f "inherits" "2.0.3" y "633c2c83e3da42a502f52466022480f4208261de" [];
        "inherits@2.0.4" = f "inherits" "2.0.4" y "0fa2c64f932917c3433a0ded55363aae37416b7c" [];
        "inherits@^2.0.3" = s."inherits@2.0.4";
        "inherits@~2.0.1" = s."inherits@2.0.4";
        "inherits@~2.0.3" = s."inherits@2.0.4";
        "ipaddr.js@1.9.1" = f "ipaddr.js" "1.9.1" y "bff38543eeb8984825079ff3a2a8e6cbd46781b3" [];
        "isarray@0.0.1" = f "isarray" "0.0.1" y "8a18acfca9a8f4177e09abfc6038939b05d1eedf" [];
        "isarray@1.0.0" = f "isarray" "1.0.0" y "bb935d48582cba168c06834957a54a3e07124f11" [];
        "isarray@~1.0.0" = s."isarray@1.0.0";
        "jasmine-core@3.6.0" = f "jasmine-core" "3.6.0" y "491f3bb23941799c353ceb7a45b38a950ebc5a20" [];
        "jasmine-core@~3.6.0" = s."jasmine-core@3.6.0";
        "jasmine@3.6.2" = f "jasmine" "3.6.2" y "a8df3fc92f2ef322bcdafb890f744f3ff5751e86" [
          (s."glob@^7.1.6")
          (s."jasmine-core@~3.6.0")
          ];
        "jasmine@^3.5.0" = s."jasmine@3.6.2";
        "jszip@3.5.0" = f "jszip" "3.5.0" y "b4fd1f368245346658e781fec9675802489e15f6" [
          (s."lie@~3.3.0")
          (s."pako@~1.0.2")
          (s."readable-stream@~2.3.6")
          (s."set-immediate-shim@~1.0.1")
          ];
        "jszip@^3.2.2" = s."jszip@3.5.0";
        "just-extend@4.1.1" = f "just-extend" "4.1.1" y "158f1fdb01f128c411dc8b286a7b4837b3545282" [];
        "just-extend@^4.0.2" = s."just-extend@4.1.1";
        "lie@3.3.0" = f "lie" "3.3.0" y "dcf82dee545f46074daf200c7c1c5a08e0f40f6a" [
          (s."immediate@~3.0.5")
          ];
        "lie@~3.3.0" = s."lie@3.3.0";
        "lodash@4.17.20" = f "lodash" "4.17.20" y "b44a9b6297bcb698f1c51a3545a2b3b368d59c52" [];
        "lodash@^4.17.15" = s."lodash@4.17.20";
        "lolex@4.2.0" = f "lolex" "4.2.0" y "ddbd7f6213ca1ea5826901ab1222b65d714b3cd7" [];
        "lolex@5.1.2" = f "lolex" "5.1.2" y "953694d098ce7c07bc5ed6d0e42bc6c0c6d5a367" [
          (s."@sinonjs/commons@^1.7.0")
          ];
        "lolex@^4.2.0" = s."lolex@4.2.0";
        "lolex@^5.0.1" = s."lolex@5.1.2";
        "media-typer@0.3.0" = f "media-typer" "0.3.0" y "8710d7af0aa626f8fffa1ce00168545263255748" [];
        "merge-descriptors@1.0.1" = f "merge-descriptors" "1.0.1" y "b00aaa556dd8b44568150ec9d1b953f3f90cbb61" [];
        "methods@1.1.2" = f "methods" "1.1.2" y "5529a4d67654134edcc5266656835b0f851afcee" [];
        "methods@~1.1.2" = s."methods@1.1.2";
        "mime-db@1.44.0" = f "mime-db" "1.44.0" y "fa11c5eb0aca1334b4233cb4d52f10c5a6272f92" [];
        "mime-types@2.1.27" = f "mime-types" "2.1.27" y "47949f98e279ea53119f5722e0f34e529bec009f" [
          (s."mime-db@1.44.0")
          ];
        "mime-types@~2.1.17" = s."mime-types@2.1.27";
        "mime-types@~2.1.24" = s."mime-types@2.1.27";
        "mime@1.6.0" = f "mime" "1.6.0" y "32cd9e5c64553bd58d19a568af452acff04981b1" [];
        "minimatch@3.0.4" = f "minimatch" "3.0.4" y "5166e286457f03306064be5497e8dbb0c3d32083" [
          (s."brace-expansion@^1.1.7")
          ];
        "minimatch@^3.0.4" = s."minimatch@3.0.4";
        "minimist@0.0.8" = f "minimist" "0.0.8" y "857fcabfc3397d2625b8228262e86aa7a011b05d" [];
        "minimist@1.2.5" = f "minimist" "1.2.5" y "67d66014b66a6a8aaa0c083c5fd58df4e4e97602" [];
        "minimist@^1.2.5" = s."minimist@1.2.5";
        "mkdirp@0.5.1" = f "mkdirp" "0.5.1" y "30057438eac6cf7f8c4767f38648d6697d75c903" [
          (s."minimist@0.0.8")
          ];
        "mkdirp@0.5.5" = f "mkdirp" "0.5.5" y "d91cefd62d1436ca0f41620e251288d420099def" [
          (s."minimist@^1.2.5")
          ];
        "mkdirp@^0.5.1" = s."mkdirp@0.5.5";
        "mocha@5.2.0" = f "mocha" "5.2.0" y "6d8ae508f59167f940f2b5b3c4a612ae50c90ae6" [
          (s."browser-stdout@1.3.1")
          (s."commander@2.15.1")
          (s."debug@3.1.0")
          (s."diff@3.5.0")
          (s."escape-string-regexp@1.0.5")
          (s."glob@7.1.2")
          (s."growl@1.10.5")
          (s."he@1.1.1")
          (s."minimatch@3.0.4")
          (s."mkdirp@0.5.1")
          (s."supports-color@5.4.0")
          ];
        "mocha@^5.2.0" = s."mocha@5.2.0";
        "ms@2.0.0" = f "ms" "2.0.0" y "5608aeadfc00be6c2901df5f9861788de0d597c8" [];
        "ms@2.1.1" = f "ms" "2.1.1" y "30a5864eb3ebb0a66f2ebe6d727af06a09d86e0a" [];
        "multer@1.4.2" = f "multer" "1.4.2" y "2f1f4d12dbaeeba74cb37e623f234bf4d3d2057a" [
          (s."append-field@^1.0.0")
          (s."busboy@^0.2.11")
          (s."concat-stream@^1.5.2")
          (s."mkdirp@^0.5.1")
          (s."object-assign@^4.1.1")
          (s."on-finished@^2.3.0")
          (s."type-is@^1.6.4")
          (s."xtend@^4.0.0")
          ];
        "multer@^1.4.2" = s."multer@1.4.2";
        "negotiator@0.6.2" = f "negotiator" "0.6.2" y "feacf7ccf525a77ae9634436a64883ffeca346fb" [];
        "nise@1.5.3" = f "nise" "1.5.3" y "9d2cfe37d44f57317766c6e9408a359c5d3ac1f7" [
          (s."@sinonjs/formatio@^3.2.1")
          (s."@sinonjs/text-encoding@^0.7.1")
          (s."just-extend@^4.0.2")
          (s."lolex@^5.0.1")
          (s."path-to-regexp@^1.7.0")
          ];
        "nise@^1.5.2" = s."nise@1.5.3";
        "object-assign@4.1.1" = f "object-assign" "4.1.1" y "2109adc7965887cfc05cbbd442cac8bfbb360863" [];
        "object-assign@^4.1.1" = s."object-assign@4.1.1";
        "on-finished@2.3.0" = f "on-finished" "2.3.0" y "20f1336481b083cd75337992a16971aa2d906947" [
          (s."ee-first@1.1.1")
          ];
        "on-finished@^2.3.0" = s."on-finished@2.3.0";
        "on-finished@~2.3.0" = s."on-finished@2.3.0";
        "once@1.4.0" = f "once" "1.4.0" y "583b1aa775961d4b113ac17d9c50baef9dd76bd1" [
          (s."wrappy@1")
          ];
        "once@^1.3.0" = s."once@1.4.0";
        "os-tmpdir@1.0.2" = f "os-tmpdir" "1.0.2" y "bbe67406c79aa85c5cfec766fe5734555dfa1274" [];
        "os-tmpdir@~1.0.1" = s."os-tmpdir@1.0.2";
        "pako@1.0.11" = f "pako" "1.0.11" y "6c9599d340d54dfd3946380252a35705a6b992bf" [];
        "pako@~1.0.2" = s."pako@1.0.11";
        "parseurl@1.3.3" = f "parseurl" "1.3.3" y "9da19e7bee8d12dff0513ed5b76957793bc2e8d4" [];
        "parseurl@~1.3.2" = s."parseurl@1.3.3";
        "parseurl@~1.3.3" = s."parseurl@1.3.3";
        "path-is-absolute@1.0.1" = f "path-is-absolute" "1.0.1" y "174b9268735534ffbc7ace6bf53a5a9e1b5c5f5f" [];
        "path-is-absolute@^1.0.0" = s."path-is-absolute@1.0.1";
        "path-to-regexp@0.1.7" = f "path-to-regexp" "0.1.7" y "df604178005f522f15eb4490e7247a1bfaa67f8c" [];
        "path-to-regexp@1.8.0" = f "path-to-regexp" "1.8.0" y "887b3ba9d84393e87a0a0b9f4cb756198b53548a" [
          (s."isarray@0.0.1")
          ];
        "path-to-regexp@^1.7.0" = s."path-to-regexp@1.8.0";
        "process-nextick-args@2.0.1" = f "process-nextick-args" "2.0.1" y "7820d9b16120cc55ca9ae7792680ae7dba6d7fe2" [];
        "process-nextick-args@~2.0.0" = s."process-nextick-args@2.0.1";
        "proxy-addr@2.0.6" = f "proxy-addr" "2.0.6" y "fdc2336505447d3f2f2c638ed272caf614bbb2bf" [
          (s."forwarded@~0.1.2")
          (s."ipaddr.js@1.9.1")
          ];
        "proxy-addr@~2.0.5" = s."proxy-addr@2.0.6";
        "qs@6.7.0" = f "qs" "6.7.0" y "41dc1a015e3d581f1621776be31afb2876a9b1bc" [];
        "range-parser@1.2.1" = f "range-parser" "1.2.1" y "3cf37023d199e1c24d1a55b84800c2f3e6468031" [];
        "range-parser@~1.2.1" = s."range-parser@1.2.1";
        "raw-body@2.4.0" = f "raw-body" "2.4.0" y "a1ce6fb9c9bc356ca52e89256ab59059e13d0332" [
          (s."bytes@3.1.0")
          (s."http-errors@1.7.2")
          (s."iconv-lite@0.4.24")
          (s."unpipe@1.0.0")
          ];
        "readable-stream@1.1.14" = f "readable-stream" "1.1.14" y "7cf4c54ef648e3813084c636dd2079e166c081d9" [
          (s."core-util-is@~1.0.0")
          (s."inherits@~2.0.1")
          (s."isarray@0.0.1")
          (s."string_decoder@~0.10.x")
          ];
        "readable-stream@1.1.x" = s."readable-stream@1.1.14";
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
        "readable-stream@~2.3.6" = s."readable-stream@2.3.7";
        "rimraf@2.7.1" = f "rimraf" "2.7.1" y "35797f13a7fdadc566142c29d4f07ccad483e3ec" [
          (s."glob@^7.1.3")
          ];
        "rimraf@^2.7.1" = s."rimraf@2.7.1";
        "safe-buffer@5.1.2" = f "safe-buffer" "5.1.2" y "991ec69d296e0313747d59bdfd2b745c35f8828d" [];
        "safe-buffer@~5.1.0" = s."safe-buffer@5.1.2";
        "safe-buffer@~5.1.1" = s."safe-buffer@5.1.2";
        "safer-buffer@2.1.2" = f "safer-buffer" "2.1.2" y "44fa161b0187b9549dd84bb91802f9bd8385cd6a" [];
        "safer-buffer@>= 2.1.2 < 3" = s."safer-buffer@2.1.2";
        "send@0.17.1" = f "send" "0.17.1" y "c1d8b059f7900f7466dd4938bdc44e11ddb376c8" [
          (s."debug@2.6.9")
          (s."depd@~1.1.2")
          (s."destroy@~1.0.4")
          (s."encodeurl@~1.0.2")
          (s."escape-html@~1.0.3")
          (s."etag@~1.8.1")
          (s."fresh@0.5.2")
          (s."http-errors@~1.7.2")
          (s."mime@1.6.0")
          (s."ms@2.1.1")
          (s."on-finished@~2.3.0")
          (s."range-parser@~1.2.1")
          (s."statuses@~1.5.0")
          ];
        "serve-index@1.9.1" = f "serve-index" "1.9.1" y "d3768d69b1e7d82e5ce050fff5b453bea12a9239" [
          (s."accepts@~1.3.4")
          (s."batch@0.6.1")
          (s."debug@2.6.9")
          (s."escape-html@~1.0.3")
          (s."http-errors@~1.6.2")
          (s."mime-types@~2.1.17")
          (s."parseurl@~1.3.2")
          ];
        "serve-index@^1.9.1" = s."serve-index@1.9.1";
        "serve-static@1.14.1" = f "serve-static" "1.14.1" y "666e636dc4f010f7ef29970a88a674320898b2f9" [
          (s."encodeurl@~1.0.2")
          (s."escape-html@~1.0.3")
          (s."parseurl@~1.3.3")
          (s."send@0.17.1")
          ];
        "set-immediate-shim@1.0.1" = f "set-immediate-shim" "1.0.1" y "4b2b1b27eb808a9f8dcc481a58e5e56f599f3f61" [];
        "set-immediate-shim@~1.0.1" = s."set-immediate-shim@1.0.1";
        "setprototypeof@1.1.0" = f "setprototypeof" "1.1.0" y "d0bd85536887b6fe7c0d818cb962d9d91c54e656" [];
        "setprototypeof@1.1.1" = f "setprototypeof" "1.1.1" y "7e95acb24aa92f5885e0abef5ba131330d4ae683" [];
        "sinon@7.5.0" = f "sinon" "7.5.0" y "e9488ea466070ea908fd44a3d6478fd4923c67ec" [
          (s."@sinonjs/commons@^1.4.0")
          (s."@sinonjs/formatio@^3.2.1")
          (s."@sinonjs/samsam@^3.3.3")
          (s."diff@^3.5.0")
          (s."lolex@^4.2.0")
          (s."nise@^1.5.2")
          (s."supports-color@^5.5.0")
          ];
        "sinon@^7.5.0" = s."sinon@7.5.0";
        "statuses@1.5.0" = f "statuses" "1.5.0" y "161c7dac177659fd9811f43771fa99381478628c" [];
        "statuses@>= 1.4.0 < 2" = s."statuses@1.5.0";
        "statuses@>= 1.5.0 < 2" = s."statuses@1.5.0";
        "statuses@~1.5.0" = s."statuses@1.5.0";
        "streamsearch@0.1.2" = f "streamsearch" "0.1.2" y "808b9d0e56fc273d809ba57338e929919a1a9f1a" [];
        "string_decoder@0.10.31" = f "string_decoder" "0.10.31" y "62e203bc41766c6c28c9fc84301dab1c5310fa94" [];
        "string_decoder@1.1.1" = f "string_decoder" "1.1.1" y "9cf1611ba62685d7030ae9e4ba34149c3af03fc8" [
          (s."safe-buffer@~5.1.0")
          ];
        "string_decoder@~0.10.x" = s."string_decoder@0.10.31";
        "string_decoder@~1.1.1" = s."string_decoder@1.1.1";
        "supports-color@5.4.0" = f "supports-color" "5.4.0" y "1c6b337402c2137605efe19f10fec390f6faab54" [
          (s."has-flag@^3.0.0")
          ];
        "supports-color@5.5.0" = f "supports-color" "5.5.0" y "e2e69a44ac8772f78a1ec0b35b689df6530efc8f" [
          (s."has-flag@^3.0.0")
          ];
        "supports-color@^5.5.0" = s."supports-color@5.5.0";
        "tmp@0.0.30" = f "tmp" "0.0.30" y "72419d4a8be7d6ce75148fd8b324e593a711c2ed" [
          (s."os-tmpdir@~1.0.1")
          ];
        "toidentifier@1.0.0" = f "toidentifier" "1.0.0" y "7e1be3470f1e77948bc43d94a3c8f4d7752ba553" [];
        "type-detect@4.0.8" = f "type-detect" "4.0.8" y "7646fb5f18871cfbb7749e69bd39a6388eb7450c" [];
        "type-is@1.6.18" = f "type-is" "1.6.18" y "4e552cd05df09467dcbc4ef739de89f2cf37c131" [
          (s."media-typer@0.3.0")
          (s."mime-types@~2.1.24")
          ];
        "type-is@^1.6.4" = s."type-is@1.6.18";
        "type-is@~1.6.17" = s."type-is@1.6.18";
        "type-is@~1.6.18" = s."type-is@1.6.18";
        "typedarray@0.0.6" = f "typedarray" "0.0.6" y "867ac74e3864187b1d3d47d996a78ec5c8830777" [];
        "typedarray@^0.0.6" = s."typedarray@0.0.6";
        "unpipe@1.0.0" = f "unpipe" "1.0.0" y "b2bf4ee8514aae6165b4817829d21b2ef49904ec" [];
        "unpipe@~1.0.0" = s."unpipe@1.0.0";
        "util-deprecate@1.0.2" = f "util-deprecate" "1.0.2" y "450d4dc9fa70de732762fbd2d4a28981419a0ccf" [];
        "util-deprecate@~1.0.1" = s."util-deprecate@1.0.2";
        "utils-merge@1.0.1" = f "utils-merge" "1.0.1" y "9f95710f50a267947b2ccc124741c1028427e713" [];
        "vary@1.1.2" = f "vary" "1.1.2" y "2299f02c6ded30d4a5961b0b9f74524a18f634fc" [];
        "vary@~1.1.2" = s."vary@1.1.2";
        "wrappy@1" = s."wrappy@1.0.2";
        "wrappy@1.0.2" = f "wrappy" "1.0.2" y "b5243d8f3ec1aa35f1364605bc0d1036e30ab69f" [];
        "xtend@4.0.2" = f "xtend" "4.0.2" y "bb72779f5fa465186b1f438f674fa347fdb5db54" [];
        "xtend@^4.0.0" = s."xtend@4.0.2";
        }