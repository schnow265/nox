{
  lib,
  fetchzip,
  stdenv,
  xorg,
  libGL
}:
let
  pname = "blenchmark-gui";
  version = "3.1.0";

  src = fetchzip {
    url = "https://download.blender.org/release/BlenderBenchmark2.0/launcher/benchmark-launcher-${version}-linux.tar.gz";
    hash = "sha256-af9RJeIdtOsCdc6r58BsRKomW1j5wa999BunAfcE2dg=";
  };
in
stdenv.mkDerivation {
  inherit pname version src;

  buildInputs = [ xorg.libX11 libGL ];

  buildPhase = ''
    mkdir -p $out
    cp benchmark-launcher $out/blenchmark-gui
  '';

  installPhase = ''
    mkdir -p $out
    cp benchmark-launcher $out/blenchmark-gui
  '';
}