{
  config,
  inputs,
  lib,
  osConfig,
  ...
}: let
  inherit (config.lib.stylix) colors;
  # per-host not per-user
  inherit (osConfig.nixos.opts) mainMonitor;
in {
  # force manual theming
  stylix.targets.hyprlock.enable = lib.mkForce false;

  programs.hyprlock = {
    enable = true;
    settings = {
      background = [
        {
          monitor = "";
          path = "${inputs.sapadal}/assets/durinsgate.jpg";
        }
      ];

      general = {
        # disable_loading_bar = true;
        # grace = 2;
        hide_cursor = true;
      };

      input-field = with colors; [
        {
          capslock_color = -1;
          dots_center = true;
          dots_rounding = -1;
          dots_spacing = 0.2;
          fade_on_empty = true;
          fade_timeout = 1000;
          # fail_transition = 300;
          font_color = "rgb(${base05})";
          halign = "center";
          hide_input = false;
          inner_color = "rgb(${base01})";
          invert_numlock = false;
          monitor = mainMonitor;
          outer_color = "rgb(${base07})";
          outline_thickness = 5;
          placeholder_text = "<i> input password</i>";
          position = "0, -300";
          rounding = 0;
          size = "300, 60";
          swap_font_color = false;
          valign = "center";
        }
      ];

      label = with colors; [
        {
          color = "rgb(${base04})";
          font_size = 28;
          halign = "center";
          monitor = mainMonitor;
          position = "0, 450";
          text = ''
            cmd[update:1000] echo -e "$(date +"%A, %B %d")"
          '';
          valign = "center";
        }

        {
          color = "rgb(${base04})";
          font_size = 160;
          halign = "center";
          monitor = mainMonitor;
          position = "0, 320";
          text = ''
            cmd[update:1000] echo "<span>$(date +"%I:%M %P")</span>"
          '';
          valign = "center";
        }
      ];
    };
  };
}
