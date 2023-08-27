{ config, pkgs, lib, ... }:

{
  imports = [
    ./packages.nix
    ./fish
    #./eww
    ./gammastep
    ./hyprland
    ./steam
    #./swaylock
    ./swayidle
    ./starship
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

  xdg.configFile."nvim/init.lua".source = ./neovim-lua/init.lua;
  xdg.configFile."eww/eww.yuck".source = ./eww/eww.yuck;
  xdg.configFile."eww/eww.scss".source = ./eww/eww.scss;

  # You can update Home Manager without changing this value
  home.stateVersion = "22.11";

  programs.home-manager.enable = true;
}
