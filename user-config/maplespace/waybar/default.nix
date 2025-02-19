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
          "image/icon"
          "hyprland/workspaces"
          "wireplumber"
          "mpd"
          #"mpris"
          #"cava"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          #"group/hardware"
          "memory"
          "cpu"
          "temperature"
          "network"
          #"group/connections"
          "tray"
          #"group/power"
          "privacy"
          "idle_inhibitor"
          "battery"
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
        #"group/hardware" = {
        #  orientation = "inherit";
        #  [
        #  ];
        #};
        "memory" = {
          interval = 2;
          format = " {percentage}%";
        };
        "cpu" = {
          format = " {usage}%";
          interval = 2;
        };
        "temperature" = {
          format = " {temperatureC}°C";
          interval = 2;
        };
        "mpd" = {
          format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {title} - {album} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ";
          format-disconnected = "Disconnected ";
          format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
          interval = 5;
          consume-icons = {
            on = " ";
          };
          random-icons = {
            off = "<span color=\"#f53c3c\"></span> ";
            on = " ";
          };
          repeat-icons = {
            on = " ";
          };
          single-icons = {
            on = "1 ";
          };
          state-icons = {
            paused = "";
            playing = "";
          };
          tooltip-format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {title} [{album artist} - {album}] ({elapsedTime:%M:%S} / {totalTime:%M:%S}) {songPosition} / {queueLength} | {date} {filename} ";
          tooltip-format-disconnected = "MPD (disconnected)";
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
          interval = 5;
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
          tooltip = true;
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";

            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };
        "wireplumber" = {
          format = "{volume}% {icon}";
          format-muted = "Muted ";
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          on-click-middle = "helvum";
          max-volume = 150;
          format-icons = [
            ""
            ""
            ""
          ];
          reverse-scrolling = true;
        };
        #"group/connections" = {
        #    orientation = "inherit";
        #    modules = [
        #      "bluetooth"
        #      "network"
        #    ];
        #  };
        "network" = {
          format-alternate = "{ipaddr}";
          format-wifi = " {essid} ({signalStrength}%)";
          format-ethernet = "󰊗 {ipaddr}/{cidr}";
          format-disconnected = "Disconnected :(";
          tooltip-format = "{ifname} via {gwaddr} | {ipaddr}";
          #tooltip-format-wifi = "{essid} ({signalStrength}%) ";
          #tooltip-format-ethernet = "{ifname} ";
          #tooltip-format-disconnected = "Disconnected";
        };

        # "group/power" = {
        #    orientation = "inherit";
        #    modules = [
        #    ];
        #  };
        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
        "battery" = {
          interval = 30;
          states = {
            "warning" = 30;
            "critical" = 15;
          };
          format = "{icon} {capacity}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
          tooltip-format = "{timeTo} | {cycles} cycles, {health}% | {power} W";
        };
      };
    };
    style = ''
      * {
        font-family: FontAwesome, Cascadia Code, Helvetica, Arial, monospace;
        font-size: 20px;
        padding: 2px;
        margin: 0px 5px;
        border-radius: 20px;
      }

      window#waybar {
        background-color: #000000;
        border-radius: 20px;
        color: #ffffff;
        background-color: #000000;

      }

      button {
        box-shadow: inset 0 -3px transparent;
        border: none;
      }

      #workspaces button.visible {
        background-color: #008cff;
        color: #000000;
      }
      #workspaces button.active {
        background-color: #008cff;
        color: #000000;
      }
      #workspaces button.special {
        background-color: #ff00ff;
        color: #000000;
      }
      #workspaces button.urgent {
        background-color: #ff0000;
        color: #000000;
      }

      #wireplumber {
        background-color: #2a3aff;
        color: #ffffff;
        padding: 0px 5px;
      }
      #wireplumber.muted {
        background-color: #ff0000;
      }

      #mpd {
        background-color: #00ffff;
        color: #000000;
      }

      #clock {
        background-color: #008cff;
        color: #000000;
      }

      #memory {
        background-color: #00ffb7;
        color: #000000;
      }

      #cpu {
        background-color: #00ff00;
        color: #000000;
      }

      #temperature {
        background-color: #ffff00;
        color: #000000;
      }
      #temperature.critical {
        background-color: #ff0000;
      }

      #network {
        background-color: #8c00ff;
        color: #ffffff;
      }
      #network.disconnected {
        background-color: #ff0000;
        color: #000000;
      }
      #network.disabled {
        background-color: #ffaa00;
        color: #000000;
      }

      #tray {
        margin: 0px 2px;
      }

      #battery {
        background-color: #ff00ff;
        color: #000000;
      }
      #battery.charging {
        background-color: #00ff00;
        color: #000000;
      }
      #battery.warning {
        background-color: #ffaa00;
        color: #000000;
      }
      #battery.critical {
        background-color: #ff0000;
        color: #000000;
      }
    '';
  };
}

