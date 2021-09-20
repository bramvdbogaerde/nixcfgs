# A very basic build environment, that includes most of the required tools to make useful build environments.
# The only required attribute is the buildScript which is executed after setting up all the environment variables.
# 
# All the other attributes that you pass are merged into a final set that is passed to mkDerivation
# 
# If you would like to have other binaries being added to the build path, you can do so by providing a binaries attribute.
{ pkgs ? import <nixpkgs> {}, buildScript, binaries, ... }@attrs: 

with pkgs;
let rest = builtins.removeAttrs attrs [
  "pkgs"
  "buildScript"
  "binaries"
] ; in

stdenv.mkDerivation ({
  builder = "${bash}/bin/bash";
  args = [./setup.sh];
  binaries = [ coreutils gnutar gzip gnused gnumake gcc binutils.bintools busybox ] ++ binaries;
  inherit buildScript;
} // rest)
