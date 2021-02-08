{ pkgs ? import <nixpkgs> {}, attrs ? {} }: 

let defaultAttrs = (with pkgs; {
  builder = "${bash}/bin/bash";
  args = [ ./builder.sh ];
  baseInputs = [ gnumake gcc coreutils cmake cudaPackages.cudatoolkit_11 perl ];
  ethminer = builtins.fetchGit {
    url = "https://github.com/ethereum-mining/ethminer";
    ref = "master"; 
    rev = "47ae149ee734a82c453d23ef46fed78da109b73e";
    fetchSubmodules = true;
  };
  name = "ethminer";
  system = builtins.currentSystem;
}) ; in
derivation (defaultAttrs // attrs)
