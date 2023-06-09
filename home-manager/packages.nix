{ config, pkgs, lib, ... }:

{
  home.file."jdks/openjdk17".source = pkgs.jetbrains.jdk;

  home.packages = with pkgs; [
    ## hyprland stuff
    hyprland
    hyprpaper
    hyprpicker
    waybar
    swaylock
    wofi

    ## browsers
    firefox-developer-edition
    brave
    discord-canary

    ## terminal
    kitty
    neovim
    starship
    fzf
    lf
    exa
    bat
    ripgrep
    lolcat
    fortune
    cowsay
    killall
    brightnessctl
    wireplumber
    playerctl
    
    ## utilities
    thunar
    gimp
    inkscape
    syncthing
    virt-manager 
    qemu 
    libguestfs
    udiskie
    dunst
    openssh
    git

    ## kde
    krita
    kalzium
    kitty
    okular

    ## programming
    nodejs
    lua

    ## media
    gimp
    inkscape
    blender
    ffmpeg
  ];
}
