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
    hyprsunset
    hyprland-qtutils
    #hyprland-protocols
    waybar
    eww
    swaylock-effects
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
    brave
    lynx
    ## email
    thunderbird

    ## Social Media
    discord-canary
    vesktop
    freetube

    ## gaming!!!
    steam
    lutris
    space-cadet-pinball
    #bottles
    ryujinx
    vitetris

    ## File Stuff
    lf
    nnn
    superfile
    nemo-with-extensions
    udiskie
    onlyoffice-bin
    libreoffice
    zathura
    xournalpp
    adwaita-icon-theme # xournal++ needs this for some reason
    qbittorrent
    p7zip
    ## Media
    feh
    mpv
    mpd
    mpc
    ncmpcpp
    vlc
    cava

    ## terminal
    kitty
    starship
    waveterm.out
    ### fish
    fish
    #fishPlugins.async-prompt
    fishPlugins.autopair
    fishPlugins.bass
    fishPlugins.colored-man-pages
    fishPlugins.fzf-fish
    fishPlugins.puffer
    fishPlugins.sponge
    fishPlugins.z

    ### fun
    lolcat
    fortune
    cowsay
    cmatrix
    cbonsai
    busybox
    ### utilities
    acpi
    cronie
    libguestfs
    htop
    btop
    git
    imagemagick
    hyfetch
    fastfetch
    openssh
    fzf
    fd
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
    ventoy
    power-profiles-daemon

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
    #kalzium
    #kdenlive
    kitty
    okular

    ## programming
    gh
    micromamba
    nodejs
    lua
    gfortran
    jq
    julia

    ## media
    gimp
    inkscape
    #blender
    ffmpeg

    ## STEM
    gnome-calculator
    #kicad

    ## audio
    reaper
    bitwig-studio
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
    "SpacePinballCadet"
  ];

  /*  nixpkgs.overlays =
let
myOverlay = self: super: {
discord-canary = super.discord-canary.override { withOpenASAR = true; withVencord = true; };
};
in
[ myOverlay ];*/

}
