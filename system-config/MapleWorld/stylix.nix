{ pkgs, config, ... }: 

{
  stylix = {
    enable = true;
    autoEnable = true;
    homeManagerIntegration = {
      autoImport = true;
      followSystem = true;
    };

    base16Scheme = {
      base00 = "#000000"; # black | Default Background
      base01 = "#aaccee"; # ace | Lighter Background (Used for status bars, line number and folding marks)
      base02 = "#0000ff"; # blue | Selection Background
      base03 = "#8c00ff"; # purple | Comments, Invisibles, Line Highlighting
      base04 = "#0000ff"; # blue | Dark Foreground (Used for status bars)
      base05 = "#008cff"; # royal blue | Default Foreground, Caret, Delimiters, Operators
      base06 = "#bbeeee"; # bee (light blue) | Extra Light Color
      base07 = "#eebbee"; # ebe (light pink) | Extra Light Color
      base08 = "#ffff00"; # yellow | Variables, XML Tags, Markup Link Text, Markup Lists
      base09 = "#ffaaee"; # orange | Integers, Boolean, Constants, XML Attributes, Markup Link Url
      base0A = "#00ffb7"; # turquoise | Classes, Markup Bold, Search Text Background, Opening/Closing Embedded Language Tags
      base0B = "#00ff00"; # lime | Strings, Inherited Class, Markup Code, Diff Inserted
      base0C = "#00ffff"; # cyan | Support, Regular Expressions, Escape Characters, Markup Quotes
      base0D = "#ff00ff"; # magenta | Functions, Methods, Attribute IDs, Headings
      base0E = "#ff44aa"; # light reddish pink | Keywords, Storage, Selector, Markup Italic, Diff Changed
      base0F = "#ff0000"; # red | Deprecated, Diff Removed
    };
    image = ../../wallpaper/SpaceAce.png;

    fonts = {
      serif = {
        package = pkgs.cascadia-code;
        name = "Cascadia Code";
      };

      sansSerif = {
        package = pkgs.quicksand;
        name = "Quicksand";
      };

      monospace = config.stylix.fonts.serif;

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };

      sizes  = {
        applications = 15;
        desktop = 15;
        popups = 15;
        terminal = 15;
      };
    };
    cursor = {
      package = pkgs.afterglow-cursors-recolored;
      name = "Afterglow-Recolored-Catppuccin-Sapphire";
    };
    polarity = "dark";
    opacity.terminal = 0.8;
    targets = {
      grub.useImage = true;
      nixvim.transparent_bg.main = true;
    };
  };
}
