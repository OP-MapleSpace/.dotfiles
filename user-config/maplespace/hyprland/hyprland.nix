{lib, pkgs, ...}:
let
  laptop_screen = "eDP-1";
  ext_mon_hdmi = "HDMI-A-1";
in
''
# See https://wiki.hyprland.org/Configuring/Monitors/
monitor=${laptop_screen}, 2560x1440@165, 0x0, 1.25
monitor=${ext_mon_hdmi}, 1920x1080@144, -1920x0, 1

xwayland {
  force_zero_scaling = true
}

# See https://wiki.hyprland.org/Configuring/Keywords/ for more

# Execute your favorite apps and scripts at launch
env = GDK_SCALE,1.25
env = XCURSOR_SIZE,24
exec = waybar
exec-once = wl-paste --watch cliphist store
exec-once = udiskie &
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
    border_size = 5
    col.active_border = rgba(008cffee) rgba(008cffee) 45deg
    col.inactive_border = rgba(eebbeeee) rgba(eebbeeee) 90deg

    layout = dwindle
}

decoration {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    rounding = 15

    active_opacity = 1.0
    inactive_opacity = 0.8
    fullscreen_opacity = 1.0

    blur {
      enabled = yes
      size = 3
      passes = 3
      new_optimizations = on
    }

    shadow {
      enabled = true
      range = 20
      render_power = 2
      color = rgba(008cffdd)
      color_inactive = rgba(eebbeeee)
    }
}

animations {
    enabled = yes

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = myBezier, 0.59, 0.42, 0.1, 1.2
    bezier = wiggleInOut, 0.59, -0.09, 0.1, 1.1
    bezier = linear, 0, 0, 1, 1

    animation = windows, 1, 5, myBezier
    animation = windowsOut, 1, 7, wiggleInOut, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 100, linear, loop
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, wiggleInOut
}

dwindle {
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = yes # you probably want this
}

master {
    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    new_on_top = true
}

gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = on
}

misc {
    force_default_wallpaper = 0
    disable_hyprland_logo = true
}

# Example per-device config
# See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
#device:epic mouse V1 {
#    sensitivity = -0.5
#}

# Example windowrule v1
# windowrule = float, ^(kitty)$

windowrule = opacity 0.9 override 0.8 override,class:^(vesktop)$
windowrule = opacity 0.9 override 0.8 override,class:^(discord)$

# Example windowrule v2
# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more


# See https://wiki.hyprland.org/Configuring/Keywords/ for more
$mainMod = SUPER
$shMod = SUPERSHIFT
$altMod = SUPERALT
$ctrlMod = SUPERCTRL
$shaltMod = SUPERSHIFTALT
$shctrlMod = SUPERSHIFTCTRL
$shctrlaltMod = SUPERSHIFTCTRLALT

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod, Return, exec, kitty
bind = $mainMod, F, exec, nemo
bind = $altMod, E, exec, thunderbird
bind = $altMod, B, exec, zen-twilight
bind = $shaltMod, B, exec, brave
bind = $altMod, K, exec, krita
bind = $shaltMod, K, exec, kalzium
bind = $altMod, C, exec, vesktop
bind = ALT, period, exec, btop

# rofi
bind = $mainMod, R, exec, rofi -combi-modi window,drun,ssh -show run
bind = $mainMod, Escape, exec, rofi -show power-menu -modi power-menu:rofi-power-menu
bind = $mainMod, period, exec, rofimoji
#bind = ALT, B, exec, rofi-bluetooth
bindel = ALT, XF86Calculator, exec, rofi -show calc -modi calc:rofi-calc -no-show-match -no-sort
bind = $altMod, R, exec, walker

# Color picker
bind = $ctrlMod, P, exec, hyprpicker -a

# Screenshot tool
bind = $shMod, S, exec, hyprshade off && grim -g "$(slurp)" - | convert - -shave 1x1 PNG:- | swappy -f - # area capture
bind = , PRINT, exec, hyprshade off && grim -t png ~/Sync/Pictures/Screenshots/$(date +'%s.png') # full window capture
# Allowing Swappy to edit image from clipboard
bind = $ctrlMod, S, exec, wl-paste | swappy -f -

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
bindel = , XF86Calculator, exec, gnome-calculator

# Working with windows
bind = $mainMod, V, togglefloating,
bind = $altMod, V, pseudo, # dwindle
bind = $mainMod, D, togglesplit, # dwindle
bind = $mainMod, P, pin
bind = $mainMod, C, killactive
bind = $mainMod, Q, exit
bind = $mainMod, M, fullscreenstate, 1 0
bind = $shMod, M, fullscreenstate, 0 2
bind = $altMod, M, fullscreenstate, 2 0
bind = $ctrlMod, M, fullscreenstate, 2 2

# # Minimizing, brought to you by https://github.com/hyprwm/Hyprland/issues/995#issuecomment-1937369517 & https://github.com/hyprwm/Hyprland/issues/995#issuecomment-2069669681
bind = $mainMod, N, movetoworkspacesilent, special:minimized
bind = $shMod, N, togglespecialworkspace, minimized
bind = $shMod, N, submap, minimized
submap = minimized
bind = , F4, killactive
bind = , Return, movetoworkspace, +0
bind = , Return, submap, reset
bind = , mouse:272, movetoworkspace, +0
bind = , mouse:272, submap, reset
bind = , escape, togglespecialworkspace, minimized
bind = , escape, submap, reset
binde = , H, movefocus, l
binde = , L, movefocus, r
binde = , J, movefocus, u
binde = , K, movefocus, d
binde = , left, movefocus, l
binde = , right, movefocus, r
binde = , up, movefocus, u
binde = , down, movefocus, d
submap = reset


# Move focus with mainMod
binde = $mainMod, H, movefocus, l
binde = $mainMod, L, movefocus, r
binde = $mainMod, J, movefocus, u
binde = $mainMod, K, movefocus, d
binde = $mainMod, left, movefocus, l
binde = $mainMod, right, movefocus, r
binde = $mainMod, up, movefocus, u
binde = $mainMod, down, movefocus, d
binde = ALT, Tab, cyclenext, prev
binde = ALTSHIFT, Tab, cyclenext
binde = $mainMod, TAB, workspace, previous

# Resize
bind = ALT, R, submap, resize
submap = resize # will start a submap called "resize"
binde = , right, resizeactive, 10 0
binde = , left, resizeactive, -10 0
binde = , up, resizeactive, 0 -10
binde = , down, resizeactive, 0 10
bind = , escape, submap, reset # reset to the global submap
submap = reset

# Lock
binde = $ctrlMod, L, exec,systemctl suspend

# Switch workspaces
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
# Move active window to a workspace
bind = $shMod, 1, movetoworkspace, 1
bind = $shMod, 2, movetoworkspace, 2
bind = $shMod, 3, movetoworkspace, 3
bind = $shMod, 4, movetoworkspace, 4
bind = $shMod, 5, movetoworkspace, 5
bind = $shaltMod, 1, movetoworkspacesilent, 1
bind = $shaltMod, 2, movetoworkspacesilent, 2
bind = $shaltMod, 3, movetoworkspacesilent, 3
bind = $shaltMod, 4, movetoworkspacesilent, 4
bind = $shaltMod, 5, movetoworkspacesilent, 5
# Move acrive window to another monitor
#bind = $shctrlMod, 1, changemonitor, 1
#bind = $shctrlMod, 2, changemonitor, 2
#bind = $shctrlMod, 3, changemonitor, 3
#bind = $shctrlMod, 4, changemonitor, 4
#bind = $shctrlMod, 5, changemonitor, 5
#bind = $shctrlaltMod, 1, changemonitorsilent, 1
#bind = $shctrlaltMod, 2, changemonitorsilent, 2
#bind = $shctrlaltMod, 3, changemonitorsilent, 3
#bind = $shctrlaltMod, 4, changemonitorsilent, 4
#bind = $shctrlaltMod, 5, changemonitorsilent, 5
# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1
# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# Lid opening and closing
# trigger when the switch is turning on (i.e., lid closes)
#bindl=,switch:on:Lid Switch,exec,systemctl suspend
# trigger when the switch is turning off (i.e., lid opens)
bindl=,switch:off:Lid Switch,exec,hyprctl keyword monitor "${laptop_screen}, 2560x1440, 0x0, 1.25" && hyprshade auto

# Distrobox
exec-once = distrobox-assemble create --file ~/.dotfiles/user-config/maplespace/distrobox.ini --replace

# For screensharing
exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
windowrule = opacity 0.0 override,class:^(xwaylandvideobridge)$
windowrule = noanim,class:^(xwaylandvideobridge)$
windowrule = noinitialfocus,class:^(xwaylandvideobridge)$
windowrule = maxsize 1 1,class:^(xwaylandvideobridge)$
windowrule = noblur,class:^(xwaylandvideobridge)$

# Hyprland apps
#exec-once = hyprpaper # Wallpaper
exec = hyprshade auto # Shader; blue light filter
exec-once = hypridle # Idle daemon
''
