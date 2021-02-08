{
  description = "Ethminer";
  
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-20.03;

  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-linux = import ./ethminer.nix nixpkgs;

  };
}
