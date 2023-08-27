# thanks to Nathan for helping me with this: https://github.com/Nathan13888/.dotfiles/blob/master/home-manager/packages.nix
{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.file."jdks/openjdk17".source = pkgs.jetbrains.jdk;

  home.packages = with pkgs; [
    ## hyprland stuff
    hyprpaper
    hyprpicker
    waybar
    eww-wayland
    swaylock-effects
    wofi
    sway-contrib.grimshot
    imagemagick
    swww

    ## browsers
    firefox-devedition
    brave

    ## discord :skull:
    discord-canary
    discordchatexporter-cli
    element-desktop

    ## gaming!!!
    steam

    ## file stuff
    xfce.thunar
    lf
    udiskie
    onlyoffice-bin
    libreoffice
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
    dunst
    git
    openssh
    fzf
    exa
    bat
    ripgrep
    killall
    brightnessctl
    wireplumber
    playerctl

    ## VMs, VPNs, remote, syncing
    syncthing
    virt-manager 
    qemu 
    protonvpn-gui 
    protonvpn-cli

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

    ## Python
    (let
    custom-python-packages = python-packages: with python-packages; [
      pip
      wheel
      neofetch
    ];
      python3Custom = python3.withPackages custom-python-packages;
    in python3Custom)
  ];

  # Cursor settings
    home.pointerCursor = 
    let 
      getFrom = url: hash: name: {
          name = name;
          size = 48;
          package = 
            pkgs.runCommand "moveUp" {} ''
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
    "discord-canary"
    "slack"
    "teams"
    "zoom"
    "spotify"
    "code" "vscode"
    "google-chrome"
    "cloudflare-warp"
    "cudatoolkit"
    "steam" "steam-run" "steam-original"
  ];

  nixpkgs.overlays =
    let
      myOverlay = self: super: {
        discord-canary = super.discord-canary.override { withOpenASAR = true; withVencord = true; };
      };
    in
      [ myOverlay ];

}
