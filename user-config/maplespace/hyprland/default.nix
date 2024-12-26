let
  laptop = "eDP1";
  mon = "HDMI-A-1";
in
  {
  wayland.windowManager.hyprland = {
    enable = true;
    #extraConfig = import ./hyprland.nix { inherit lib pkgs; };

    xwayland = {
      enable = true;
    };

    settings = {

      monitor = [
        "${laptop}, 2560x1440@165, 0x0, 1.25"
        "${mon}, 1920x1080@144, -1920x0, 1"
      ];

      xwayland = {
        force_zero_scaling = "true";
      };

      env = [
        "GDK_SCALE,1.25"
        "XCURSOR_SIZE,24"
      ];

      input = {
        kb_layout = "us";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = "yes";
        };

        sensitivity = 0;
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 5;
        "col.active_border" = "rgba(008cffee) rgba(008cffee) 45deg";
        "col.inactive_border" = "rgba(eebbeeee) rgba(eebbeeee) 90deg";
        layout = "dwindle";
      };

      decoration = {
        rounding = 15;
        active_opacity = 1.0;
        inactive_opacity = 0.8;
        fullscreen_opacity = 1.0;
        blur = {
          enabled = true;
          size = 3;
          passes = 3;
          new_optimizations = "on";
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "myBezier, 0.59, 0.42, 0.1, 1.2"
          "wiggleInOut, 0.59, -0.09, 0.1, 1.1"
          "linear, 0, 0, 1, 1"
        ];

        animation = [
          "windows, 1, 5, myBezier"
          "windowsOut, 1, 7, wiggleInOut, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 100, linear, loop"
          "fade, 1, 7, default"
          "workspaces, 1, 6, wiggleInOut"
        ];

      };

      dwindle = {
        pseudotile = true;
          preserve_split = true;
          };

        master = {
          new_on_top = true;
        };

        gestures = {
          workspace_swipe = true;
        };

        misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
        };

        windowrule = [
          "opacity 0.9 override 0.8 override, ^(vesktop)$"
          "opacity 0.9 override 0.8 override, ^(discord)$"
        ];

        "$mainMod" = "SUPER";
        "$shMod" = "SUPERSHIFT";
        "$altMod" = "SUPERALT";
        "$ctrlMod" = "SUPERCTRL";
        "$shaltMod" = "SUPERSHIFTALT";
        "$shctrlMod" = "SUPERSHIFTCTRL";
        "$shctrlaltMod" = "SUPERSHIFTCTRLALT";

        bind = [
          "$mainMod, Return, exec, kitty"
          "$mainMod, F, exec, nemo"
          "$altMod, F, exec, firefox-nightly"
          "$altMod, B, exec, brave"
          "$altMod, K, exec, krita"
          "$shaltMod, K, exec, kalzium"
          "$altMod, C, exec, vesktop"
          "ALT, period, exec, btop"
          "$mainMod, R, exec, rofi -combi-modi window,drun,ssh -show run"
          "$mainMod, Escape, exec, rofi -show power-menu -modi power-menu:rofi-power-menu"
          "$mainMod, period, exec, rofimoji"
          "ALT, B, exec, rofi-bluetooth"
          "$ctrlMod, P, exec, hyprpicker -a"
          "$shMod, S, exec, hyprshade off && grim -g \"$(slurp)\" - | convert - -shave 1x1 PNG:- | swappy -f - # area capture"
          ", PRINT, exec, hyprshade off && grim -t png ~/Sync/Pictures/Screenshots/$(date +'%s.png') # full window capture"
          "$ctrlMod, S, exec, wl-paste | swappy -f -"
          "$mainMod, V, togglefloating,"
          "$altMod, V, pseudo, # dwindle"
          "$mainMod, D, togglesplit, # dwindle"
          "$mainMod, P, pin"
          "$mainMod, C, killactive"
          "$mainMod, Q, exit"
          "$mainMod, M, fullscreenstate, 1 0"
          "$shMod, M, fullscreenstate, 0 2"
          "$altMod, M, fullscreenstate, 2 0"
          "$ctrlMod, M, fullscreenstate, 2 2"
          "$mainMod, N, movetoworkspacesilent, special:minimized"
          "$shMod, N, togglespecialworkspace, minimized"
          "$shMod, N, submap, minimized"
          ", F4, killactive"
          ", Return, movetoworkspace, +0"
          ", Return, submap, reset"
          ", mouse:272, movetoworkspace, +0"
          ", mouse:272, submap, reset"
          ", escape, togglespecialworkspace, minimized"
          ", escape, submap, reset"
          "ALT, R, submap, resize"
          ", escape, submap, reset # reset to the global submap"
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$shMod, 1, movetoworkspace, 1"
          "$shMod, 2, movetoworkspace, 2"
          "$shMod, 3, movetoworkspace, 3"
          "$shMod, 4, movetoworkspace, 4"
          "$shMod, 5, movetoworkspace, 5"
          "$shaltMod, 1, movetoworkspacesilent, 1"
          "$shaltMod, 2, movetoworkspacesilent, 2"
          "$shaltMod, 3, movetoworkspacesilent, 3"
          "$shaltMod, 4, movetoworkspacesilent, 4"
          "$shaltMod, 5, movetoworkspacesilent, 5"
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"
        ];

        binde = [
          ", H, movefocus, l"
          ", L, movefocus, r"
          ", J, movefocus, u"
          ", K, movefocus, d"
          ", left, movefocus, l"
          ", right, movefocus, r"
          ", up, movefocus, u"
          ", down, movefocus, d"
          "$mainMod, H, movefocus, l"
          "$mainMod, L, movefocus, r"
          "$mainMod, J, movefocus, u"
          "$mainMod, K, movefocus, d"
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"
          "ALT, Tab, cyclenext, prev"
          "ALTSHIFT, Tab, cyclenext"
          "$mainMod, TAB, workspace, previous"
          ", right, resizeactive, 10 0"
          ", left, resizeactive, -10 0"
          ", up, resizeactive, 0 -10"
          ", down, resizeactive, 0 10"
          "$ctrlMod, L, exec,systemctl suspend"
        ];

        bindel = [
          "ALT, XF86Calculator, exec, rofi -show calc -modi calc:rofi-calc -no-show-match -no-sort"
          ", XF86MonBrightnessUp, exec, brightnessctl s +5%"
          ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
          ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPrev, exec, playerctl previous"
          ", XF86AudioStop, exec, playerctl stop"
          ", XF86Calculator, exec, gnome-calculator"
        ];

        submap = [
          "minimized"
          "reset"
          "resize # will start a submap called \"resize\""
          "reset"
        ];

        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

        # Lid opening and closing
        # trigger when the switch is turning on (i.e., lid closes)
        #bindl=,switch:on:Lid Switch,exec,systemctl suspend
        # trigger when the switch is turning off (i.e., lid opens)

        bindl = [
          ",switch:off:Lid Switch,exec,hyprctl keyword monitor \"${laptop}, 2560x1440, 0x0, 1.25\" && hyprshade auto"
        ];

        windowrulev2 = [
          "opacity 0.0 override,class:^(xwaylandvideobridge)$"
          "noanim,class:^(xwaylandvideobridge)$"
          "noinitialfocus,class:^(xwaylandvideobridge)$"
          "maxsize 1 1,class:^(xwaylandvideobridge)$"
          "noblur,class:^(xwaylandvideobridge)$"
        ];

        exec = [
          "hyprshade auto # Shader; blue light filter"
        ];

        exec-once = [
          "hyprpaper # Wallpaper"
          "hypridle # Idle daemon"
          "waybar"
          #exec-once ~/.dotfiles/user-config/maplespace/ags/config.js
          "wl-paste --watch cliphist store"
          "udiskie &"
          "nm-applet"
          "us-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "distrobox-assemble create --file ~/.dotfiles/user-config/maplespace/distrobox.ini --replace"
        ];

      };
    };
  }
