{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./plugins.nix
    ./settings.nix
    ./keymaps.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    #vimdiff = true;
  };
}
