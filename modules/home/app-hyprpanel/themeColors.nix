# todo: adjust colors
{config, ...}: let
  colors = config.lib.stylix.colors.withHashtag;
in {
  programs.hyprpanel.settings.theme = with colors; {
    bar = {
      background = "${base00}";
      border.color = "${base07}";

      buttons = {
        background = "${base02}";

        battery = {
          background = "${base02}";
          border = "${base0A}";
          icon = "${base0A}";
          icon_background = "${base0A}";
          text = "${base0A}";
        };

        bluetooth = {
          background = "${base02}";
          border = "${base0D}";
          icon = "${base0D}";
          icon_background = "${base0E}";
          text = "${base0D}";
        };

        borderColor = "${base07}";

        clock = {
          background = "${base02}";
          border = "${base0E}";
          icon = "${base06}";
          icon_background = "${base06}";
          text = "${base08}";
        };

        dashboard = {
          background = "${base02}";
          border = "${base0A}";
          icon = "${base0A}";
        };

        hover = "${base03}";
        icon = "${base07}";
        icon_background = "${base02}";

        media = {
          background = "${base03}";
          border = "${base0E}";
          icon = "${base07}";
          icon_background = "${base07}";
          text = "${base08}";
        };

        modules = {
          cava = {
            background = "${base02}";
            border = "${base0C}";
            icon = "${base07}";
            icon_background = "${base02}";
            text = "${base08}";
          };

          cpu = {
            background = "${base02}";
            border = "${base0F}";
            icon = "${base08}";
            icon_background = "${base08}";
            text = "${base08}";
          };

          hypridle = {
            background = "${base02}";
            border = "${base0F}";
            icon = "${base08}";
            icon_background = "${base08}";
            text = "${base08}";
          };

          hyprsunset = {
            background = "${base02}";
            border = "${base0A}";
            icon = "${base0A}";
            icon_background = "${base0A}";
            text = "${base0A}";
          };

          kbLayout = {
            background = "${base02}";
            border = "${base0D}";
            icon = "${base0D}";
            icon_background = "${base0D}";
            text = "${base0D}";
          };

          microphone = {
            background = "${base02}";
            border = "${base0B}";
            icon = "${base0B}";
            icon_background = "${base02}";
            text = "${base0B}";
          };

          netstat = {
            background = "${base02}";
            border = "${base0B}";
            icon = "${base0B}";
            icon_background = "${base0B}";
            text = "${base0B}";
          };

          power = {
            background = "${base02}";
            border = "${base0F}";
            icon = "${base08}";
            icon_background = "${base08}";
          };

          ram = {
            background = "${base02}";
            border = "${base0A}";
            icon = "${base0A}";
            icon_background = "${base0A}";
            text = "${base0A}";
          };

          storage = {
            background = "${base02}";
            border = "${base0F}";
            icon = "${base08}";
            icon_background = "${base08}";
            text = "${base08}";
          };

          submap = {
            background = "${base02}";
            border = "${base0C}";
            icon = "${base0C}";
            icon_background = "${base02}";
            text = "${base0C}";
          };

          updates = {
            background = "${base02}";
            border = "${base0E}";
            icon = "${base0E}";
            icon_background = "${base0E}";
            text = "${base0E}";
          };

          weather = {
            background = "${base02}";
            border = "${base07}";
            icon = "${base07}";
            icon_background = "${base07}";
            text = "${base07}";
          };

          worldclock = {
            background = "${base02}";
            border = "${base06}";
            icon = "${base06}";
            icon_background = "${base06}";
            text = "${base08}";
          };
        };

        network = {
          background = "${base02}";
          border = "${base0E}";
          icon = "${base0E}";
          icon_background = "${base06}";
          text = "${base0E}";
        };

        notifications = {
          background = "${base02}";
          border = "${base07}";
          icon = "${base07}";
          icon_background = "${base07}";
          total = "${base07}";
        };

        style = "default";

        systray = {
          background = "${base02}";
          border = "${base03}";
          customIcon = "${base05}";
        };

        text = "${base07}";

        volume = {
          background = "${base02}";
          border = "${base07}";
          icon = "${base07}";
          icon_background = "${base07}";
          text = "${base07}";
        };

        windowtitle = {
          background = "${base02}";
          border = "${base06}";
          icon = "${base06}";
          icon_background = "${base06}";
          text = "${base06}";
        };

        workspaces = {
          active = "${base06}";
          available = "${base0D}";
          background = "${base02}";
          border = "${base02}";
          hover = "${base03}";
          numbered_active_highlighted_text_color = "${base01}";
          numbered_active_underline_color = "${base0A}";
          occupied = "${base0F}";
        };
      };

      menus = {
        background = "${base02}";
        border.color = "${base02}";

        buttons = {
          active = "${base06}";
          default = "${base07}";
          disabled = "${base04}";
          text = "${base02}";
        };

        cards = "${base01}";

        check_radio_button = {
          active = "${base08}";
          background = "${base01}";
        };

        dimtext = "${base04}";

        dropdownmenu = {
          background = "${base02}";
          divider = "${base01}";
          text = "${base08}";
        };

        feinttext = "${base02}";

        iconbuttons = {
          active = "${base07}";
          passive = "${base05}";
        };

        icons = {
          active = "${base07}";
          passive = "${base04}";
        };

        label = "${base07}";

        listitems = {
          active = "${base07}";
          passive = "${base05}";
        };

        menu = {
          battery = {
            background.color = "${base02}";
            border.color = "${base02}";
            card.color = "${base01}";

            icons = {
              active = "${base0A}";
              passive = "${base04}";
            };

            label.color = "${base0A}";

            listitems = {
              active = "${base0A}";
              passive = "${base05}";
            };

            slider = {
              background = "${base04}";
              backgroundhover = "${base03}";
              primary = "${base0A}";
              puck = "${base03}";
            };

            text = "${base08}";
          };
          bluetooth = {
            background.color = "${base02}";
            border.color = "${base02}";
            card.color = "${base01}";

            iconbutton = {
              active = "${base0D}";
              passive = "${base0A}";
            };

            icons = {
              active = "${base0D}";
              passive = "${base04}";
            };

            label.color = "${base0D}";

            listitems = {
              active = "${base0D}";
              passive = "${base05}";
            };

            scroller.color = "${base0D}";
            status = "${base03}";

            switch = {
              disabled = "${base02}";
              enabled = "${base0D}";
              puck = "${base03}";
            };

            switch_divider = "${base03}";
            text = "${base08}";
          };

          clock = {
            background.color = "${base02}";
            border.color = "${base02}";

            calendar = {
              contextdays = "${base04}";
              currentday = "${base06}";
              days = "${base05}";
              paginator = "${base06}";
              weekdays = "${base06}";
              yearmonth = "${base0C}";
            };

            card.color = "${base01}";
            text = "${base08}";

            time = {
              time = "${base08}";
              timeperiod = "${base0C}";
            };

            weather = {
              hourly = {
                icon = "${base06}";
                temperature = "${base06}";
                time = "${base06}";
              };

              icon = "${base06}";
              stats = "${base06}";
              status = "${base0C}";
              temperature = "${base05}";

              thermometer = {
                cold = "${base05}";
                extremelycold = "${base0D}";
                extremelyhot = "${base08}";
                hot = "${base09}";
                moderate = "${base07}";
              };
            };
          };

          dashboard = {
            background.color = "${base02}";
            border.color = "${base02}";
            card.color = "${base01}";

            controls = {
              bluetooth = {
                background = "${base0D}";
                text = "${base02}";
              };

              disabled = "${base04}";

              input = {
                background = "${base06}";
                text = "${base02}";
              };

              notifications = {
                background = "${base0A}";
                text = "${base02}";
              };

              volume = {
                background = "${base07}";
                text = "${base02}";
              };

              wifi = {
                background = "${base0E}";
                text = "${base02}";
              };
            };

            directories = {
              left = {
                bottom.color = "${base07}";
                middle.color = "${base0A}";
                top.color = "${base06}";
              };

              right = {
                bottom.color = "${base07}";
                middle.color = "${base0E}";
                top.color = "${base0C}";
              };
            };

            monitors = {
              bar_background = "${base03}";

              cpu = {
                bar = "${base07}";
                icon = "${base07}";
                label = "${base07}";
              };

              disk = {
                bar = "${base06}";
                icon = "${base06}";
                label = "${base06}";
              };

              gpu = {
                bar = "${base0B}";
                icon = "${base0B}";
                label = "${base0B}";
              };

              ram = {
                bar = "${base0A}";
                icon = "${base0A}";
                label = "${base0A}";
              };
            };

            powermenu = {
              confirmation = {
                background = "${base02}";
                body = "${base05}";
                border = "${base02}";
                button_text = "${base02}";
                card = "${base01}";
                confirm = "${base0B}";
                deny = "${base08}";
                label = "${base07}";
              };

              logout = "${base0B}";
              restart = "${base09}";
              shutdown = "${base08}";
              sleep = "${base0D}";
            };

            profile.name = "${base06}";

            shortcuts = {
              background = "${base07}";
              recording = "${base0B}";
              text = "${base02}";
            };
          };

          media = {
            album = "${base06}";
            artist = "${base0C}";
            background.color = "${base02}";
            border.color = "${base02}";

            buttons = {
              background = "${base07}";
              enabled = "${base0C}";
              inactive = "${base04}";
              text = "${base02}";
            };

            card.color = "${base01}";

            slider = {
              background = "${base04}";
              backgroundhover = "${base03}";
              primary = "${base06}";
              puck = "${base03}";
            };

            song = "${base07}";
            timestamp = "${base05}";
          };

          network = {
            background.color = "${base02}";
            border.color = "${base02}";
            card.color = "${base01}";

            iconbuttons = {
              active = "${base0E}";
              passive = "${base05}";
            };

            icons = {
              active = "${base0E}";
              passive = "${base04}";
            };

            label.color = "${base0E}";

            listitems = {
              active = "${base0E}";
              passive = "${base05}";
            };

            scroller.color = "${base0E}";
            status.color = "${base03}";

            switch = {
              disabled = "${base02}";
              enabled = "${base0E}";
              puck = "${base03}";
            };

            text = "${base08}";
          };

          notifications = {
            background = "${base02}";
            border = "${base02}";
            card = "${base01}";
            clear = "${base08}";
            label = "${base07}";
            no_notifications_label = "${base02}";

            pager = {
              background = "${base02}";
              button = "${base07}";
              label = "${base04}";
            };

            scrollbar.color = "${base07}";

            switch = {
              disabled = "${base02}";
              enabled = "${base07}";
              puck = "${base03}";
            };

            switch_divider = "${base03}";
          };

          power = {
            background.color = "${base02}";
            border.color = "${base02}";

            buttons = {
              logout = {
                background = "${base01}";
                icon = "${base02}";
                icon_background = "${base0B}";
                text = "${base0B}";
              };

              restart = {
                background = "${base01}";
                icon = "${base02}";
                icon_background = "${base09}";
                text = "${base09}";
              };

              shutdown = {
                background = "${base01}";
                icon = "${base02}";
                icon_background = "${base08}";
                text = "${base08}";
              };

              sleep = {
                background = "${base01}";
                icon = "${base02}";
                icon_background = "${base0D}";
                text = "${base0D}";
              };
            };
          };

          systray.dropdownmenu = {
            background = "${base02}";
            divider = "${base01}";
            text = "${base08}";
          };

          volume = {
            audio_slider = {
              background = "${base04}";
              backgroundhover = "${base03}";
              primary = "${base07}";
              puck = "${base04}";
            };

            background.color = "${base02}";
            border.color = "${base02}";
            card.color = "${base01}";

            iconbutton = {
              active = "${base07}";
              passive = "${base05}";
            };

            icons = {
              active = "${base07}";
              passive = "${base04}";
            };

            input_slider = {
              background = "${base04}";
              backgroundhover = "${base03}";
              primary = "${base07}";
              puck = "${base04}";
            };

            label.color = "${base07}";

            listitems = {
              active = "${base07}";
              passive = "${base05}";
            };

            text = "${base08}";
          };
        };

        popover = {
          background = "${base02}";
          border = "${base02}";
          text = "${base07}";
        };

        progressbar = {
          background = "${base03}";
          foreground = "${base07}";
        };

        slider = {
          background = "${base04}";
          backgroundhover = "${base03}";
          primary = "${base07}";
          puck = "${base03}";
        };

        switch = {
          disabled = "${base02}";
          enabled = "${base07}";
          puck = "${base03}";
        };

        text = "${base08}";

        tooltip = {
          background = "${base02}";
          text = "${base08}";
        };
      };
    };

    notification = {
      actions = {
        background = "${base07}";
        text = "${base02}";
      };

      background = "${base02}";
      border = "${base02}";

      close_button = {
        background = "${base08}";
        label = "${base02}";
      };

      label = "${base07}";
      labelicon = "${base07}";
      text = "${base08}";
      time = "${base0D}";
    };

    osd = {
      bar_color = "${base07}";
      bar_container = "${base02}";
      bar_empty_color = "${base02}";
      bar_overflow_color = "${base08}";
      icon = "${base02}";
      icon_container = "${base07}";
      label = "${base07}";
    };
  };
}
