{config, ...}: let
  inherit (config.home.opts) hplFontSize hplScale;
  fontName = config.stylix.fonts.sansSerif.name;
in {
  programs.hyprpanel.settings.theme = {
    bar = {
      border_radius = "0em";
      dropdownGap = "2.0em";
      label_spacing = "0.50em";
      opacity = 100;
      outer_spacing = "0.0em";
      scaling = hplScale.bar;

      buttons = {
        enableBorders = true;
        innerRadiusMultiplier = "0.0";
        padding_x = "0.5rem";
        padding_y = "0.1rem";
        radius = "0.0em";

        workspaces = {
          fontSize = hplFontSize;
          smartHighlight = true;
          spacing = "0.0em";
        };

        y_margins = "0.0em";
      };

      menus = {
        border = {
          radius = "0em";
          size = "0.1em";
        };

        buttons.radius = "0.0em";
        card_radius = "0em";

        menu = {
          battery.scaling = hplScale.battery;
          clock.scaling = hplScale.clock;

          dashboard = {
            profile = {
              radius = "0em";
              size = "8.5em";
            };

            scaling = hplScale.dashboard;
          };

          media = {
            card.tint = 85;
            scaling = hplScale.media;
          };

          notifications = {
            height = "80em";
            pager.show = true;
            radius = "0em";
            scaling = hplScale.notifications;
            scrollradius = "0em";
            scrollwidth = "0.2em";
          };

          power = {
            radius = "0em";
            scaling = hplScale.power;
          };

          volume = {
            radius = "0em";
            scaling = hplScale.volume;
          };
        };

        popover = {
          radius = "0em";
          scaling = hplScale.popover;
        };

        progress.radius = "0rem";

        scroller = {
          radius = "0em";
          width = "0.25em";
        };

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
      size = hplFontSize;
      weight = "400";
    };

    notification = {
      border_radius = "0em";
      opacity = 100;
      scaling = hplScale.notification;
    };

    osd = {
      border.size = "0em";
      margins = "0px 0px 0px 0px";
      radius = "0em";
      scaling = hplScale.osd;
    };
  };
}
