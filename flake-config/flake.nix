# thanks to Nathan for his help with this! https://github.com/Nathan13888/
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };


    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = { self, nixpkgs, home-manager, sddm-sugar-candy-nix, firefox, stylix, nixvim, nix-index-database, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        EtoileLaplace = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            nix-index-database.nixosModules.nix-index
            { programs.nix-index-database.comma.enable = true; }

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                users = {
                  l = import ../user-config/l/home.nix;
                  d = import ../user-config/d/home.nix;
                };
                extraSpecialArgs = {  inherit system nixpkgs home-manager inputs; };
              };
            }

            stylix.nixosModules.stylix

            sddm-sugar-candy-nix.nixosModules.default
            {
              nixpkgs = {
                overlays = [
                  sddm-sugar-candy-nix.overlays.default
                ];
              };
            }

            ../system-config/EtoileLaplace/configuration.nix
            ../system-config/EtoileLaplace/hardware-configuration.nix
          ];
        };
        MapleWorld = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            nix-index-database.nixosModules.nix-index
            { programs.nix-index-database.comma.enable = true; }

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                users.maplespace = import ../user-config/maplespace/home.nix;
                extraSpecialArgs = {  inherit system nixpkgs home-manager inputs; };
              };
            }

            stylix.nixosModules.stylix

            sddm-sugar-candy-nix.nixosModules.default
            {
              nixpkgs = {
                overlays = [
                  sddm-sugar-candy-nix.overlays.default
                ];
              };
            }

            ../system-config/MapleWorld/configuration.nix
            ../system-config/MapleWorld/hardware-configuration.nix
          ];
        };
      };
    };

}

