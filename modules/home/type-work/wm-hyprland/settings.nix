# todo: revise, customize animations more
{
  config,
  lib,
  ...
}: let
  inherit (config.home.opts) hyprlandOpts;
  inherit (config.lib.stylix) colors;
  inherit (lib) mkDefault mkForce;
in {
  wayland.windowManager.hyprland.settings = {
    "$floatingSize" = "500 500";
    inherit
      (hyprlandOpts)
      monitor
      workspace
      ;

    animations = mkDefault {
      enabled = "yes, please :)";
      first_launch_animation = true;

      animation = [
        "windows, 1, 6, wind, slide"
        "windowsIn, 1, 6, winIn, slide"
        "windowsOut, 1, 5, winOut, slide"
        "windowsMove, 1, 5, wind, slide"
        "border, 1, 1, liner"
        "borderangle, 1, 30, liner, loop"
        "fade, 1, 10, default"
        "workspaces, 1, 5, wind"
      ];

      bezier = [
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "liner, 1, 1, 1, 1"
      ];
    };

    cursor.no_warps = true;

    decoration = {
      blur = {
        enabled = true;
        new_optimizations = true;
        passes = 2;
        size = 4;
      };

      rounding = 0;

      shadow.enabled = true;
    };

    dwindle = mkDefault {
      pseudotile = true;
      preserve_split = true;
      special_scale_factor = 1.0;
      smart_split = true;
      smart_resizing = true;
      use_active_for_splits = true;
      force_split = 0;
      split_width_multiplier = 1.0;
    };

    input = {
      kb_layout = "us";
      numlock_by_default = true;
      follow_mouse = 2;
      sensitivity = 0;
      accel_profile = "flat";
      float_switch_override_focus = 2;
    };

    misc = {
      animate_manual_resizes = true;
      animate_mouse_windowdragging = true;
      anr_missed_pings = 30;
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      enable_anr_dialog = true;
      initial_workspace_tracking = 0;
      key_press_enables_dpms = true;
      mouse_move_enables_dpms = true;
      new_window_takes_over_fullscreen = 2;
      vfr = 1;
      vrr = 1;
    };

    general =
      hyprlandOpts.general
      // (with colors; {
        "col.active_border" = mkForce "rgb(${base08})";
        "col.inactive_border" = mkForce "rgb(${base02})";
      });

    windowrule = [
    ];

    windowrulev2 = [
      # smart gaps
      "bordersize 0, floating:0, onworkspace:w[t1]"
      "bordersize 0, floating:0, onworkspace:w[tg1]"
      "bordersize 0, floating:0, onworkspace:f[1]"
      "rounding 0, floating:0, onworkspace:w[t1]"
      "rounding 0, floating:0, onworkspace:w[tg1]"
      "rounding 0, floating:0, onworkspace:f[1]"

      # no maximize requests
      "suppressevent maximize, class:.*"

      # fix some dragging issues with XWayland
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

      # networkManager applet
      "float, class:^(nm-connection-editor)$"
      "size $floatingSize, class:^(nm-connection-editor)$"
      "center, class:^(nm-connection-editor)$"

      # blueman
      "float, class:^(.blueman-manager-wrapped)$"
      "size $floatingSize, class:^(.blueman-manager-wrapped)$"
      "center, class:^(.blueman-manager-wrapped)$"

      # audio control
      "float, class:^($com.saivert.pwvucontrol)$"
      "size $floatingSize, class:^($com.saivert.pwvucontrol)$"
      "center, class:^($com.saivert.pwvucontrol)$"

      # udiskie
      "float, class:^(udiskie)$"
      "center, class:^(udiskie)$"

      # make PiP window floating and sticky
      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"

      # calculator
      "float, class:^(org.gnome.Calculator)$"
      "size > >, class:^(org.gnome.Calculator)$"

      # dim some programs
      "dimaround, class:^(xdg-desktop-portal-hyprland)$"

      # steam
      "immediate, class:^(steam_app_*)$"
      "float, class:steam"
      "tile, class:steam, title:Steam"

      # password focus
      "stayfocused, class:^(pinentry-)"
      "stayfocused, class:^(polkit-), title:(Authenticate)"
      "stayfocused, class:(gcr-prompter)"

      # file picker
      "float, class:^(xdg-desktop-portal-gtk), title:(All Files)"
      "stayfocused, class:^(xdg-desktop-portal-gtk), title:(All Files)"

      # protonplus
      "float,class:^(com.vysp3r.ProtonPlus), title:(ProtonPlus)"

      # winetricks
      "float,class:^(zenity)"

      "float,class:^(org.gnome.FileRoller)"
    ];

    xwayland = {
      force_zero_scaling = true;
      use_nearest_neighbor = true;
    };
  };
}
