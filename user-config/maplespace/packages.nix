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
	lynx

	# email
	thunderbird

    ## social media apps
    discord-canary
    dissent
    vesktop
    element-desktop
    freetube

    # Productivity
    super-productivity

    ## file stuff
    lf
    nemo-with-extensions
    udiskie
    onlyoffice-bin
    libreoffice
    #zathura
    xournalpp
    adwaita-icon-theme # xournal++ needs this for some reason
    feh
    mpv
    mpd
    vlc
    qbittorrent
    p7zip

    ## terminal
    kitty
    starship
    ### fish
    fish
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
    xdg-desktop-portal-hyprland
    libguestfs
    htop
    btop
    git
    gh
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
    #comma
    bottles
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
    #kalzium
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
    julia-bin

    ## media
    gimp
    inkscape
    blender
    ffmpeg

    ## science
    gnome-calculator

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

  nixpkgs.config.permittedInsecurePackages = [
    "jitsi-meet-1.0.8043"
  ];

/*  nixpkgs.overlays =
    let
      myOverlay = self: super: {
        discord-canary = super.discord-canary.override { withOpenASAR = true; withVencord = true; };
      };
    in
      [ myOverlay ];*/

}
