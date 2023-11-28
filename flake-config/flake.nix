# thanks to Nathan for his help with this! https://github.com/Nathan13888/
{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-contrib = {
      url = github:hyprwm/contrib;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sddm-sugar-candy-nix = {
      url = gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun = {
      url = github:Kirottu/anyrun;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun-nixos-options = {
      url = github:n3oney/anyrun-nixos-options;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nixos Hardware
    #nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # NUR
    #nurpkgs = {
      #url = github:nix-community/NUR;
      #inputs.nixpkgs.follows = "nixpkgs";
    #};

    hyprland.url = "github:hyprwm/Hyprland";
  };


  outputs = inputs@{ self, nixpkgs, home-manager, hyprland, hyprland-contrib, sddm-sugar-candy-nix, anyrun, ... }:
    let
      system = "x86_64-linux";
      specialArgs = inputs;
    in
    {
      nixosConfigurations = {
        #AlphaHlynurSolare = nixpkgs.lib.nixosSystem {};
        MapleWorld = nixpkgs.lib.nixosSystem {
          modules = [

            home-manager.nixosModules.home-manager
            {
              home-manager.useUserPackages = true;
              home-manager.users.maplespace = import ../user-config/maplespace/home.nix;
              home-manager.extraSpecialArgs = {  inherit system nixpkgs home-manager inputs; };
            }

            hyprland.nixosModules.default
            {programs.hyprland.enable = true;}

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
            # ...
          ];
        };
      };
      substituters = [
        "https://hyprland.cachix.org"
        "https://anyrun.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      ];
    };

}

