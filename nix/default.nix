{ stdenv }:

{ src }:
stdenv.mkDerivation {
  name = "a3-massive-muscles";
  inherit src;

  buildPhase = ''
    # Copy over assets
    mkdir -p public
    cp *.html public
    cp -r CSS JS public
  '';

  installPhase = ''
    mv --verbose --no-target-directory public $out
  '';
}
