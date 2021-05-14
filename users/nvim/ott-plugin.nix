{ nixpkgs ? import <nixpkgs> {} }:

nixpkgs.vimUtils.buildVimPluginFrom2Nix {
  pname = "ambienttalk-vim";
  version = "2020-02-13";
  src = nixpkgs.fetchFromGitHub {
    owner = "psosera";
    repo = "ott-vim";
    rev = "6a860ed3fa2b3adcc47a122abd995af21fa56a20";
    sha256 = "sha256-m9OOYMg1WDZeB6NiU8ws+DEe9Xen/UEDRrlwAvqk5i0=";
  };

  meta.homepage = "https://github.com/psosera/ott-vim";
}
