{ pkgs ? import <nixpkgs> {} }:

import ./idea-iu.nix {
  url = "https://download.jetbrains.com/idea/ideaIU-2019.3.5.tar.gz";
  sha256 = "ab100ea18628b188a8687d2e93f1d4428f03e989da1d2336b2f63f73a2debf4d";
}




