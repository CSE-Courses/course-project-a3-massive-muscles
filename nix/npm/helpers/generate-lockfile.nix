# You might ask why am this is impure, simply put, this isn't meant to be used
# But that's a lie, it's meant to be used because I personally didn't want to pollute
# my directory with node_modules, so there you have it, I like my clean directories
{ nixpkgs ? import <nixpkgs> { } }:

with nixpkgs;
let
  # Damn right, hardcoded because it doesn't matter
  pname = "cssnano";
  version = "4.1.10";
  sha256 = "0ir6lv5a0mwmjlnw3w361wx8f7sq02i0nj8av0wla3m96jd17q0n";
  outputHash = "1s68sjsmrd1vkz9ndmwwmp8aa5ngijh5qfqvcp4kpykm8hzdp2jx";

  generateLockfile = stdenv.mkDerivation {
    name = "generate-lockfile";

    src = fetchurl {
      url = "https://registry.npmjs.org/${pname}/-/${pname}-${version}.tgz";
      inherit sha256;
    };

    nativeBuildInputs = [ nodejs nodePackages.yarn ];

    outputHashAlgo = "sha256";
    outputHashMode = "recursive";
    inherit outputHash;

    buildPhase = ''
      export HOME=.
      yarn install
    '';

    installPhase = ''
      mkdir -p $out
      cp package.json $out
      cp yarn.lock $out
    '';
  };
in
generateLockfile
