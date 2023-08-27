{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = github:nix-community/home-manager;
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


  outputs = inputs @ {self, nixpkgs, home-manager, hyprland, ...}:
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
          hyprland.nixosModules.default
          {programs.hyprland.enable = true;}
	  ./configuration.nix
	  ./hardware-configuration.nix
        # ...
        ];
      };
    };

}

