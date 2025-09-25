{
  description = "The cosmos is a nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    disko = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/disko/latest";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { nixpkgs, disko, agenix, home-manager, nix-colors, ... }@inputs: {
    nixosConfigurations = {
      void = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          hostname = "void";
        };
        system = "x86_64-linux";
        modules = [
          ./lib/style.nix
          disko.nixosModules.disko
          agenix.nixosModules.default
          ./hosts/void/configuration.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };
  };
}
