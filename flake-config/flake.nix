# thanks to Nathan for his help with this! https://github.com/Nathan13888/
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    ags.url = "github:Aylur/ags";

    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    # Nixos Hardware
    #nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # NUR
    #nurpkgs = {
      #url = github:nix-community/NUR;
      #inputs.nixpkgs.follows = "nixpkgs";
    #};

  };


  outputs = { self, nixpkgs, home-manager, hyprland, sddm-sugar-candy-nix, firefox, stylix, ags, nixvim, ... }@inputs:
    let
      system = "x86_64-linux";
      specialArgs = inputs;
    in
    {
      nixosConfigurations = {
        #AlphaHlynurSolare = nixpkgs.lib.nixosSystem {};
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

            hyprland.nixosModules.default

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
      substituters = [
        "https://hyprland.cachix.org"
        "https://cache.nixos.org/"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };

}

