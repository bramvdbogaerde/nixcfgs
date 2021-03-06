{ nixpkgs ? import <nixpkgs> {} }:

nixpkgs.vimUtils.buildVimPluginFrom2Nix {
  pname = "ambienttalk-vim";
  version = "2020-02-13";
  src = nixpkgs.fetchFromGitHub {
    owner = "bramvdbogaerde";
    repo = "ambienttalk.vim";
    rev = "d2f915c56eb8231f544ac0e471357db31a282788";
    sha256 = "UbKtgyg8i7hBTGkNVqmeaj2YA1OFnFpb9Sl6GUdsI0c=";
  };

  meta.homepage = "https://github.com/bramvdbogaerde/ambienttalk.vim";
}
