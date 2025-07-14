{
  config,
  lib,
  ...
}: let
  inherit (config.home.opts) apps hpl;
  inherit (config.lib.stylix) colors;
  inherit (lib) mkForce;
in {
  wayland.windowManager.hyprland.settings = {
    "$floatingSize" = "500 500";

    cursor.no_warps = false;

    decoration = {
      blur = {
        enabled = true;
        new_optimizations = true;
        passes = 2;
        size = 4;
      };

      rounding = 0;

      shadow = with colors; {
        color = mkForce "rgb(${base08})";
        color_inactive = mkForce "rgb(${base02})";
        enabled = true;
        range = 10;
        render_power = 3;
      };
    };

    device = [
      {
        enabled = true;
        name = "huion-huion-tablet_h1060p";
        output = hpl.userOpts.tabletOutput;
      }
    ];

    dwindle = {
      force_split = 0;
      preserve_split = true;
      pseudotile = true;
      smart_resizing = true;
      smart_split = true;
      special_scale_factor = 1.0;
      split_width_multiplier = 1.0;
      use_active_for_splits = true;
    };

    input = {
      accel_profile = "flat";
      float_switch_override_focus = 2;
      follow_mouse = 2;
      kb_layout = "us";
      kb_options = "caps:escape";
      numlock_by_default = true;
      sensitivity = 0;
    };

    misc = {
      enable_swallow = true;
      swallow_exception_regex = "^(Yazi).*";
      swallow_regex = "^(${apps.terminal.desktop})$";

      animate_manual_resizes = true;
      animate_mouse_windowdragging = true;
      anr_missed_pings = 30;
      disable_hyprland_logo = true;
      disable_splash_rendering = false;
      enable_anr_dialog = true;
      initial_workspace_tracking = 0;
      key_press_enables_dpms = true;
      mouse_move_enables_dpms = true;
      new_window_takes_over_fullscreen = 2;
      vfr = 1;
      vrr = 1;
    };

    general =
      hpl.userOpts.general
      // (
        with colors; {
          "col.active_border" = mkForce "rgb(${base08})";
          "col.inactive_border" = mkForce "rgb(${base02})";
        }
      );

    workspace =
      [
        # smart gaps
        "f[1], gapsout:0, gapsin:0"
        "w[t1], gapsout:0, gapsin:0"
        "w[tg1], gapsout:0, gapsin:0"
      ]
      ++ hpl.userOpts.workspace;

    xwayland = {
      force_zero_scaling = true;
      use_nearest_neighbor = true;
    };
  };
}
