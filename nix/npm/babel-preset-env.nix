let
 template = {  }:
  allDeps:
    {
      key = { name = "preset-env"; scope = "babel"; };
      version = "7.11.5";
      nodeBuildInputs = let
        a = allDeps;
      in [
        (a."@babel/plugin-syntax-async-generators@^7.8.0")
        (a."@babel/plugin-transform-async-to-generator@^7.10.4")
        (a."@babel/plugin-transform-named-capturing-groups-regex@^7.10.4")
        (a."@babel/plugin-syntax-logical-assignment-operators@^7.10.4")
        (a."@babel/plugin-transform-block-scoped-functions@^7.10.4")
        (a."@babel/plugin-proposal-nullish-coalescing-operator@^7.10.4")
        (a."@babel/helper-plugin-utils@^7.10.4")
        (a."@babel/plugin-transform-classes@^7.10.4")
        (a."@babel/plugin-transform-modules-commonjs@^7.10.4")
        (a."@babel/plugin-syntax-dynamic-import@^7.8.0")
        (a."@babel/plugin-syntax-nullish-coalescing-operator@^7.8.0")
        (a."@babel/plugin-transform-function-name@^7.10.4")
        (a."@babel/plugin-transform-unicode-escapes@^7.10.4")
        (a."@babel/plugin-transform-literals@^7.10.4")
        (a."@babel/plugin-transform-unicode-regex@^7.10.4")
        (a."@babel/plugin-transform-sticky-regex@^7.10.4")
        (a."@babel/plugin-transform-typeof-symbol@^7.10.4")
        (a."invariant@^2.2.2")
        (a."@babel/plugin-proposal-class-properties@^7.10.4")
        (a."@babel/plugin-syntax-top-level-await@^7.10.4")
        (a."@babel/plugin-transform-parameters@^7.10.4")
        (a."@babel/plugin-proposal-optional-catch-binding@^7.10.4")
        (a."@babel/helper-plugin-test-runner@^7.10.4")
        (a."@babel/plugin-syntax-export-namespace-from@^7.8.3")
        (a."@babel/compat-data@^7.11.0")
        (a."levenary@^1.1.1")
        (a."@babel/plugin-transform-regenerator@^7.10.4")
        (a."@babel/helper-fixtures@^7.10.4")
        (a."@babel/plugin-proposal-private-methods@^7.10.4")
        (a."@babel/plugin-proposal-json-strings@^7.10.4")
        (a."@babel/plugin-transform-block-scoping@^7.10.4")
        (a."@babel/plugin-proposal-optional-chaining@^7.11.0")
        (a."@babel/core@^7.11.5")
        (a."@babel/types@^7.11.5")
        (a."@babel/plugin-transform-duplicate-keys@^7.10.4")
        (a."@babel/plugin-syntax-json-strings@^7.8.0")
        (a."@babel/plugin-syntax-numeric-separator@^7.10.4")
        (a."@babel/plugin-transform-dotall-regex@^7.10.4")
        (a."@babel/plugin-transform-template-literals@^7.10.4")
        (a."@babel/plugin-proposal-dynamic-import@^7.10.4")
        (a."@babel/plugin-transform-arrow-functions@^7.10.4")
        (a."@babel/plugin-proposal-unicode-property-regex@^7.10.4")
        (a."@babel/plugin-transform-computed-properties@^7.10.4")
        (a."@babel/plugin-transform-shorthand-properties@^7.10.4")
        (a."@babel/plugin-transform-new-target@^7.10.4")
        (a."semver@^5.5.0")
        (a."@babel/plugin-transform-modules-umd@^7.10.4")
        (a."@babel/plugin-transform-modules-systemjs@^7.10.4")
        (a."@babel/helper-compilation-targets@^7.10.4")
        (a."@babel/plugin-syntax-optional-catch-binding@^7.8.0")
        (a."@babel/plugin-transform-for-of@^7.10.4")
        (a."@babel/plugin-syntax-class-properties@^7.10.4")
        (a."@babel/helper-module-imports@^7.10.4")
        (a."browserslist@^4.12.0")
        (a."@babel/plugin-transform-exponentiation-operator@^7.10.4")
        (a."@babel/plugin-transform-property-literals@^7.10.4")
        (a."@babel/plugin-transform-member-expression-literals@^7.10.4")
        (a."@babel/plugin-syntax-object-rest-spread@^7.8.0")
        (a."@babel/plugin-transform-spread@^7.11.0")
        (a."@babel/plugin-transform-destructuring@^7.10.4")
        (a."@babel/plugin-proposal-export-namespace-from@^7.10.4")
        (a."@babel/plugin-transform-object-super@^7.10.4")
        (a."@babel/preset-modules@^0.1.3")
        (a."@babel/plugin-transform-modules-amd@^7.10.4")
        (a."@babel/plugin-proposal-async-generator-functions@^7.10.4")
        (a."@babel/plugin-transform-reserved-words@^7.10.4")
        (a."core-js-compat@^3.6.2")
        (a."@babel/plugin-proposal-object-rest-spread@^7.11.0")
        (a."@babel/cli@^7.11.5")
        (a."@babel/plugin-proposal-numeric-separator@^7.10.4")
        (a."@babel/plugin-proposal-logical-assignment-operators@^7.11.0")
        (a."@babel/plugin-syntax-optional-chaining@^7.8.0")
        ];
      meta = {
        description = "A Babel preset for each environment.";
        license = "MIT";
        homepage = "https://babeljs.io/";
        };
      };
in
import ./generic.nix {
  inherit template;
  depsPath = ./deps/babel-preset-env.nix;

  pname = "@babel/preset-env";
  version = "7.11.5";
  sha256 = "16w0fh1gmvrcl7n6dk3a5nkzp69l0sj9j37vic71000z48jb5jb1";
}
