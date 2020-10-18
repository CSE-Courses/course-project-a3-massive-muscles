let
 template = {  }:
  allDeps:
    {
      key = { name = "postcss-preset-env"; scope = ""; };
      version = "6.7.0";
      nodeBuildInputs = let
        a = allDeps;
      in [
        (a."postcss-env-function@^2.0.2")
        (a."postcss-color-functional-notation@^2.0.1")
        (a."postcss-page-break@^2.0.0")
        (a."caniuse-lite@^1.0.30000981")
        (a."postcss-double-position-gradients@^1.0.0")
        (a."postcss-nesting@^7.0.0")
        (a."postcss-replace-overflow-wrap@^3.0.0")
        (a."postcss-focus-within@^3.0.0")
        (a."@babel/preset-env@^7.5.2")
        (a."postcss-color-hex-alpha@^5.0.3")
        (a."postcss-place@^4.0.1")
        (a."cssdb@^4.4.0")
        (a."rollup@^1.16.6")
        (a."postcss@^7.0.17")
        (a."postcss-color-gray@^5.0.0")
        (a."postcss-simple-vars@^5.0.2")
        (a."pre-commit@^1.2.2")
        (a."postcss-selector-matches@^4.0.0")
        (a."postcss-selector-not@^4.0.0")
        (a."postcss-tape@^4.0.0")
        (a."postcss-overflow-shorthand@^2.0.0")
        (a."eslint@^5.16.0")
        (a."postcss-image-set-function@^3.0.1")
        (a."postcss-color-rebeccapurple@^4.0.1")
        (a."css-has-pseudo@^0.10.0")
        (a."eslint-config-dev@^2.0.0")
        (a."@babel/core@^7.5.0")
        (a."postcss-custom-media@^7.0.8")
        (a."postcss-gap-properties@^2.0.0")
        (a."babel-eslint@^10.0.2")
        (a."postcss-color-mod-function@^3.0.3")
        (a."postcss-font-variant@^4.0.0")
        (a."postcss-dir-pseudo-class@^5.0.0")
        (a."postcss-attribute-case-insensitive@^4.0.1")
        (a."postcss-logical@^3.0.0")
        (a."browserslist@^4.6.4")
        (a."autoprefixer@^9.6.1")
        (a."postcss-initial@^3.0.0")
        (a."postcss-pseudo-class-any-link@^6.0.0")
        (a."css-prefers-color-scheme@^3.1.1")
        (a."postcss-custom-selectors@^5.1.2")
        (a."postcss-lab-function@^2.0.1")
        (a."rollup-plugin-babel@^4.3.3")
        (a."postcss-custom-properties@^8.0.11")
        (a."css-blank-pseudo@^0.1.4")
        (a."postcss-focus-visible@^4.0.0")
        (a."postcss-media-minmax@^4.0.0")
        ];
      meta = {
        description = "Convert modern CSS into something browsers understand";
        license = "CC0-1.0";
        homepage = "https://github.com/csstools/postcss-preset-env#readme";
        };
      };
in
import ./generic.nix {
  inherit template;
  depsPath = ./deps/postcss-preset-env.nix;

  pname = "postcss-preset-env";
  version = "6.7.0";
  sha256 = "0brysd1d04kb8r0q9y1aaih7x4s5cv0a5f6js7gkp3dn9sqv2w6n";
}
