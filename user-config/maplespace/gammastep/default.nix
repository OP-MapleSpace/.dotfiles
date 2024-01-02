{ pkgs, ... }:
{
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 43.6426;
    longitude = -79.3871;
  };
}
