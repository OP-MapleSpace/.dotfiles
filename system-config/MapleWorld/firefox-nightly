{ pkgs, inputs, config, ... }:
{
  config = {
    environment.systemPackages = [
      inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
    ];
  };
}
