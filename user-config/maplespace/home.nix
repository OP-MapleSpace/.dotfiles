{ inputs, config, pkgs, lib, ags, ... }:

{
  imports = [
    inputs.ags.homeManagerModules.default

    ./packages.nix
    ./python.nix
    ../../system-config/MapleWorld/fish
    #./eww
    ./hyprland
    ./kdeconnect
    ./kitty
    ./obs-studio
    ./starship
    ./stylix.nix
    ./swayidle
    ./syncthing
  ];

  programs.home-manager.enable = true;
  home.username = "maplespace";
  home.homeDirectory = "/home/maplespace";

  qt.enable = true;
  gtk.enable = true;

  dconf = {
    enable = true;
    settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
      };
    };
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 34560000;
    maxCacheTtl = 34560000;
    enableSshSupport = true;
  };

  programs.ags = {
    enable = true;
    configDir = ./ags;
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-gtk
      ];
      config.common.default = "*";
    };
    configFile = {
      "eww/eww.yuck".source = ./eww/eww.yuck;
      "eww/eww.scss".source = ./eww/eww.scss;
      "eww/main.py".source = ./eww/main.py;
      "hypr/hyprpaper.conf".source = ./hyprland/hyprpaper.conf;
      "hypr/hyprshade.toml".source = ./hyprland/hyprshade.toml;
      "hypr/hypridle.conf".source = ./hyprland/hypridle.conf;
      "hypr/pyprland.toml".source = ./hyprland/pyprland.toml;
      "nvim/init.lua".source = ./neovim/init.lua;
      "swaylock/config".source = ./swaylock/config;
    };
  };

  # You can update Home Manager without changing this value
  home.stateVersion = "22.11";
}
