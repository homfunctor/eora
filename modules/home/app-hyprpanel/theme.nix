{config, ...}: let
  inherit (config.home.opts) hyprpanelFont;
  inherit (config.stylix) fonts;

  colors = config.lib.stylix.colors.withHashtag;

  accent = colors.base08;
  accent-alt = colors.base0B;
  background = colors.base00;
  background-alt = colors.base01;
  foreground = colors.base05;

  font = "${fonts.serif.name}";
in {
  programs.hyprpanel.settings.theme = {
    bar = {
      inherit background;

      border = {
        location = "none";
        width = "0.15em";
      };
      border_radius = "0px";

      buttons = {
        background = background-alt;
        background_hover_opacity = 100;
        background_opacity = 100;
      };

      buttons = {
        battery = {
          enableBorder = false;
          spacing = "0.5em";
        };

        bluetooth = {
          enableBorder = false;
          spacing = "0.5em";
        };

        border.radius = "0px";
        borderColor = accent;
        borderSize = "0.08em";

        clock = {
          enableBorder = false;
          spacing = "0.5em";
        };

        dashboard = {
          enableBorder = false;
          spacing = "0.5em";
        };

        enableBorders = true;
        hover = background;
        icon = accent;
        innerRadiusMultiplier = "0.0";

        media = {
          enableBorder = false;
          spacing = "0.5em";
        };

        modules = {
          cpu = {
            enableBorder = false;
            spacing = "0.5em";
          };

          cpuTemp = {
            enableBorder = false;
            spacing = "0.5em";
          };

          hypridle = {
            enableBorder = false;
            spacing = "0.45em";
          };

          hyprsunset = {
            enableBorder = false;
            spacing = "0.45em";
          };

          kbLayout = {
            enableBorder = false;
            spacing = "0.45em";
          };

          microphone = {
            enableBorder = false;
            spacing = "0.45em";
          };

          netstat = {
            enableBorder = false;
            spacing = "0.45em";
          };

          power = {
            enableBorder = false;
            spacing = "0.45em";
          };

          ram = {
            enableBorder = false;
            spacing = "0.45em";
          };

          storage = {
            enableBorder = false;
            spacing = "0.45em";
          };

          submap = {
            enableBorder = false;
            spacing = "0.45em";
          };

          updates = {
            enableBorder = false;
            spacing = "0.45em";
          };

          weather = {
            enableBorder = false;
            spacing = "0.45em";
          };
        };

        monochrome = true;

        network = {
          enableBorder = false;
          spacing = "0.5em";
        };

        notifications = {
          background = background-alt;
          enableBorder = false;
          hover = background;
          icon = accent;
          spacing = false;
          total = accent;
        };

        opacity = 100;

        padding_x = "0.8rem";
        padding_y = "0.4rem";

        radius = "0px";
        spacing = "0.25em";
        style = "default";

        systray = {
          enableBorder = false;
          spacing = "0.5em";
        };

        text = foreground;

        volume = {
          enableBorder = false;
          spacing = "0.5em";
        };

        windowtitle = {
          enableBorder = false;
          spacing = "0.5em";
        };

        workspaces = {
          enableBorder = false;
          fontSize = "1.2em";
          numbered_active_highlight_border = "0.2em";
          numbered_active_highlight_padding = "0.2em";
          numbered_inactive_padding = "0.2em";

          pill = {
            active_width = "12em";
            height = "4em";
            radius = "1.9rem * 0.6";
            width = "4em";
          };

          spacing = "0.5em";
          active = accent;
          available = accent-alt;
          hover = accent-alt;
          numbered_active_underline_color = accent-alt;
          occupied = accent-alt;
          smartHighlight = true;
        };
      };

      buttons.y_margins = "0.4em";

      dropdownGap = "4.5em";
      enableShadow = false;
      floating = false;
      label_spacing = "0.5em";
      layer = "top";
      location = "top";
      margin_bottom = "0em";
      margin_sides = "0.5em";
      margin_top = "0.5em";

      menus = {
        inherit background;

        border = {
          color = accent;
          radius = "0px";
          size = "0.1em";
        };

        buttons = {
          active = accent;
          default = accent;
          radius = "0.0em";
        };

        card_radius = "0px";
        cards = background-alt;
        check_radio_button.active = accent;

        dropdownmenu = {
          background = background-alt;
          text = foreground;
        };

        enableShadow = false;
        iconbuttons.active = accent;
        icons.active = accent;
        label = foreground;
        listitems.active = accent;

        menu = {
          battery.scaling = 100;
          bluetooth.scaling = 100;
          clock.scaling = 100;

          dashboard = {
            confirmation_scaling = 100;
            profile.radius = "0.4em";
            profile.size = "8.5em";
            scaling = 100;
          };

          media = {
            background.color = background-alt;
            card.color = background-alt;
            card.tint = 85;
            scaling = 100;
          };

          network.scaling = 100;

          notifications = {
            height = "58em";
            pager.show = true;
            scaling = 100;
            scrollradius = "0.2em";
            scrollwidth = "0.35em";
          };

          power = {
            radius = "0.4em";
            scaling = 90;
          };

          volume.scaling = 100;
        };

        monochrome = true;

        opacity = 100;

        popover = {
          background = background-alt;
          radius = "0px";
          scaling = 100;
          text = foreground;
        };

        progressforeground = accent;
        progressradius = "0.3rem";

        scroller = {
          radius = "0.5em";
          width = "0.25em";
        };

        shadow = "0px 0px 3px 1px ${background-alt}";
        shadowMargins = "5px 5px";

        slider = {
          primary = accent;
          progress_radius = "0.0rem";
          slider_radius = "0.0rem";
        };

        switch = {
          enabled = accent;
          radius = "0px";
          slider_radius = "0px";
        };

        text = foreground;

        tooltip = {
          background = background-alt;
          radius = "0px";
          text = foreground;
        };
      };

      opacity = 100;
      outer_spacing = "1.6em";
      scaling = 100;
      shadow = "0px 1px 2px 1px ${background-alt}";
      shadowMargins = "0px 0px 4px 0px";
      transparent = false;
    };

    font = {
      name = font;
      inherit (hyprpanelFont) size;
      inherit (hyprpanelFont) weight;
    };

    notifications = {
      actions = {
        background = accent;
        text = foreground;
      };

      background = background-alt;
      border = background-alt;
      border_radius = "0px";
      close_button.background = accent;
      label = accent;
      labelicon = accent;
      opacity = 100;
      scaling = 100;
      shadow = "0px 1px 2px 1px ${background-alt}";
      shadowMargins = "4px 4px";
      text = foreground;
    };

    osd = {
      active_monitor = true;
      bar_color = accent;
      bar_container = background-alt;
      bar_overflow_color = accent-alt;
      border.size = "0em";
      duration = 2500;
      enable = true;
      enableShadow = false;
      icon = background;
      icon_container = accent;
      label = accent;
      location = "right";
      margins = "0px 5px 0px 0px";
      monitor = 0;
      muted_zero = true;
      opacity = 100;
      orientation = "vertical";
      radius = "0px";
      scaling = 100;
      shadow = "0px 0px 3px 2px ${background-alt}";
    };
  };
}
