# Thank you to https://github.com/ryan4yin/nix-config/blob/main/home/linux/hyprland/anyrun.nix
{ inputs, pkgs, config, osConfig, ... }:

{
  programs.anyrun = {
    enable = true;
    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        randr
        rink
        shell
        symbols
        translate
      ];

      width.fraction = 0.7;
      y.absolute = 15;
      hidePluginInfo = false;
      closeOnClick = true;
      showResultsImmediately = true;
      maxEntries = 15;
    };
    extraConfigFiles."nixos-options.ron".text = let
      nixos-options = osConfig.system.build.manual.optionsJSON + "/share/doc/nixos/options.json";
      hm-options = inputs.home-manager.packages.${pkgs.system}.docs-json + "/share/doc/home-manager/options.json";
      options = builtins.toJSON {
        ":nix" = [nixos-options];
        ":hm" = [hm-options];
      };
    in ''
      Config(
        options: ${options},
      )
    '';
  };
}
