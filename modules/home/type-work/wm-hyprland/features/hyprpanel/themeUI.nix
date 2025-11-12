{
  config,
  lib,
  ...
}: let
  inherit (config.home.opts) panelOpts;
  fontName = config.stylix.fonts.sansSerif.name;
in {
  # override stylix for now
  programs.hyprpanel.settings.theme = lib.mkForce {
    bar = {
      border_radius = "0em";
      dropdownGap = "2.1em";
      label_spacing = "0.0em";
      opacity = 100;
      outer_spacing = "0.0em";
      scaling = panelOpts.scale.bar;

      buttons = {
        enableBorders = true;
        innerRadiusMultiplier = "0.0";
        padding_x = "0.5rem";
        padding_y = "0.1rem";
        radius = "0.0em";

        workspaces = {
          inherit (panelOpts) fontSize;
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
          battery.scaling = panelOpts.scale.battery;
          clock.scaling = panelOpts.scale.clock;

          dashboard = {
            profile = {
              radius = "0em";
              size = "8.5em";
            };

            scaling = panelOpts.scale.dashboard;
          };

          media = {
            card.tint = 85;
            scaling = panelOpts.scale.media;
          };

          notifications = {
            height = "80em";
            pager.show = true;
            radius = "0em";
            scaling = panelOpts.scale.notifications;
            scrollradius = "0em";
            scrollwidth = "0.2em";
          };

          power = {
            radius = "0em";
            scaling = panelOpts.scale.power;
          };

          volume = {
            radius = "0em";
            scaling = panelOpts.scale.volume;
          };
        };

        popover = {
          radius = "0em";
          scaling = panelOpts.scale.popover;
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
      size = panelOpts.fontSize;
      weight = "400";
    };

    notification = {
      border_radius = "0em";
      opacity = 100;
      scaling = panelOpts.scale.notification;
    };

    osd = {
      border.size = "0em";
      margins = "0px 0px 0px 0px";
      radius = "0em";
      scaling = panelOpts.scale.osd;
    };
  };
}
