{ pkgs, ... }:
{
  services.swayidle = {
    enable = true;
    timeouts = [
      {timeout = 300; command = "${pkgs.swaylock-effects}/bin/swaylock"; }
      {timeout = 600; command = "${pkgs.systemd}/bin/systemctl suspend";}
    ];
    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock-effects}/bin/swaylock"; }
      { event = "lock"; command = "lock"; }
    ];


  };
}
