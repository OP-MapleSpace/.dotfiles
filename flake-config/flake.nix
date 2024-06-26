# thanks to Nathan for his help with this! https://github.com/Nathan13888/
{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = github:misterio77/nix-colors;

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    split-monitor-workspaces = {
      url = github:Duckonaut/split-monitor-workspaces;
      inputs.hyprland.follows = "hyprland";
    };
    hycov={
      url = github:DreamMaoMao/hycov;
      inputs.hyprland.follows = "hyprland";
    };

    sddm-sugar-candy-nix = {
      url = gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # unmaintained so not using it anymore
    /*anyrun = {
      url = github:Kirottu/anyrun;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun-nixos-options = {
      url = github:n3oney/anyrun-nixos-options;
      inputs.nixpkgs.follows = "nixpkgs";
    };*/

    firefox = {
      url = github:nix-community/flake-firefox-nightly;
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


  outputs = { self, nixpkgs, home-manager, hyprland, sddm-sugar-candy-nix, /*anyrun, */firefox, split-monitor-workspaces, hycov, ... }@inputs:
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
            #{wayland.windowManager.hyprland.enable = true;}

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
        "https://cache.nixos.org/"
        "https://nix-community.cachix.org"
        #"https://anyrun.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        #"anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      ];
    };

}

