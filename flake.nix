{
  description = "The cosmos is a nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs =
    {
      nixpkgs,
      disko,
      agenix,
      home-manager,
      nixvim,
      stylix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      overlays = import ./overlays/default.nix;
    in
    {
      nixosConfigurations = {
        stellar = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            disko.nixosModules.disko
            stylix.nixosModules.stylix
            agenix.nixosModules.default
            ./hosts/stellar/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        "null" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system overlays;
            config.allowUnfree = true;
          };
          extraSpecialArgs = { inherit inputs; };
          modules = [
            nixvim.homeModules.nixvim
            stylix.homeModules.stylix
            ./users/null/home-configurations.nix
          ];
        };
      };
    };
}
