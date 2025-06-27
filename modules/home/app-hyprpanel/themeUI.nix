{config, ...}: let
  colors = config.lib.stylix.colors.withHashtag;
  fontName = config.stylix.fonts.serif.name;
in {
  programs.hyprpanel.settings.theme = {
    bar = {
      border.location = "none";
      border_radius = "0em";
      dropdownGap = "4.5em";
      enableShadow = false;
      floating = false;
      label_spacing = "0.0em";
      layer = "top";
      location = "top";
      opacity = 100;
      outer_spacing = "0.2em";
      scaling = 100;
      shadow = "0px 1px 2px 1px ${colors.base02}";
      shadowMargins = "0px 0px 4px 0px";
      transparent = false;

      buttons = {
        background_hover_opacity = 100;
        background_opacity = 100;
        padding_x = "0.7rem";
        padding_y = "0.2rem";
        radius = "0.0em";
        spacing = "0.25em";
        style = "default";

        battery = {
          enableBorder = true;
          spacing = "0.5em";
        };

        bluetooth = {
          enableBorder = true;
          spacing = "0.5em";
        };

        borderSize = "0.08em";

        clock = {
          enableBorder = true;
          spacing = "0.5em";
        };

        dashboard = {
          enableBorder = true;
          spacing = "0.5em";
        };

        enableBorders = true;
        innerRadiusMultiplier = "0.0";

        media = {
          enableBorder = true;
          spacing = "0.5em";
        };

        modules = {
          cpu = {
            enableBorder = true;
            spacing = "0.5em";
          };

          cpuTemp = {
            enableBorder = true;
            spacing = "0.5em";
          };

          hypridle = {
            enableBorder = true;
            spacing = "0.5em";
          };

          kbLayout = {
            enableBorder = true;
            spacing = "0.5em";
          };

          microphone = {
            enableBorder = true;
            spacing = "0.5em";
          };

          power = {
            enableBorder = true;
            spacing = "0.5em";
          };

          ram = {
            enableBorder = true;
            spacing = "0.5em";
          };

          storage = {
            enableBorder = true;
            spacing = "0.5em";
          };

          submap = {
            enableBorder = true;
            spacing = "0.5em";
          };
        };

        network = {
          enableBorder = true;
          spacing = "0.5em";
        };

        notifications = {
          enableBorder = true;
          spacing = "0.5em";
        };

        systray = {
          enableBorder = true;
          spacing = "0.5em";
        };

        volume = {
          enableBorder = true;
          spacing = "0.5em";
        };

        windowtitle = {
          enableBorder = true;
          spacing = "0.5em";
        };

        workspaces = {
          enableBorder = true;
          fontSize = "1.0rem";
          numbered_active_highlight_border = "0.2em";
          numbered_active_highlight_padding = "0.2em";
          numbered_inactive_padding = "0.2em";

          pill = {
            active_width = "12em";
            height = "4em";
            radius = "0em";
            width = "4em";
          };

          smartHighlight = true;
          spacing = "0.5em";
        };

        y_margins = "0.4em";
      };

      menus = {
        border = {
          radius = "0em";
          size = "0.1em";
        };

        buttons.radius = "0.0em";
        card_radius = "0em";
        enableShadow = false;
        opacity = 100;

        menu = {
          battery.scaling = 100;
          bluetooth.scaling = 100;
          clock.scaling = 100;

          dashboard = {
            confirmation_scaling = 100;

            profile = {
              radius = "0em";
              size = "8.5em";
            };

            scaling = 100;
          };

          media = {
            card.tint = 85;
            scaling = 100;
          };

          network.scaling = 100;

          notifications = {
            height = "58em";
            pager.show = true;
            radius = "0em";
            scaling = 100;
            scrollradius = "0em";
            scrollwidth = "0.35em";
          };

          power = {
            radius = "0em";
            scaling = 100;
          };

          volume.scaling = 100;
        };

        popover = {
          radius = "0em";
          scaling = 100;
        };

        progressradius = "0rem";

        scroller = {
          radius = "0em";
          width = "0.25em";
        };

        shadowMargins = "5px 5px";

        slider = {
          progress_radius = "0.0rem";
          slider_radius = "0.0rem";
        };

        switch = {
          radius = "0em";
          slider_radius = "0em";
        };

        tooltip.radius = "0em";
      };
    };

    font = {
      name = fontName;
      size = "1.0rem";
      weight = "400";
    };

    notification = {
      border_radius = "0em";
      opacity = 100;
      scaling = 100;
      shadow = "0px 1px 2px 1px ${colors.base02}";
      shadowMargins = "4px 4px";
    };

    osd = {
      active_monitor = true;
      border.size = "0em";
      duration = 2500;
      enable = true;
      enableShadow = false;
      location = "right";
      margins = "0px 5px 0px 0px";
      monitor = 0;
      muted_zero = true;
      opacity = 100;
      orientation = "vertical";
      radius = "0em";
      scaling = 100;
      shadow = "0px 0px 3px 2px ${colors.base02}";
    };
  };
}
