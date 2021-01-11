{ pkgs ? import <nixpkgs> {}, 
  latex ? pkgs.texlive.combined.scheme-full,
  pygments ? pkgs.python38Packages.pygments,
  additionalInputs ? [],
  ...}@attrs: 

let rest = builtins.removeAttrs attrs [
   "pkgs"
   "latex"
   "pygments"
]; in 
pkgs.mkShell ({
  buildInputs = [
    latex
    pygments
  ] ++ additionalInputs;
} // rest)
