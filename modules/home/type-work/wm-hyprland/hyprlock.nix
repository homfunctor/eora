{
  config,
  inputs,
  lib,
  osConfig,
  ...
}: let
  inherit (config.lib.stylix) colors;
  # per-host not per-user
  inherit (osConfig.nixos.opts.hyprlockOpts) clockLabel dateLabel inputLabel;
in {
  # force manual theming
  stylix.targets.hyprlock.enable = lib.mkForce false;

  programs.hyprlock = {
    enable = true;
    settings = {
      background = [
        {
          monitor = "";
          path = "${inputs.sapadal}/assets/base.png";
        }
      ];

      general = {
        disable_loading_bar = true;
        grace = 2;
        hide_cursor = true;
      };

      input-field = with colors; [
        {
          inherit (inputLabel) monitor;

          capslock_color = -1;
          dots_center = true;
          dots_rounding = -1;
          dots_spacing = 0.2;
          fade_on_empty = true;
          fade_timeout = 1000;
          fail_transition = 300;
          font_color = "rgb(${base05})";
          halign = "center";
          hide_input = false;
          inner_color = "rgb(${base01})";
          invert_numlock = false;
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
          inherit (clockLabel) monitor;

          color = "rgb(${base04})";
          font_size = 28;
          halign = "center";
          position = "90, 450";
          text = ''
            cmd[update:1000] echo -e "$(date +"%A, %B %d")"
          '';
          valign = "center";
        }

        {
          inherit (dateLabel) monitor;

          color = "rgb(${base04})";
          font_size = 160;
          halign = "center";
          position = "90, 320";
          text = ''
            cmd[update:1000] echo "<span>$(date +"%I:%M %P")</span>"
          '';
          valign = "center";
        }
      ];
    };
  };
}
