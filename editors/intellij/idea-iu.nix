# This derivation downloads IntelliJ
{ pkgs ? import <nixpkgs> {} }:

with pkgs;
stdenv.mkDerivation {
  name = "idea-iu";
  builder = "${bash}/bin/bash";
  args = [./builder.sh];
  ideawrapper = ./ideawrapper.sh;
  binary = fetchurl {
    url = "https://download.jetbrains.com/idea/ideaIU-2020.3.tar.gz";
    sha256 = "6c84a66b1e3326ede32525b4cf6b317b6468556eb0585d84bcd0bdab69a05d73";
  };

  unpack = ./unpack.sh;

  jdk = jdk11;
  inherit coreutils;
  inherit gnutar;
  inherit gzip;
  inherit gnused;
}
