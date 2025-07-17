{
  config,
  lib,
  ...
}: let
  inherit (config.home.opts) apps bg;
  inherit (config.lib.stylix) colors;
  inherit (lib) mkForce zipListsWith;
in {
  config = {
    wayland.windowManager.hyprland.settings = {
      "$floatingSize" = "500 500";

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
          color = mkForce "rgb(${base08})";
          color_inactive = mkForce "rgb(${base02})";
          enabled = true;
          range = 10;
          render_power = 3;
        };
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

      general = with colors; {
        "col.active_border" = mkForce "rgb(${base08})";
        "col.inactive_border" = mkForce "rgb(${base02})";
        border_size = 5;
        gaps_in = 5;
        gaps_out = 5;
        layout = "dwindle";
        resize_on_border = true;
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

      monitor = with bg;
        zipListsWith (y: z: "${y}, ${z}, 1") (
          zipListsWith (m: r: "${m}, ${r}")
          monitors
          resolutions
        )
        xy;

      # assign 2 workspaces per monitor (not consecutive)
      workspace = let
        num = lib.range 1 ((lib.length bg.monitors) * 2);
        mon = bg.monitors ++ bg.monitors;
      in
        zipListsWith (n: m: "${toString n}, monitor:${m}") num mon
        ++ [
          # smart gaps
          "f[1], gapsout:0, gapsin:0"
          "w[t1], gapsout:0, gapsin:0"
          "w[tg1], gapsout:0, gapsin:0"
        ];

      xwayland = {
        force_zero_scaling = true;
        use_nearest_neighbor = true;
      };
    };
  };
}
