{ pkgs ? import <nixpkgs> {}, 
  mkBuild ? import ../utils/mkbuild.nix,
  jdk ? pkgs.jdk11,
  python3 ? pkgs.python3,
  z3Version ? "4.8.9" }:

mkBuild {
  name = "z3-java";
  src = pkgs.fetchurl {
    url = "https://github.com/Z3Prover/z3/archive/z3-${z3Version}.tar.gz";
    sha256 = "c9fd04b9b33be74fffaac3ec2bc2c320d1a4cc32e395203c55126b12a14ff3f4";
  };
  inherit z3Version;
  buildScript = ./build.sh;
  binaries = [ jdk python3 ];
}
