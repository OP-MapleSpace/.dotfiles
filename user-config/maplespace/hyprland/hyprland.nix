{lib, pkgs, ...}:
let
  laptop_screen = "eDP-1";
  ext_mon_hdmi = "HDMI-A-1";
in
''
# See https://wiki.hyprland.org/Configuring/Monitors/
monitor=${laptop_screen}, 2560x1440@165, 0x0, 1.25
monitor=${ext_mon_hdmi}, 1920x1080@144, auto, 1

xwayland {
  force_zero_scaling = true
}

# See https://wiki.hyprland.org/Configuring/Keywords/ for more

# Execute your favorite apps and scripts at launch
env = GDK_SCALE,1.25
env = XCURSOR_SIZE,24
exec-once = waybar
exec-once = wl-paste --watch cliphist store
exec-once = udiskie &
exec-once = dunst
exec-once = nm-applet

# Source a file (multi-file configs)
# source = ~/.config/hypr/myColors.conf

# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
input {
    kb_layout = us
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =

    follow_mouse = 1

    touchpad {
        natural_scroll = yes
    }

    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
}

general {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    gaps_in = 5
    gaps_out = 20
    border_size = 2
    col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
    col.inactive_border = rgba(595959aa)

    layout = dwindle
}

decoration {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    rounding = 10

    blur {
      enabled = yes
      size = 3
      passes = 3
      new_optimizations = on
    }

    drop_shadow = yes
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
}

animations {
    enabled = yes

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}

dwindle {
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = yes # you probably want this
}

master {
    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    new_is_master = true
}

gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = on
}

misc {
    # No more anime wallpaper hopefully this means swww actually does actually do its job 100% of the time
    force_default_wallpaper = 0
    disable_hyprland_logo = true
}

# Example per-device config
# See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
device:epic mouse V1 {
    sensitivity = -0.5
}

# Example windowrule v1
# windowrule = float, ^(kitty)$
# Example windowrule v2
# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more


# See https://wiki.hyprland.org/Configuring/Keywords/ for more
$mainMod = SUPER

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod, Return, exec, kitty
bind = $mainMod, F, exec, nemo
bind = SUPERALT, F, exec, firefox
bind = SUPERALT, M, exec, distrobox-enter debian-unstable -- mercury-browser
bind = SUPERALT, B, exec, brave
bind = SUPERALT, K, exec, krita
bind = SUPERSHIFTALT, K, exec, kalzium
bind = $mainMod, R, exec, anyrun
bind = SUPERALT, C, exec, discordcanary

# Color picker
bind = SUPERCTRL, P, exec, hyprpicker

# Screenshot tool
bind = SUPERSHIFT, s, exec, grim -g "$(slurp)" - | convert - -shave 1x1 PNG:- | swappy -f - # area capture
bind = , PRINT, exec, grim -t png ~/Sync/Pictures/Screenshots/$(date +'%s.png') # full window capture
# Allowing Swappy to edit image from clipboard
bind = SUPERCTRL, s, exec, wl-paste | swappy -f -

# Using hardware keys
bindel = , XF86MonBrightnessUp, exec, brightnessctl s +5%
bindel = , XF86MonBrightnessDown, exec, brightnessctl s 5%-
bindel = , XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
bindel = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bindel = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bindel = , XF86AudioPlay, exec, playerctl play-pause
bindel = , XF86AudioNext, exec, playerctl next
bindel = , XF86AudioPrev, exec, playerctl previous
bindel = , XF86AudioStop, exec, playerctl stop

# Working with windows
bind = $mainMod, V, togglefloating, 
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, D, togglesplit, # dwindle
bind = $mainMod, M, fullscreen, 1
bind = SUPERSHIFT, M, fullscreen, 0
bind = $mainMod, C, killactive,
bind = $mainMod, Q, exit,

# Move focus with mainMod
bind = $mainMod, H, movefocus, l
bind = $mainMod, L, movefocus, r
bind = $mainMod, J, movefocus, u
bind = $mainMod, K, movefocus, d
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d
bind = ALT, Tab, cyclenext
bind = $mainMod, TAB, workspace, previous

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# Lid opening and closing
# trigger when the switch is turning on (i.e., lid closes)
bindl=,switch:on:Lid Switch,exec,hyprctl keyword monitor "${laptop_screen}, disable" && swaylock
# trigger when the switch is turning off (i.e., lid opens)
bindl=,switch:off:Lid Switch,exec,hyprctl keyword monitor "${laptop_screen}, 2560x1440, 0x0, 1.25"

# For screensharing
exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

# Wallpaper
#exec-once = swww init && swww img ~/.dotfiles/wallpaper/SpaceAce.png
exec-once = hyprpaper
''
