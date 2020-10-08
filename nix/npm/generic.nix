{ template, depsPath, pname, version, sha256 }:
{ runCommand, callPackage, fetchurl, yarn2nix }:

with yarn2nix.nixLib;

let
  source = runCommand "npmjs-${pname}-${version}" {
    src = fetchurl {
      url = "https://registry.npmjs.org/${pname}/-/${pname}-${version}.tgz";
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
