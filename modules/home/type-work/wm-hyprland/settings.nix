{
  config,
  lib,
  ...
}: let
  inherit (config.home.opts) apps bg mainMonitor;
  inherit (config.lib.stylix) colors;
  inherit (lib) mkDefault mkForce zipListsWith;
in {
  config = {
    wayland.windowManager.hyprland.settings = {
      "$floatingSize" = "800 500";

      cursor.no_warps = false;

      decoration = {
        blur = {
          enabled = true;
          new_optimizations = true;
          passes = 1;
          size = 1;
        };

        rounding = 0;

        shadow = with colors; {
          color = mkForce "rgb(${base07})";
          color_inactive = mkForce "rgb(${base02})";
          enabled = true;
          range = 10;
          render_power = 3;
        };
      };

      device = {
        # at 5568ed56ffe0
        name = "huion-huion-tablet_h1060p";
        output = mainMonitor;
      };

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

      ecosystem.no_donation_nag = true;

      general = with colors; {
        "col.active_border" = mkForce "rgb(${base07})";
        "col.inactive_border" = mkForce "rgb(${base02})";
        border_size = mkDefault 5;
        gaps_in = mkDefault 5;
        gaps_out = mkDefault 0;
        layout = "dwindle";
        resize_on_border = true;
      };

      input = {
        accel_profile = "flat";
        float_switch_override_focus = 2;
        follow_mouse = 2;
        kb_layout = "us";
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

      # glue together monitor names, resolutions, positions
      monitor = with bg;
        zipListsWith (u: v: "${u}, ${v}, 1") (
          zipListsWith (m: r: "${m}, ${r}")
          monitors
          resolutions
        )
        xy;

      # assign bg.nWS workspaces per monitor (not consecutive)
      workspace = let
        num = lib.range 1 ((lib.length bg.monitors) * bg.nWS);
        mon =
          bg.monitors
          ++ (
            lib.concatLists (lib.genList (_: bg.monitors) (bg.nWS - 1))
          );
      in
        zipListsWith (n: m: "${toString n}, monitor:${m}") num mon;

      xwayland = {
        force_zero_scaling = true;
        use_nearest_neighbor = true;
      };
    };
  };
}
