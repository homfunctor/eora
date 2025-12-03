# very wip
{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (config.home.opts) apps;
  inherit (lib) getExe;
  inherit (lib.strings) splitString;

  splitArg = arg: splitString " " arg;
  workTime = "Fall2025";
in {
  programs.niri = {
    settings = {
      binds = with config.lib.niri.actions; {
        # applications
        "Mod+E".action = spawn (
          [apps.directory.exe] ++ (splitArg apps.directory.args)
        );
        "Mod+Shift+E".action = spawn (
          [apps.terminal.exe]
          ++ (splitArg (getExe pkgs.yazi))
          ++ ["~/eora"]
        );

        "Mod+W".action.spawn = apps.terminal.exe;
        "Mod+Shift+W".action = spawn [apps.terminal.exe "~/eora"];
        "Mod+Ctrl+Shift+W".action = spawn [
          apps.terminal.exe
          (getExe pkgs.yazi)
          "~/Work/${workTime}"
        ];

        "Mod+Ctrl+Shift+C".action.spawn = getExe pkgs.gnome-calculator;
        "Mod+Ctrl+Shift+J".action.spawn = getExe pkgs.xournalpp;

        "Mod+R".action = spawn (
          [apps.launcher.exe]
          ++ (splitArg apps.launcher.args)
        );

        # window management
        # todo
        # "${mod}, D, togglesplit"
        # "${mod}, F, fullscreen"
        # "${mod}, T, togglefloating"

        "Mod+Q".action = close-window;
        "Mod+F".action = maximize-column; # fullscreen?
        "Mod+Shift+F".action = expand-column-to-available-width; # full-fullscreen?
        "Mod+T".action = toggle-window-floating;

        # todo
        # # resize window (vim-like)
        # "${mod} CTRL, H, resizeactive, -20 0"
        # "${mod} CTRL, J, resizeactive, 0 20"
        # "${mod} CTRL, K, resizeactive, 0 -20"
        # "${mod} CTRL, L, resizeactive, 20 0"
        #
        # # resize window (directional)
        # "${mod} CTRL, left, resizeactive, -20 0"
        # "${mod} CTRL, down, resizeactive, 0 20"
        # "${mod} CTRL, up, resizeactive, 0 -20"
        # "${mod} CTRL, right, resizeactive, 20 0"

        # focus window movement
        "Mod+H".action = focus-column-left;
        "Mod+L".action = focus-column-right;
        "Mod+J".action = focus-window-or-workspace-down;
        "Mod+K".action = focus-window-or-workspace-up;
        "Mod+Shift+H".action = move-column-left;
        "Mod+Shift+L".action = move-column-right;
        "Mod+Shift+K".action = move-column-to-workspace-up;
        "Mod+Shift+J".action = move-column-to-workspace-down;

        "Mod+Left".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+Down".action = focus-workspace-down;
        "Mod+Up".action = focus-workspace-up;
        "Mod+Shift+Left".action = move-column-left;
        "Mod+Shift+Right".action = move-column-right;
        "Mod+Shift+Down".action = move-column-to-workspace-up;
        "Mod+Shift+Up".action = move-column-to-workspace-down;

        # todo
        #   # cycle windows
        #   "ALT, tab, cyclenext"
        #   "ALT, tab, bringactivetotop"
        #
        #   # misc controls
        #   "${mod} ALT, L, exec, ${uApp "${getExe hypr.hyprlock.pkg}"}"
        #   "${mod}, Q, killactive"
        #   "${mod}, mouse:274, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        #   "${mod}, mouse:275, exec,  ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        #   "${mod}, mouse:276, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        #   ", PRINT, exec, ${uApp "${getExe hypr.grimblast.pkg}"} --notify copysave area ${config.xdg.userDirs.pictures}/Screenshots/$(date '+%Y%m%d-%H:%M:%S').png"
        #   ", KEY_SYSRQ, exec, ${uApp "${getExe hypr.grimblast.pkg}"} --notify copysave area ${config.xdg.userDirs.pictures}/Screenshots/$(date '+%Y%m%d-%H:%M:%S').png"
        #
        #   # unswallow/reswallow a window
        #   "${mod}, S, toggleswallow"
        #
        #   # workspaces
        #   "${mod}, 1, workspace, 1"
        #   "${mod}, 2, workspace, 2"
        #   "${mod}, 3, workspace, 3"
        #   "${mod} SHIFT, 1, workspace, 4"
        #   "${mod} SHIFT, 2, workspace, 5"
        #   "${mod} SHIFT, 3, workspace, 6"
        #
        #   # moving windows to workspaces
        #   "${mod} CTRL, 1, movetoworkspacesilent, 1"
        #   "${mod} CTRL, 2, movetoworkspacesilent, 2"
        #   "${mod} CTRL, 3, movetoworkspacesilent, 3"
        #   "${mod} SHIFT CTRL, 1, movetoworkspacesilent, 4"
        #   "${mod} SHIFT CTRL, 2, movetoworkspacesilent, 5"
        #   "${mod} SHIFT CTRL, 3, movetoworkspacesilent, 6"
        # ];
        #
        # bindl = [
        #   ", XF86AudioMicMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        #   ", XF86AudioMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        #   ", XF86AudioNext, exec, ${pkgs.wireplumber}/bin/wpctl next"
        #   ", XF86AudioPlay, exec, ${pkgs.wireplumber}/bin/wpctl play-pause"
        #   ", XF86AudioPrev, exec, ${pkgs.wireplumber}/bin/wpctl previous"
        # ];
        #
        # bindle = [
        #   ", XF86AudioLowerVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%-"
        #   ", XF86AudioRaiseVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%+"
        #   ", XF86MonBrightnessDown, exec, ${getExe pkgs.brillo} -q -u 300000 -U 5"
        #   ", XF86MonBrightnessUp, exec, ${getExe pkgs.brillo} -q -u 300000 -A 5"
        # ];
        #
        # bindm = [
        #   "${mod}, mouse:272, movewindow"
        #   "${mod}, mouse:273, resizewindow"
        # ];
      };
    };
  };
}
