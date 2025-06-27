{
  description = "David's NixOS configs (LEANDRO EDITION)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: let
    forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" ];
  in {
    nixosConfigurations.kankerpad = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
	vars = import ./vars.nix;
      };
      system = "x86_64-linux";
      modules = [
        ./machines/kankerpad
      ];
    };

    packages = nixpkgs.lib.recursiveUpdate (forAllSystems (system: {
      dumpyara = nixpkgs.legacyPackages.${system}.callPackage ./packages/dumpyara.nix { };
      mdns-scan = nixpkgs.legacyPackages.${system}.callPackage ./packages/mdns-scan.nix { };
      ttf-ms-win11 = nixpkgs.legacyPackages.${system}.callPackage ./packages/ttf-ms-win11.nix { };
      samfirm-js = nixpkgs.legacyPackages.${system}.callPackage ./packages/samfirm-js.nix { };
    })) {
      x86_64-linux = {
        #ida-pro = nixpkgs.legacyPackages.x86_64-linux.callPackage ./packages/ida-pro.nix { };
        odin4 = nixpkgs.legacyPackages.x86_64-linux.callPackage ./packages/odin4.nix { };
        outfox-alpha5 = nixpkgs.legacyPackages.x86_64-linux.callPackage ./packages/outfox-alpha5.nix { };
      };
    };
  };
}
