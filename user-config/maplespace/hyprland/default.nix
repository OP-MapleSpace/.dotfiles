{ inputs, pkgs, lib, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = import ./hyprland.nix { inherit lib pkgs; };
    xwayland = {
      enable = true;
    };
    enableNvidiaPatches = false;
    plugins = [
      #inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
      #inputs.hycov.packages.${pkgs.system}.hycov
    ];
  };
}
