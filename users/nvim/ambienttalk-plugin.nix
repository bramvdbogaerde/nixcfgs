{ nixpkgs ? import <nixpkgs> {} }:

nixpkgs.vimUtils.buildVimPluginFrom2Nix {
  pname = "ambienttalk-vim";
  version = "2020-02-13";
  src = nixpkgs.fetchFromGitHub {
    owner = "bramvdbogaerde";
    repo = "ambienttalk.vim";
    rev = "cfdbfb1c70630152465ed50a6eecabbca0b96f79";
    sha256 = "bdIO600hGK97GjduUEsdJOAkmHkgBs3psnx8zcMpUQY=";
  };

  meta.homepage = "https://github.com/bramvdbogaerde/ambienttalk.vim";
}
