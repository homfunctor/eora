{config, ...}: let
  mod = "SUPER";
  toggle = cmd: "pkill ${cmd} || uwsm app -- ${cmd}";
  uwsmapp = cmd: "uwsm app -- ${cmd}";
in {
  wayland.windowManager.hyprland.settings = {
    bind = [
      # applications
      "${mod}, E, exec, ${uwsmapp "nemo"}"
      "${mod} SHIFT, E, exec, ${uwsmapp "alacritty --working-directory ~/eora -e yazi"}"
      "${mod}, W, exec, ${uwsmapp "alacritty"}"
      "${mod} SHIFT, W, exec, ${uwsmapp "alacritty --working-directory ~/eora"}"

      # hyprpanel
      "${mod}, X, exec, ${toggle "hyprpanel t powerdropdownmenu"}"
      "${mod}, grave, exec, ${toggle "hyprpanel t notificationsmenu"}"
      "${mod}, A, exec, ${toggle "hyprpanel t audiomenu"}"
      "${mod}, C, exec, ${toggle "hyprpanel t calendarmenu"}"

      # launcher
      "${mod}, R, exec, rofi -show drun -run-command 'uwsm app -- {cmd}'"

      # window management
      "${mod}, T, togglefloating"
      "${mod}, D, togglesplit"
      "${mod}, F, fullscreen"

      # resize window (vim-like)
      "${mod} CTRL, H, resizeactive, -20 0"
      "${mod} CTRL, J, resizeactive, 0 20"
      "${mod} CTRL, K, resizeactive, 0 -20"
      "${mod} CTRL, L, resizeactive, 20 0"

      # resize window (directional)
      "${mod} CTRL, left, resizeactive, -20 0"
      "${mod} CTRL, down, resizeactive, 0 20"
      "${mod} CTRL, up, resizeactive, 0 -20"
      "${mod} CTRL, right, resizeactive, 20 0"

      # focus and window movement (vim-like)
      "${mod}, H, movefocus, l"
      "${mod}, J, movefocus, d"
      "${mod}, K, movefocus, u"
      "${mod}, L, movefocus, r"
      "${mod} SHIFT, H, movewindow, l"
      "${mod} SHIFT, J, movewindow, d"
      "${mod} SHIFT, K, movewindow, u"
      "${mod} SHIFT, L, movewindow, r"

      # focus and window movement (directional keys)
      "${mod}, down, movefocus, d"
      "${mod}, left, movefocus, l"
      "${mod}, up, movefocus, u"
      "${mod}, right, movefocus, r"
      "${mod} SHIFT, down, movewindow, d"
      "${mod} SHIFT, left, movewindow, l"
      "${mod} SHIFT, up, movewindow, u"
      "${mod} SHIFT, right, movewindow, r"

      # simulated alt tab behavior
      "ALT, Tab, cyclenext"
      "ALT, Tab, bringactivetotop"

      # misc controls
      "${mod}, Q, killactive"
      "${mod} ALT, L, exec, ${uwsmapp "hyprlock"}"
      "${mod}, mouse:276, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      "${mod}, mouse:275, exec,  wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      "${mod}, mouse:274, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", PRINT, exec, ${uwsmapp "grimblast"} --freeze --notify copysave area ${config.xdg.userDirs.pictures}/Screenshots/$(date '+%Y%m%d-%H:%M:%S').png"

      # workspaces
      "${mod}, 1, workspace, 1"
      "${mod}, 2, workspace, 2"
      "${mod}, 3, workspace, 3"
      "${mod} SHIFT, 1, workspace, 4"
      "${mod} SHIFT, 2, workspace, 5"
      "${mod} SHIFT, 3, workspace, 6"

      # moving windows to workspaces
      "${mod} CTRL, 1, movetoworkspacesilent, 1"
      "${mod} CTRL, 2, movetoworkspacesilent, 2"
      "${mod} CTRL, 3, movetoworkspacesilent, 3"
      "${mod} SHIFT CTRL, 1, movetoworkspacesilent, 4"
      "${mod} SHIFT CTRL, 2, movetoworkspacesilent, 5"
      "${mod} SHIFT CTRL, 3, movetoworkspacesilent, 6"
    ];

    bindl = [
      ", XF86AudioPlay, exec, wpctl play-pause"
      ", XF86AudioPrev, exec, wpctl previous"
      ", XF86AudioNext, exec, wpctl next"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ];

    bindle = [
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%-"
      ", XF86MonBrightnessUp, exec, brillo -q -u 300000 -A 5"
      ", XF86MonBrightnessDown, exec, brillo -q -u 300000 -U 5"
    ];

    bindm = [
      "${mod}, mouse:272, movewindow"
      "${mod}, mouse:273, resizewindow"
    ];
  };
}
