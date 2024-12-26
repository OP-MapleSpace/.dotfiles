{ pkgs, config, ... }:

{
  stylix.targets = {
    gtk.extraCss = "prefers-color-scheme = dark";
    waybar = {
      enableCenterBackColors = true;
      enableLeftBackColors = true;
      enableRightBackColors = true;
    };
    swaylock.enable = false;
    kitty.variant256Colors = true;
    hyprland.enable = false;
  };
}
