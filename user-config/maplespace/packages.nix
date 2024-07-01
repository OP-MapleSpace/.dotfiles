# thanks to Nathan for helping me with this: https://github.com/Nathan13888/.dotfiles/blob/master/home-manager/packages.nix
{ pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.file."jdks/openjdk17".source = pkgs.jetbrains.jdk;

  home.packages = with pkgs; [
    ## hyprland/wayland stuff
    hyprpaper
    hyprpicker
    hyprshade
    hypridle
    waybar
    eww
    swaylock-effects
    swayidle
    wl-clipboard
    xwaylandvideobridge
    grim
    slurp
    swappy
    rofi-wayland
    rofi-calc
    rofi-bluetooth
    rofi-power-menu
    rofimoji

    ## browsers
    #floorp
    brave

    ## discord :skull:
    discord-canary
    vesktop
    discordchatexporter-cli
    element-desktop

    ## gaming!!!
    steam
    lutris
    bottles
    ryujinx
    vitetris
    #minecraft

    ## file stuff
    lf
    cinnamon.nemo-with-extensions
    udiskie
    onlyoffice-bin
    libreoffice
    zathura
    xournalpp
    gnome3.adwaita-icon-theme # xournal++ needs this for some reason
    feh
    mpv
    mpd
    vlc
    qbittorrent
    p7zip

    ## terminal
    kitty
    starship
    fish
    ### fun
    lolcat
    fortune
    cowsay
    cmatrix
    cbonsai
    busybox
    ### utilities
    libguestfs
    htop
    btop
    git
    imagemagick
    hyfetch
    fastfetch
    openssh
    fzf
    eza
    bat
    ripgrep
    killall
    brightnessctl
    networkmanager-openconnect
    networkmanagerapplet
    wireplumber
    playerctl
    usbutils
    glibc
    uwuify
    #etcher

    ## VMs, VPNs, remote, syncing
    distrobox
    docker
    syncthing
    nextcloud-client
    virt-manager
    remmina
    qemu
    protonvpn-gui
    protonvpn-cli

    ## kde
    krita
    kalzium
    kdeconnect
    kdenlive
    kitty
    okular

    ## programming
    micromamba
    nodejs
    lua
    gfortran
    jq

    ## media
    gimp
    inkscape
    blender
    ffmpeg

    ## science
    gnome.gnome-calculator

  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    #"discord-canary"
    "slack"
    "teams"
    "zoom"
    "spotify"
    "code" "vscode"
    "google-chrome"
    "cloudflare-warp"
    "cudatoolkit"
    "steam" "steam-run" "steam-original"
    "minecraft-launcher"
  ];

/*  nixpkgs.overlays =
    let
      myOverlay = self: super: {
        discord-canary = super.discord-canary.override { withOpenASAR = true; withVencord = true; };
      };
    in
      [ myOverlay ];*/

}
