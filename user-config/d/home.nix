{ pkgs, ... }:

{
  imports = [
    ./packages.nix
    ../shared/stylix.nix
    ../../system-config/MapleWorld/fish
    ../shared/kdeconnect
    ../shared/kitty
    ../shared/nixvim
    ./starship
    ../shared/syncthing
  ];

  programs.home-manager.enable = true;
  home.username = "d";
  home.homeDirectory = "/home/d";

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
      "mov-cli/config.toml".source = ./mov-cli/config.toml;
      #"nvim/init.lua".source = ./neovim/init.lua;
    };
  };

  # You can update Home Manager without changing this value
  home.stateVersion = "22.11";
}
