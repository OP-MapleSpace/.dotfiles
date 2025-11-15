{ pkgs, config, ... }: 

{
  stylix = {
    enable = true;
    autoEnable = true;
    homeManagerIntegration = {
      autoImport = true;
      followSystem = true;
    };

    #base16Scheme = ../../colorschemes/neon-blue.yaml;
    image = ../../images/MapleEarthRiseBG.png;
    override = {
      base00 = "000000";
      base08 = "ff00ff";
      base09 = "ffff00";
      base0A = "8c00ff";
      base0B = "00ff00";
    };

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
        package = pkgs.noto-fonts-color-emoji;
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
      size = 32;
    };
    polarity = "dark";
    opacity.terminal = 0.8;
    targets = {
      grub.useWallpaper = true;
      nixvim.transparentBackground.main = true;
    };
  };
}
