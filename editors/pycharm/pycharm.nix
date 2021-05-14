# This derivation downloads IntelliJ
{ url ? "https://download.jetbrains.com/python/pycharm-professional-2020.3.5.tar.gz", 
  sha256 ? "d30b78b7deb680a1a9f6a36ca09ab1ed602eb8cb760f6f8083780ba3cd46b8e3",
  pkgs ? import <nixpkgs> {} }:

with pkgs;
stdenv.mkDerivation {
  name = "pycharm";
  builder = "${bash}/bin/bash";
  args = [./builder.sh];
  ideawrapper = ./pycharmwrapper.sh;
  binary = fetchurl {
    inherit url;
    inherit sha256;
  };

  unpack = ./unpack.sh;

  jdk = jdk11;
  inherit coreutils;
  inherit gnutar;
  inherit gzip;
  inherit gnused;
  inherit findutils;
}
