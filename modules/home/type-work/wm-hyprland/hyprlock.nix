{
  config,
  inputs,
  lib,
  osConfig,
  ...
}: let
  inherit (config.lib.stylix) colors;
  inherit
    (osConfig.nixos.opts.hyprlockOpts)
    clockLabel
    dateLabel
    inputLabel
    ;

  bg = "${inputs.sapadal}/assets/base.png";
in {
  # force manual theming
  stylix.targets.hyprlock.enable = lib.mkForce false;

  programs.hyprlock = {
    enable = true;

    sourceFirst = true;
    settings = {
      background = [
        {
          monitor = "";
          path = bg;
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
          dots_spacing = 0.2;
          dots_center = true;
          dots_rounding = -1;
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
          placeholder_text = "<i>🔐input password</i>";
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
          text = ''
            cmd[update:1000] echo -e "$(date +"%A, %B %d")"
          '';
          color = "rgb(${base04})";
          font_size = 28;
          position = "90, 450";
          halign = "center";
          valign = "center";
        }

        {
          inherit (dateLabel) monitor;
          text = ''
            cmd[update:1000] echo "<span>$(date +"%I:%M %P")</span>"
          '';
          color = "rgb(${base04})";
          font_size = 160;
          position = "90, 320";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
