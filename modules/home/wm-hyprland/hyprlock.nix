# hyprlock settings
# todo: make per-monitor setup for revelations:
#   [blank screen] [lock screen] [blank screen]
{
  config,
  inputs,
  lib,
  perSystem,
  ...
}: let
  inherit (lib) mkForce;
  inherit (config.lib.stylix) colors;
  hyprlockPkg = perSystem.hyprlock.hyprlock;
  bg = "${inputs.sapadal}/assets/base.png";
in {
  stylix.targets.hyprlock.enable = mkForce false;

  programs.hyprlock = {
    enable = true;
    package = hyprlockPkg;

    sourceFirst = true;
    settings = {
      background = [
        {
          monitor = "";
          path = "${bg}";
        }
      ];

      general = {
        disable_loading_bar = true;
        grace = 2;
        hide_cursor = true;
      };

      input-field = with colors; [
        {
          capslock_color = -1;
          dots_spacing = 0.2;
          dots_center = true;
          dots_rounding = -1;
          fade_on_empty = true;
          fade_timeout = 1000;
          fail_transition = 300;
          font_color = "rgb(${base0D})";
          halign = "center";
          hide_input = false;
          inner_color = "rgb(${base00})";
          invert_numlock = false;
          outer_color = "rgb(${base09})";
          outline_thickness = 5;
          placeholder_text = "<i>🔐input password</i>";
          position = "0, -400";
          rounding = 0;
          size = "300, 60";
          swap_font_color = false;
          valign = "center";
        }
      ];

      label = with colors; [
        {
          monitor = "";
          text = ''
            cmd[update:1000] echo -e "$(date +"%A, %B %d")"
          '';
          color = "rgb(${base0D})";
          font_size = 28;
          position = "90, 490";
          halign = "center";
          valign = "center";
        }

        {
          monitor = "";
          text = ''
            cmd[update:1000] echo "<span>$(date +"%I:%M %P")</span>"
          '';
          color = "rgb(${base0D})";
          font_size = 160;
          position = "90, 370";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
