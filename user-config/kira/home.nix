{ pkgs, ... }:

{
  imports = [

    ./packages.nix
    #./python.nix
    ../../system-config/MapleWorld/fish
    #./hyprland
    #../shared/kdeconnect
    ../shared/kitty
    #../shared/lf
    #./mako
    ../shared/nixvim
    ./obs-studio
    #./starship
    #./stylix.nix
    #../shared/syncthing
    #./waybar
  ];

  programs.home-manager.enable = true;
  home.username = "maplespace";
  home.homeDirectory = "/home/maplespace";

  xdg = {
    configFile = {
      #"hypr/hyprpaper.conf".source = ./hyprland/hyprpaper.conf;
      #"hypr/hyprshade.toml".source = ./hyprland/hyprshade.toml;
      #"hypr/hypridle.conf".source = ./hyprland/hypridle.conf;
      "mov-cli/config.toml".source = ./mov-cli/config.toml;
      #"nvim/init.lua".source = ./neovim/init.lua;
      "swaylock/config".source = ./swaylock/config;
    };
  };

  # You can update Home Manager without changing this value
  home.stateVersion = "22.11";
}
