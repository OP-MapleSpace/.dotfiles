{
  programs.waybar = {
    enable = true;
    settings = {
      topBar = {
        name = "topbar";
        layer = "top";
        position = "top";
        height = 30;
      modules-left = [
          "hyprland/workspaces"
          "group/hardware"
          "mpd"
        ];
      modules-center = [
          "clock"
        ];
      modules-right = [
          "privacy"
          "keyboard_state"
          "group/connections"
          "tray"
          "group/power"
        ];

        "image/icon" = {
          path = "/home/maplespace/.dotfiles/images/maplepfp.png";
          size = 25;
        };

        "hyprland/workspaces" = {
          format = "{name}";
          sort-by = "id";
          show-special = true;
          special-visible-only = true;
        };
        "group/hardware" = {
          orientation = "inherit";
          modules = [
            "memory"
            "cpu"
            "temperature"
          ];
        };
        "memory" = {
          interval = 2;
        };
        "cpu" = {
          interval = 2;
        };
        "temperature" = {
          interval = 2;
        };
        "mpris" = {
          format = "{status_icon} {dynamic}";
          dynamic-order = [
            "artist"
            "title"
            "position"
            "length"
          ];
          dynamic-len = 30;
          interval = 10;
          random-icons = {
            on = " ";
          };
          repeat-icons = {
            on = " ";
          };
          single-icons = {
            on = "1 ";
          };
          status-icons = {
        paused = "";
        playing = "";
          };
        tooltip-format = "MPD (connected)";
        tooltip-format-disconnected = "MPD (disconnected)";
          max-length = 30;
          artist-length = 9;
        };

        "clock" = {
          interval = 1;
          format = "{:%T %a %D}";
          timezone = "America/Toronto";
          tooltip = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
          };
        };

        "group/connections" = {
          orientation = "inherit";
          modules = [
            "bluetooth"
            "network"
          ];
        };
        "network" = {
          format-alternate = "{ipaddr}";
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} 󰊗";
          format-disconnected = "Disconnected :(";
          tooltip-format = "{ifname} via {gwaddr} 󰊗";
          #tooltip-format-wifi = "{essid} ({signalStrength}%) ";
          tooltip-format-ethernet = "{ifname} ";
          tooltip-format-disconnected = "Disconnected";
        };

        "group/power" = {
          orientation = "inherit";
          modules = [
            "idle_inhibitor"
            "power-profiles-daemon"
            "upower"
          ];
        };
        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
        "upower" = {
          native-path = "BAT0";
        };
      };
    };
  };
}
