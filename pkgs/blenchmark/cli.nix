{
  lib,
  fetchzip,
  stdenv
}:
let
  pname = "blenchmark-cli";
  version = "3.1.0";

  src = fetchzip {
    url = "https://download.blender.org/release/BlenderBenchmark2.0/launcher/benchmark-launcher-cli-${version}-linux.tar.gz";
    hash = "sha256-Jl/RGj1/r7wP3GUjuZOahVPnnNwex3FMyTA5+52KHFM=";
    stripRoot = false;
  };
in
stdenv.mkDerivation {
  inherit pname version src;

  buildPhase = ''
    mkdir -p $out
    cp README.txt $out
    cp benchmark-launcher-cli $out/blenchmark-cli
  '';

  installPhase = ''
    mkdir -p $out
    cp README.txt $out
    cp benchmark-launcher-cli $out/blenchmark-cli
  '';
}