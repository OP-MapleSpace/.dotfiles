# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "AlphaHlynurSolare"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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

    # libinput
    libinput.enable = true;
    
    # SDDM + Theme
    displayManager.sddm.sugarCandyNix = {
      enable = true; # This enables SDDM automatically and set its theme to
                     # "sddm-sugar-candy-nix"
      # settings = {
        # Set your configuration options here.
      # };
    };
  };

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

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
  
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
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
    musicDirectory = "/path/to/music";
    extraConfig = ''
      # must specify one or more outputs in order to play audio!
      # (e.g. ALSA, PulseAudio, PipeWire), see next sections
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };

  # Enable hyprland
  programs.hyprland.enable = true;

  # Enable Swaylock
  security.pam.services.swaylock = {};
  security.pam.services.swaylock-effects = {};

  # Enable Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
 
  # Enable Docker
  virtualisation.docker.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.maplespace = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "input" ];
    packages = with pkgs; [
    
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    wget
    python3
    #watershot
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # Editor
  environment.variables.EDITOR = "nvim";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.sshd.enable = true;

  # Fonts
  fonts = {
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      font-awesome
      source-han-sans
      source-han-sans-japanese
      source-han-serif-japanese
      source-code-pro
      nerdfonts
      fira
      fira-mono
      fira-code
      cascadia-code
      comic-relief
      comfortaa
    ];
    fontconfig.defaultFonts = {
      serif = [ "Cascadia Code" "Source Han Serif" ];
      sansSerif = [ "Quicksand" "Source Han Sans" ];
      monospace = ["Cascadia Mono" "Fira Code" ];
    };
  };


  # Open ports in the firewall.
  networking.firewall = {
    allowedTCPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];
    allowedUDPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
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
