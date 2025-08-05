{ pkgs, lib, ... }: 
{
  services.kdeconnect = {
    enable = true;
    indicator = true;
  };
}
