{ config, pkgs, ... }:
let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi = {
    enable = true;
    plugins = [ pkgs.rofi-emoji pkgs.rofi-mpd ];
    theme = {
      "*" = {
        border-radius = mkLiteral "30px";
        padding = mkLiteral "5px";
      };
      "window" = {
        padding = mkLiteral "5px 30px";
      };
      "element" = {
        children = [ "element-icon" "element-text" ];
      };
      "element-icon".size = 25;
    };
    modes = ["drun" "window" "run" "emoji"];
  };
}
