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
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };


    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };


  outputs = { self, nixpkgs, home-manager, sddm-sugar-candy-nix, stylix, nixvim, nix-index-database, zen-browser, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
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
                extraSpecialArgs = {  inherit nixpkgs home-manager zen-browser inputs; };
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
      homeConfigurations = {
        "kira" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
          modules = [
            #stylix.homeModules.stylix
            ../user-config/kira/home.nix
          ];
          extraSpecialArgs = {  inherit nixpkgs home-manager zen-browser inputs; };
        };
      };
    };

}

