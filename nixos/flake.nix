# thanks to Nathan for his help with this!
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
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
    
    # Nixos Hardware
    #nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # NUR
    #nurpkgs = {
      #url = github:nix-community/NUR;
      #inputs.nixpkgs.follows = "nixpkgs";
    #};
    
    hyprland.url = "github:hyprwm/Hyprland";
  };


  outputs = { self, nixpkgs, home-manager, hyprland, hyprland-contrib, sddm-sugar-candy-nix, anyrun, ... }:
    let
      system = "x86_64-linux";
    in
    {
      homeConfigurations = {
        "maplespace@AlphaHlynurSolare" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {  inherit system nixpkgs home-manager; };
          modules = [
            hyprland.homeManagerModules.default
            ../home-manager/home.nix
          ];
        };
      };
      
      nixosConfigurations.AlphaHlynurSolare = nixpkgs.lib.nixosSystem {
        modules = [
          sddm-sugar-candy-nix.nixosModules.default
          hyprland.nixosModules.default
          {programs.hyprland.enable = true;}
          
          {
            nixpkgs = {
              overlays = [
                sddm-sugar-candy-nix.overlays.default
              ];
            };
          }

	  ./configuration.nix
	  ./hardware-configuration.nix
        # ...
        ];
        system.packages = [ anyrun.packages.${system}.anyrun-with-all-plugins ];
      };
    };

}

