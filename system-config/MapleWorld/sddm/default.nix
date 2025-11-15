{ lib, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    #    sugarCandyNix = {
    #  enable = true;
    #  settings = {
    #    Background = lib.cleanSource ../../../images/SpaceAce.png;
    #    FullBlur = true;
    #    BlurRadius = 25;
    #    FormPosition  =  "left";
    #    MainColor = "#008cff";
    #    AccentColor = "#00ff00";
    #    BackgroundColor = "#444";
    #    OverrideLoginButtonTextColor = "#0000ff";
    #    Font = "Quicksand";
    #    HourFormat = "HH:mm:ss";
    #    DateFormat = "dddd MMMM dd, yyyy";
    #    HeaderText = "Per Aspera ad Sidera Caeli";
    #    ForceLastUser = true;
    #    ForcePasswordFocus = true;
    #    TranslateLogin = "Explore the MapleWorld";
    #  };
    #};
    theme = "sddm-astronaut-theme";
  };
}

