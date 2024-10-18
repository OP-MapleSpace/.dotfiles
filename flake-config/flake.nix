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
    /*stylix = {
      url = "github:trueNAHO/stylix/stylix-downgrade-and-lock-tinted-kitty-input";
      inputs.nixpkgs.follows = "nixpkgs";
    };*/

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    ags.url = "github:Aylur/ags";

    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nixos Hardware
    #nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # NUR
    #nurpkgs = {
      #url = github:nix-community/NUR;
      #inputs.nixpkgs.follows = "nixpkgs";
    #};

  };


  outputs = { self, nixpkgs, home-manager, /*hyprland, */sddm-sugar-candy-nix, firefox, stylix, ags, nixvim, nix-index-database, ... }@inputs:
    let
      system = "x86_64-linux";
      #specialArgs = inputs;
    in
    {
      nixosConfigurations = {
        EtoileLaplace = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                users.l = import ../user-config/l/home.nix;
                users.d = import ../user-config/d/home.nix;
              };
            }
          ];
        };
        MapleWorld = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                users.maplespace = import ../user-config/maplespace/home.nix;
                extraSpecialArgs = {  inherit system nixpkgs home-manager inputs; };
              };
            }

            #hyprland.nixosModules.default

            stylix.nixosModules.stylix

            nix-index-database.nixosModules.nix-index
            { programs.nix-index-database.comma.enable = true; }

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

