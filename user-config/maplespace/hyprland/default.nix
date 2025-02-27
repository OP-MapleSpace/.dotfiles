{ pkgs, lib, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = import ./hyprland.nix { inherit lib pkgs; };
    xwayland = {
      enable = true;
    };
    systemd.enable = false;
  };
}
