{ pkgs, ... }:
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      daemonize = true;
      clock = true;
      timestr = "%H:%M:%S %Z (%A)";
      indicator = true;
      indicator-radius = 175;
      indicator-thickness = 20;
      indicator-caps-lock = true;
      line-uses-ring = true;
      color = "000000";
      text-color = "aaccee";
      separator-color = "00000000";
      inside-color = "000000bb";
      ring-color = "008cff77";
      key-hl-color = "0000ff77";
      bs-hl-color = "ff000077";
      text-caps-lock-color = "ff00ff";
      inside-caps-lock-color = "000000bb";
      ring-caps-lock-color = "3c00ff77";
      caps-lock-key-hl-color = "ff00ff77";
      text-ver-color = "ffffff";
      inside-ver-color = "101010bb";
      ring-ver-color = "ffff0077";
      text-wrong-color = "ffffff";
      inside-wrong-color = "330000bb";
      ring-wrong-color = "ff000077";
      text-clear-color = "ffffff";
      inside-clear-color = "000000";
      ring-clear-color = "303030aa";
      image = "/home/maplespace/.dotfiles/images/SpaceAce.png";
      effect-blur = "5x5";
      grace = "15";
      grace-no-mouse = true;
      grace-no-touch = true;
      fade-in = "\"0.1\"";
      show-failed-attempts = true;
      show-keyboard-layout = true;
      ignore-empty-password = true;
      font = "\"Cascadia Code\"";
      font-size = "45";

    };
  };
}
