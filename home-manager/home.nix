{ config, pkgs, lib, ... }:

{
  imports = [
    ./packages.nix
    ./hyprland
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
