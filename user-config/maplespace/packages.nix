# thanks to Nathan for helping me with this: https://github.com/Nathan13888/.dotfiles/blob/master/home-manager/packages.nix
{ pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.file."jdks/openjdk17".source = pkgs.jetbrains.jdk;

  home.packages = with pkgs; [
    ## hyprland/wayland stuff
    hyprpaper
    hyprpicker
    pyprland
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


    ## browsers
    floorp
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
    neovim
    starship
    fish
    tmux
    ### fun
    lolcat
    fortune
    cowsay
    ### utilities
    libguestfs
    htop
    btop
    dunst
    git
    imagemagick
    neofetch
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
    #etcher

    ## VMs, VPNs, remote, syncing
    distrobox
    docker
    syncthing
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
    #blender
    ffmpeg
  ];

  # Cursor settings
    home.pointerCursor =
    let
      getFrom = url: hash: name: {
        name = name;
        size = 48;
        package = pkgs.runCommand "moveUp" {} ''
          mkdir -p $out/share/icons
          ln -s ${pkgs.fetchzip {
            url = url;
            hash = hash;
          }} $out/share/icons/${name}
        '';
      };
    in
      getFrom
        "https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.3/Bibata-Modern-Ice.tar.gz"
        "sha256-9lDvV2dgGFrLy8Y55ZYbiTDiN0DscX8Uju5YGWUuWyE="
        "Bibata-Modern-Ice";


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

  nixpkgs.overlays =
    let
      myOverlay = self: super: {
        discord-canary = super.discord-canary.override { withOpenASAR = true; withVencord = true; };
      };
    in
      [ myOverlay ];

}
