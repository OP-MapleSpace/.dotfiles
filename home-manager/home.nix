{ config, pkgs, lib, ... }:

let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
    config.xdg.configHome = configHome;
    overlays = [ nurpkgs.overlay ];
  };

#   nur = import nurpkgs {
#     inherit pkgs;
#     nurpkgs = pkgs;
#   };
in
{
  imports = [
    ./hyprland
    ./hyprpaper
  ];
  
  home.username = "maplespace";
  home.homeDirectory = "/home/maplespace";

  dconf.enable = true;

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 34560000;
    maxCacheTtl = 34560000;
    enableSshSupport = true;
  };

  services.syncthing = {
    enable = true;
    tray = {
      enable = true;
      package = pkgs.syncthingtray-minimal;
    };
  };


  # You can update Home Manager without changing this value
  home.stateVersion = "22.11";

  programs.home-manager.enable = true;

}
