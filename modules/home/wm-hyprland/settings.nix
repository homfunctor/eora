# todo: revise, customize animations more
{
  config,
  lib,
  ...
}: let
  inherit (config.home.opts) hyprlandOpts;
  inherit (lib) mkDefault;
in {
  wayland.windowManager.hyprland.settings = {
    "$floatingSize" = "600 400";
    "$pwvucontrol" = "com.saivert.pwvucontrol";
    inherit
      (hyprlandOpts)
      general
      monitor
      workspace
      ;

    animations = mkDefault {
      enabled = "yes, please :)";
      first_launch_animation = true;

      animation = [
        "windowsIn, 1, 3, easeInOutSine, popin"
        "windowsOut, 1, 3, easeInOutSine, popin"
        "border, 1, 3, easeInOutSine"
        "borderangle, 1, 30, easeInOutSine, loop"
        "workspacesIn, 1, 3, easeInOutSine, slidefade"
        "workspacesOut, 1, 3, easeInOutSine, slidefade"
        "specialWorkspaceIn, 1, 3, easeInOutSine, slidevert"
        "specialWorkspaceOut, 1, 3, easeInOutSine, slidevert"
        "layersIn, 1, 3, easeInOutSine, fade"
        "layersOut, 1, 3, easeInOutSine, fade"
      ];

      bezier = [
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "linear, 1, 1, 1, 1"
        "Cubic, 0.1, 0.1, 0.1, 1"
        "overshot, 0.05, 0.9, 0.1, 1.1"
        "ease-in-out, 0.17, 0.67, 0.83, 0.67"
        "ease-in, 0.17, 0.67, 0.83, 0.67"
        "ease-out, 0.42, 0, 1, 1"
        "easeInOutSine, 0.37, 0, 0.63, 1"
        "easeInSine, 0.12, 0, 0.39, 0"
        "easeOutSine, 0.61, 1, 0.88, 1"
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

    # permission = [];

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
      "float, class:^($pwvucontrol)$"
      "size $floatingSize, class:^($pwvucontrol)$"
      "center, class:^($pwvucontrol)$"

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
    ];

    xwayland = {
      use_nearest_neighbor = true;
      force_zero_scaling = true;
    };
  };
}
