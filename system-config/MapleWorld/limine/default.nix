{
  boot.loader.limine = {
    enable = true;
    maxGenerations = 5;
    style = {
      wallpapers = [ ../../../images/SpaceAce.png ];
      #wallpaperStyle = "centered";
      graphicalTerminal = {
        foreground = "008cff";
        background = "aa000000";
        brightForeground = "008cff";
        brightBackground = "aa000000";
        palette = "000000;ff0000;00ff00;008cff;ff00ff;00ffff;aaccee";
        brightPalette = "000000;ff0000;00ff00;008cff;ff00ff;00ffff;aaccee;";
      };
      interface = {
        branding = "MapleOS";
        brandingColor = 4;
      };
    };
    extraEntries = ''
    /+Other systems and bootloaders
    /Systemd-boot
    comment: Systemd bootloader
    comment: order-priority=20 
    protocol: efi_chainload
    image_path: boot():/EFI/systemd/systemd-bootx64.efi


    /rEFInd
    comment: rEFInd bootloader
    comment: order-priority=20 
    protocol: efi_chainload
    image_path: boot():/EFI/refind/refind_x64.efi


    /EFI fallback
    comment: Default EFI loader
    comment: order-priority=10 
    protocol: efi_chainload
    image_path: boot():/EFI/BOOT/BOOTX64.EFI

    '';
  };
}
