{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.python38Full
    pkgs.python38Packages.pip
    # pkgs.python38Packages.notebook
    pkgs.python38Packages.venvShellHook
    pkgs.stdenv.cc.cc.lib  
  ];
  venvDir = ".venv";

  LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib64:$LD_LIBRARY_PATH";
}
