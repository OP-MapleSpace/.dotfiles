# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, inputs, config, ... }:
{

  imports =
    [
      ./hardware-configuration.nix # Include the results of the hardware scan
      ./firefox-nightly
      ./sddm
      ./stylix.nix
      ./systemd-timers
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "amdgpu" ];

  nix.settings = {
    substituters = [
      "https://hyprland.cachix.org"
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  networking = {
    hostName = "MapleWorld"; # Define your hostname.

    networkmanager.enable = true;

    nat = {
      enable = true;
      externalInterface = "eth0";
      internalInterfaces = [ "wg0" ];
    };

    /*wireguard.interfaces = {
# "wg0" is the network interface name. You can name the interface arbitrarily.
wg0 = {
# Determines the IP address and subnet of the server's end of the tunnel interface.
ips = [ "192.168.2.17/24" ];

# The port that WireGuard listens to. Must be accessible by the client.
listenPort = 51820;

# This allows the wireguard server to route your traffic to the internet and hence be like a VPN
# For this to work you have to set the dnsserver IP of your router (or dnsserver of choice) in your clients
postSetup = ''
${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
'';

# This undoes the above command
postShutdown = ''
${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
'';

# Note: The private key can also be included inline via the privateKey option,
# but this makes the private key world-readable; thus, using privateKeyFile is
# recommended.
privateKeyFile = "/home/maplespace/Downloads/ProtonVPN_server_configs/protonfun_-NL-FREE-177131.conf";

peers = [
# List of allowed peers.
{ # Feel free to give a meaning full name
# Public key of the peer (not a file path).
publicKey = "kGXEd8fGzTtRJZ4lbbLwCKGNQbHnb7S6uh9hi/Gmdjg=";
# List of IPs assigned to this peer within the tunnel subnet. Used to configure routing.
allowedIPs = [ "192.168.2.17/24" ];
}
];
};
};*/

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable X11 and its stuff.
  services.xserver = {
    enable = true;
  };
  services.libinput.enable = true;


  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Power Management
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  # Enable GVFS
  services.gvfs.enable = true;

  # Enable Tumbler
  services.tumbler.enable = true;

  # Enable dconf
  programs.dconf.enable = true;

  # Enable dbus services
  services.dbus.packages = with pkgs; [
    xfce.xfconf
  ];

  # Enable Fish
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  environment.shells = with pkgs; [ fish ];

  # Editor
  environment.variables.EDITOR = "nvim";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  # Enable sound.
  #sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.mpd = {
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
  systemd.services.mpd.environment = {
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
    XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.maplespace.uid}"; # User-id must match above user. MPD will look inside this directory for the PipeWire socket.
};

  # Enable hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  # Enable Swaylock
  security.pam.services.swaylock = {};
  security.pam.services.swaylock-effects = {};

  # Enable Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

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
  users.users.maplespace = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "input" "libvirtd" ];
    #packages = with pkgs; [
    #];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    systemPackages = with pkgs; [
      vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      neovim
      wget
      #python3
    ];
    sessionVariables.NIXOS_OZONE_WL = "1";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.sshd.enable = true;

  # Enable OpenGL
  hardware.graphics.enable = true;

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
      noto-fonts-emoji
      source-han-sans
      source-han-sans-japanese
      source-han-serif-japanese
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

  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L" # print build logs
    ];
    dates = "02:00";
    randomizedDelaySec = "45min";
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/maplespace/.dotfiles";
  };
}
