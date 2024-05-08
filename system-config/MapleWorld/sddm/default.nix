{ lib, ... }:

{
services.xserver.displayManager.sddm.sugarCandyNix = {
    enable = true; # This enables SDDM automatically and set its theme to
                     # "sddm-sugar-candy-nix"
    settings = {
      # Set your configuration options here.
      # Here is a simple example:
      Background = lib.cleanSource ../../../wallpaper/SpaceAce.png;
      FullBlur = true;
      BlurRadius = 25;
      FormPosition  =  "left";
      MainColor = "#008cff";
      AccentColor = "#00ff60";
      BackgroundColor = "#444";
      OverrideLoginButtonTextColor = "#0000ff";
      Font = "Quicksand";
      HourFormat = "HH:mm:ss";
      DateFormat = "dddd MMMM dd, yyyy";
      HeaderText = "Per Aspera ad Sidera Caeli";
    };
  };
}

