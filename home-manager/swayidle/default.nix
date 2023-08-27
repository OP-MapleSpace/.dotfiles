{ pkgs, lib, ... }:
{
  services.swayidle = {
    enable = true;
    timeouts = [
      {timeout = 300; command = "swaylock -C $HOME/.dotfiles/home-manager/swaylock/config"; }
      {timeout = 600; command = "systemctl suspend";}
    ];
  };
}
