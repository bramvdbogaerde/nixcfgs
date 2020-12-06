{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.python38Full
    pkgs.python38Packages.pip
    pkgs.python38Packages.notebook
    pkgs.python38Packages.venvShellHook
  ];

  venvDir = ".venv";

}
