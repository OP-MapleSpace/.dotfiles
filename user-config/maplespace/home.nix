{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    inputs.anyrun.homeManagerModules.default

    ./packages.nix

    ./anyrun
    ../../system-config/MapleWorld/fish
    #./eww
    ./gammastep
    ./hyprland
    ./kdeconnect
    ./obs-studio
    ./starship
    ./swayidle
    ./syncthing
  ];

  home.username = "maplespace";
  home.homeDirectory = "/home/maplespace";

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

  xdg.configFile."eww/eww.yuck".source = ./eww/eww.yuck;
  xdg.configFile."eww/eww.scss".source = ./eww/eww.scss;
  xdg.configFile."hypr/hyprpaper.conf".source = ./hyprland/hyprpaper.conf;
  xdg.configFile."nvim/init.lua".source = ./neovim/init.lua;
  xdg.configFile."swaylock/config".source = ./swaylock/config;

  # You can update Home Manager without changing this value
  home.stateVersion = "22.11";

  programs.home-manager.enable = true;
}
