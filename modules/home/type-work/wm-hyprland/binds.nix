{
  config,
  flake,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  inherit (config.home.opts) apps;
  inherit (flake.lib) uApp uTog;
  inherit (lib) getExe;
  inherit (osConfig.nixos.opts) hypr;
  panelExe = getExe hypr.hyprpanel.pkg;

  mod = "SUPER";
in {
  wayland.windowManager.hyprland.settings = {
    bind = [
      # applications
      "${mod} SHIFT, E, exec, ${uApp "${apps.terminal.exe}"} ${getExe pkgs.yazi} ~/eora"
      "${mod} SHIFT, W, exec, ${uApp "${apps.terminal.exe}"}  ~/eora"
      "${mod}, E, exec, ${uApp "${apps.directory.exe}"} ${apps.directory.args}"
      "${mod}, W, exec, ${uApp "${apps.terminal.exe}"}"
      "${mod} CTRL SHIFT, C, exec, ${uApp "${getExe pkgs.gnome-calculator}"}"
      "${mod} CTRL SHIFT, J, exec, ${uApp "${getExe pkgs.xournalpp}"}"
      "${mod} CTRL SHIFT, W, exec, ${uApp "${apps.terminal.exe}"}  ${getExe pkgs.yazi} ~/Work/Fall2025"

      # hyprpanel
      "${mod}, A, exec, ${panelExe} t audiomenu"
      "${mod} SHIFT, C, exec, ${panelExe} t calendarmenu"
      "${mod}, N, exec, ${panelExe} t notificationsmenu"
      "${mod} SHIFT, N, exec, ${panelExe} clearNotifications"
      "${mod}, X, exec, ${panelExe} t powerdropdownmenu"
      "${mod}, grave, exec, ${panelExe} t dashboardmenu"

      # launcher
      "${mod}, R, exec, ${uTog "${apps.launcher.exe}"} ${apps.launcher.args}"

      # window management
      "${mod}, D, togglesplit"
      "${mod}, F, fullscreen"
      "${mod}, T, togglefloating"

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

      # cycle windows
      "ALT, tab, cyclenext"
      "ALT, tab, bringactivetotop"

      # misc controls
      "${mod} ALT, L, exec, ${uApp "${getExe hypr.hyprlock.pkg}"}"
      "${mod}, Q, killactive"
      "${mod}, mouse:274, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      "${mod}, mouse:275, exec,  wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      "${mod}, mouse:276, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ", PRINT, exec, ${uApp "${getExe hypr.grimblast.pkg}"} --notify copysave area ${config.xdg.userDirs.pictures}/Screenshots/$(date '+%Y%m%d-%H:%M:%S').png"
      ", KEY_SYSRQ, exec, ${uApp "${getExe hypr.grimblast.pkg}"} --notify copysave area ${config.xdg.userDirs.pictures}/Screenshots/$(date '+%Y%m%d-%H:%M:%S').png"

      # unswallow/reswallow a window
      "${mod}, S, toggleswallow"

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
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioNext, exec, wpctl next"
      ", XF86AudioPlay, exec, wpctl play-pause"
      ", XF86AudioPrev, exec, wpctl previous"
    ];

    bindle = [
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%-"
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%+"
      ", XF86MonBrightnessDown, exec, ${getExe pkgs.brillo} -q -u 300000 -U 5"
      ", XF86MonBrightnessUp, exec, ${getExe pkgs.brillo} -q -u 300000 -A 5"
    ];

    bindm = [
      "${mod}, mouse:272, movewindow"
      "${mod}, mouse:273, resizewindow"
    ];
  };
}
