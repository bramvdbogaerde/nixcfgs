{ pkgs ? import <nixpkgs> {}, 
  latex ? pkgs.texlive.combined.scheme-full,
  additionalInputs ? [],
  ...}@attrs: 

let rest = builtins.removeAttrs attrs [
   "pkgs"
   "latex"
]; in 
pkgs.mkShell ({
  buildInputs = [
    latex
  ] ++ additionalInputs;
} // rest)
