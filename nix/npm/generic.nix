{ template, depsPath, pname, version, sha256 }:
{ lib, runCommand, callPackage, fetchurl, yarn2nix }:

with yarn2nix.nixLib;

let
  valid_pname = lib.strings.sanitizeDerivationName pname;
  # reverseList is potentially extremely problematic, but it should work fine
  name_split = lib.reverseList (builtins.split "/" pname);
  # Should be split into [ pkg_name "" pkg_group ], one empty element for match
  pkg_group = if builtins.length name_split == 3 then builtins.elemAt name_split 2 else "";
  pkg_name = builtins.elemAt name_split 0;

  source = runCommand "npmjs-${valid_pname}-${version}" {
    src = fetchurl {
      url = "https://registry.npmjs.org/${lib.optionalString (pkg_group != "") "${pkg_group}/"}${pkg_name}/-/${pkg_name}-${version}.tgz";
      inherit sha256;
    };
  } ''
    mkdir -p $out
    tar xvzf $src -C $out --strip-components 1
  '';
in
buildNodePackage
  ({ src = source; } //
    callTemplate template
      (buildNodeDeps (callPackage depsPath { })))
