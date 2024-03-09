{ pkgs, config, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      font_size = "13.0";

      tab_bar_style = "powerline";
      tab_powerline_style = "round";
      active_tab_foreground = "#${config.colorScheme.palette.base06}";
      active_tab_background = "#${config.colorScheme.palette.base02}";
      inactive_tab_foreground = "#${config.colorScheme.palette.base02}";
      inactive_tab_background = "#${config.colorScheme.palette.base06}";

      foreground = "#${config.colorScheme.palette.base06}";
      background = "#${config.colorScheme.palette.base00}";
      background_opacity = "0.8";
      background_blur = "1";

      enabled_layouts = "grid";
    };
  };
}
