{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    inputs.anyrun.homeManagerModules.default
    inputs.nix-colors.homeManagerModules.default

    ./packages.nix
    ./python.nix

    ./anyrun
    ../../system-config/MapleWorld/fish
    #./eww
    ./hyprland
    ./kdeconnect
    ./kitty
    ./obs-studio
    ./starship
    #./swayidle
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

  colorScheme = {
    slug = "bluevibrance";
    name = "Blue Vibrance";
    author = "MapleSpace";
    palette = {
      base00 = "#000000"; # black | Default Background
      base01 = "#aaccee"; # ace | Lighter Background (Used for status bars, line number and folding marks)
      base02 = "#0000ff"; # blue | Selection Background
      base03 = "#000069"; # navy blue | Comments, Invisibles, Line Highlighting
      base04 = "#9900ff"; # purple | Dark Foreground (Used for status bars)
      base05 = "#008cff"; # royal blue | Default Foreground, Caret, Delimiters, Operators
      base06 = "#bbeeee"; # bee (light blue) | Extra Light Color
      base07 = "#eebbee"; # ebe (light pink) | Extra Light Color
      base08 = "#ffae00"; # orange | Variables, XML Tags, Markup Link Text, Markup Lists
      base09 = "#00ffff"; # cyan | Integers, Boolean, Constants, XML Attributes, Markup Link Url
      base0A = "#ff8375"; # light red | Classes, Markup Bold, Search Text Background, Opening/Closing Embedded Language Tags
      base0B = "#00ff00"; # lime | Strings, Inherited Class, Markup Code, Diff Inserted
      base0C = "#00ffb7"; # turquoise | Support, Regular Expressions, Escape Characters, Markup Quotes
      base0D = "#ff00ff"; # magenta | Functions, Methods, Attribute IDs, Headings
      base0E = "#ffff00"; # yellow | Keywords, Storage, Selector, Markup Italic, Diff Changed
      base0F = "#ff0000"; # red | Deprecated, Diff Removed
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
  xdg.configFile."eww/main.py".source = ./eww/main.py;
  xdg.configFile."hypr/hyprpaper.conf".source = ./hyprland/hyprpaper.conf;
  xdg.configFile."hypr/hyprshade.toml".source = ./hyprland/hyprshade.toml;
  xdg.configFile."hypr/pyprland.toml".source = ./hyprland/pyprland.toml;
  xdg.configFile."nvim/init.lua".source = ./neovim/init.lua;
  xdg.configFile."swaylock/config".source = ./swaylock/config;

  # You can update Home Manager without changing this value
  home.stateVersion = "22.11";

  programs.home-manager.enable = true;
}
