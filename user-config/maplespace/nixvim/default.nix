{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins.nix
    ./settings.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    #vimdiff = true;
  };
}
