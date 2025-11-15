# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, inputs, config, ... }:
{

  imports =
    [
      ./hardware-configuration.nix # Include the results of the hardware scan
      #./firefox-nightly
      ./sddm
      ./stylix.nix
      ./limine
    ];

  # Use the systemd-boot EFI boot loader.
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.kernelModules = [ "amdgpu" ];
    loader = {
      #systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      #refind.enable = true;
    };
  };

  nix.settings = {
    substituters = [
      "https://hyprland.cachix.org"
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
      "https://vicinae.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
    ];
    experimental-features = [ "nix-command" "flakes" ];
  };

  networking = {
    hostName = "MapleWorld"; # Define your hostname.

    networkmanager.enable = true;

    nat = {
      enable = true;
      externalInterface = "eth0";
      internalInterfaces = [ "wg0" ];
    };

    # Open ports in the firewall.
    firewall = {
      allowedTCPPortRanges = [
        { from = 1714; to = 1764; } # KDE Connect
      ];
      allowedUDPPortRanges = [
        { from = 1714; to = 1764; } # KDE Connect
      ];
      allowedUDPPorts = [ 51820 8129 ]; # 51820 = WireGuard, 8129 = Markdown Preview (NixVim)
    };
  };

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    #    keyMap = "us";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  hardware = {
    bluetooth.enable = true; #Bluetooth
    graphics.enable = true; #OpenGL
  };
  services = {
    #X11 & its stuff
    xserver.enable = true;
    libinput.enable = true;

    #Power Management
    upower.enable = true;
    power-profiles-daemon.enable = true;

    #GVFS
    gvfs.enable = true;

    #Tumbler
    tumbler.enable = true;

    #dbus
    dbus.packages = with pkgs; [
      xfce.xfconf
    ];

    #Printing (CUPS)
    printing.enable = true;

    #Blueman for bluetooth
    blueman.enable = true;

    #PipeWire
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    #mpd
    mpd = {
      enable = true;
      dataDir = "/home/maplespace/Sync";
      musicDirectory = "/home/maplespace/Sync/Music";
      extraConfig = ''
        # must specify one or more outputs in order to play audio!
        # (e.g. ALSA, PulseAudio, PipeWire), see next sections
        audio_output {
          type "pipewire"
          name "My PipeWire Output"
        }
      '';
      network.listenAddress = "any"; # if you want to allow non-localhost connections
      user = "maplespace";
    };

    #ssh
    openssh.enable = true;
    sshd.enable = true;
  };

  programs = {
    dconf.enable = true;
    fish.enable = true;
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
    nh = {
      enable = true;
      flake = "/home/maplespace/.dotfiles/flake-config";
    };
    niri.enable = true;
  };

  # Enable sound.
  security.rtkit.enable = true;
  systemd.services.mpd.environment = {
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
    XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.maplespace.uid}"; # User-id must match above user. MPD will look inside this directory for the PipeWire socket.
};

  # Enable Swaylock
  security.pam.services.swaylock = {};

  # Enable VMs and Docker
  virtualisation = {
    libvirtd.enable = true;
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
    waydroid.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.fish; # Default to fish as usershell
    users.maplespace = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "docker" "input" "libvirtd" ];
      #packages = with pkgs; [
      #];
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    systemPackages = with pkgs; [
      vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      neovim
      wget
      #python3
      #(callPackage ./zen/default.nix {})
      sddm-astronaut
      kdePackages.qtmultimedia
    ];
    shells = with pkgs; [ fish ];
    variables.EDITOR = "nvim";
    sessionVariables.NIXOS_OZONE_WL = "1";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Fonts
  fonts = {
    packages = with pkgs; [
      comfortaa
      font-awesome
      nerd-fonts.caskaydia-cove
      nerd-fonts.caskaydia-mono
      nerd-fonts.code-new-roman
      nerd-fonts.comic-shanns-mono
      nerd-fonts.fira-code
      nerd-fonts.fira-mono
      nerd-fonts.martian-mono
      nerd-fonts.space-mono
      nerd-fonts.symbols-only
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      source-han-sans
      source-han-serif
      source-code-pro
    ];
  };


  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
