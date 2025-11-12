# unused values are commented out
{
  config,
  lib,
  ...
}: let
  colors = config.lib.stylix.colors.withHashtag;
in {
  # override stylix
  programs.hyprpanel.settings.theme = lib.mkForce {
    bar = with colors; {
      background = "${base00}";
      border.color = "${base01}";

      buttons = {
        # background = "${base02}";

        battery = {
          background = "${base00}";
          border = "${base0A}";
          icon = "${base08}";
          icon_background = "${base00}";
          text = "${base07}";
        };

        # bluetooth = {
        #   background = "${base02}";
        #   border = "${base0D}";
        #   icon = "${base0D}";
        #   icon_background = "${base0E}";
        #   text = "${base0D}";
        # };

        # borderColor = "${base07}";

        clock = {
          background = "${base00}";
          border = "${base0A}";
          icon = "${base08}";
          icon_background = "${base00}";
          text = "${base07}";
        };

        dashboard = {
          background = "${base00}";
          border = "${base07}";
          icon = "${base08}";
        };

        hover = "${base03}";
        icon = "${base07}";
        icon_background = "${base02}";

        media = {
          background = "${base00}";
          border = "${base0E}";
          icon = "${base08}";
          icon_background = "${base00}";
          text = "${base05}";
        };

        modules = {
          cava = {
            background = "${base00}";
            border = "${base06}";
            icon = "${base08}";
            icon_background = "${base00}";
            text = "${base08}";
          };

          cpu = {
            background = "${base00}";
            border = "${base0A}";
            icon = "${base08}";
            icon_background = "${base00}";
            text = "${base07}";
          };

          # hypridle = {
          #   background = "${base02}";
          #   border = "${base0F}";
          #   icon = "${base08}";
          #   icon_background = "${base08}";
          #   text = "${base08}";
          # };

          # hyprsunset = {
          #   background = "${base02}";
          #   border = "${base0A}";
          #   icon = "${base0A}";
          #   icon_background = "${base0A}";
          #   text = "${base0A}";
          # };

          # kbLayout = {
          #   background = "${base02}";
          #   border = "${base0D}";
          #   icon = "${base0D}";
          #   icon_background = "${base0D}";
          #   text = "${base0D}";
          # };

          microphone = {
            background = "${base00}";
            border = "${base0E}";
            icon = "${base0E}";
            icon_background = "${base00}";
            text = "${base07}";
          };

          # netstat = {
          #   background = "${base02}";
          #   border = "${base0B}";
          #   icon = "${base0B}";
          #   icon_background = "${base0B}";
          #   text = "${base0B}";
          # };

          power = {
            background = "${base00}";
            border = "${base0A}";
            icon = "${base0E}";
            icon_background = "${base00}";
          };

          ram = {
            background = "${base00}";
            border = "${base0A}";
            icon = "${base08}";
            icon_background = "${base00}";
            text = "${base07}";
          };

          # storage = {
          #   background = "${base02}";
          #   border = "${base0F}";
          #   icon = "${base08}";
          #   icon_background = "${base08}";
          #   text = "${base08}";
          # };

          # submap = {
          #   background = "${base02}";
          #   border = "${base0C}";
          #   icon = "${base0C}";
          #   icon_background = "${base02}";
          #   text = "${base0C}";
          # };

          # updates = {
          #   background = "${base02}";
          #   border = "${base0E}";
          #   icon = "${base0E}";
          #   icon_background = "${base0E}";
          #   text = "${base0E}";
          # };

          # weather = {
          #   background = "${base02}";
          #   border = "${base07}";
          #   icon = "${base07}";
          #   icon_background = "${base07}";
          #   text = "${base07}";
          # };

          # worldclock = {
          #   background = "${base02}";
          #   border = "${base07}";
          #   icon = "${base06}";
          #   icon_background = "${base06}";
          #   text = "${base08}";
          # };
        };

        # network = {
        #   background = "${base02}";
        #   border = "${base0E}";
        #   icon = "${base0E}";
        #   icon_background = "${base06}";
        #   text = "${base0E}";
        # };

        notifications = {
          background = "${base00}";
          border = "${base0E}";
          icon = "${base08}";
          icon_background = "${base00}";
          total = "${base05}";
        };

        style = "default";

        systray = {
          background = "${base00}";
          border = "${base0E}";
          # customIcon = "${base0E}";
        };

        # text = "${base07}";

        volume = {
          background = "${base00}";
          border = "${base0E}";
          icon = "${base08}";
          icon_background = "${base02}";
          text = "${base07}";
        };

        windowtitle = {
          background = "${base00}";
          border = "${base07}";
          icon = "${base08}";
          icon_background = "${base02}";
          text = "${base08}";
        };

        workspaces = {
          active = "${base0E}";
          available = "${base04}";
          background = "${base00}";
          border = "${base07}";
          hover = "${base01}";
          numbered_active_highlighted_text_color = "${base04}";
          numbered_active_underline_color = "${base0F}";
          occupied = "${base07}";
        };
      };

      menus = {
        background = "${base00}";
        # border.color = "${base02}";

        buttons = {
          active = "${base06}";
          default = "${base07}";
          disabled = "${base02}";
          text = "${base05}";
        };

        cards = "${base00}";

        check_radio_button = {
          active = "${base06}";
          background = "${base00}";
        };

        dimtext = "${base04}";

        dropdownmenu = {
          background = "${base00}";
          divider = "${base0A}";
          text = "${base07}";
        };

        feinttext = "${base06}";

        iconbuttons = {
          active = "${base03}";
          passive = "${base05}";
        };

        icons = {
          active = "${base03}";
          passive = "${base05}";
        };

        label = "${base07}";

        listitems = {
          active = "${base07}";
          passive = "${base05}";
        };

        menu = {
          battery = {
            background.color = "${base00}";
            border.color = "${base08}";
            card.color = "${base01}";

            icons = {
              active = "${base0A}";
              passive = "${base04}";
            };

            label.color = "${base07}";

            listitems = {
              active = "${base06}";
              passive = "${base04}";
            };

            slider = {
              background = "${base00}";
              backgroundhover = "${base02}";
              primary = "${base08}";
              puck = "${base07}";
            };

            text = "${base07}";
          };

          # bluetooth = {
          #   background.color = "${base02}";
          #   border.color = "${base02}";
          #   card.color = "${base01}";
          #
          #   iconbutton = {
          #     active = "${base0D}";
          #     passive = "${base0A}";
          #   };
          #
          #   icons = {
          #     active = "${base0D}";
          #     passive = "${base04}";
          #   };
          #
          #   label.color = "${base0D}";
          #
          #   listitems = {
          #     active = "${base0D}";
          #     passive = "${base05}";
          #   };
          #
          #   scroller.color = "${base0D}";
          #   status = "${base03}";
          #
          #   switch = {
          #     disabled = "${base02}";
          #     enabled = "${base0D}";
          #     puck = "${base03}";
          #   };
          #
          #   switch_divider = "${base03}";
          #   text = "${base08}";
          # };

          clock = {
            background.color = "${base00}";
            border.color = "${base08}";

            calendar = {
              contextdays = "${base07}";
              currentday = "${base08}";
              days = "${base06}";
              paginator = "${base0C}";
              weekdays = "${base05}";
              yearmonth = "${base0B}";
            };

            card.color = "${base01}";
            text = "${base05}";

            time = {
              time = "${base05}";
              timeperiod = "${base0C}";
            };

            # weather = {
            #   hourly = {
            #     icon = "${base06}";
            #     temperature = "${base06}";
            #     time = "${base06}";
            #   };
            #
            #   icon = "${base06}";
            #   stats = "${base06}";
            #   status = "${base0C}";
            #   temperature = "${base05}";
            #
            #   thermometer = {
            #     cold = "${base05}";
            #     extremelycold = "${base0D}";
            #     extremelyhot = "${base08}";
            #     hot = "${base09}";
            #     moderate = "${base07}";
            #   };
            # };
          };

          dashboard = {
            background.color = "${base00}";
            border.color = "${base07}";
            card.color = "${base01}";

            controls = {
              # bluetooth = {
              #   background = "${base00}";
              #   text = "${base02}";
              # };

              disabled = "${base02}";

              input = {
                background = "${base00}";
                text = "${base05}";
              };

              notifications = {
                background = "${base00}";
                text = "${base07}";
              };

              volume = {
                background = "${base00}";
                text = "${base08}";
              };

              # wifi = {
              #   background = "${base00}";
              #   text = "${base02}";
              # };
            };

            directories = {
              left = {
                bottom.color = "${base07}";
                middle.color = "${base0A}";
                top.color = "${base06}";
              };

              right = {
                bottom.color = "${base05}";
                middle.color = "${base0E}";
                top.color = "${base06}";
              };
            };

            # monitors = {
            #   bar_background = "${base00}";
            #
            #   cpu = {
            #     bar = "${base07}";
            #     icon = "${base07}";
            #     label = "${base07}";
            #   };
            #
            #   disk = {
            #     bar = "${base06}";
            #     icon = "${base06}";
            #     label = "${base06}";
            #   };
            #
            #   gpu = {
            #     bar = "${base0B}";
            #     icon = "${base0B}";
            #     label = "${base0B}";
            #   };
            #
            #   ram = {
            #     bar = "${base0A}";
            #     icon = "${base0A}";
            #     label = "${base0A}";
            #   };
            # };

            powermenu = {
              # confirmation = {
              #   background = "${base00}";
              #   body = "${base05}";
              #   border = "${base02}";
              #   button_text = "${base02}";
              #   card = "${base01}";
              #   confirm = "${base0B}";
              #   deny = "${base08}";
              #   label = "${base07}";
              # };

              logout = "${base03}";
              restart = "${base03}";
              shutdown = "${base03}";
              sleep = "${base03}";
            };

            profile.name = "${base08}";

            shortcuts = {
              background = "${base00}";
              recording = "${base01}";
              text = "${base08}";
            };
          };

          media = {
            album = "${base04}";
            artist = "${base05}";
            background.color = "${base00}";
            border.color = "${base0B}";

            buttons = {
              background = "${base00}";
              enabled = "${base03}";
              inactive = "${base00}";
              text = "${base04}";
            };

            card.color = "${base00}";

            slider = {
              background = "${base00}";
              backgroundhover = "${base03}";
              primary = "${base05}";
              puck = "${base04}";
            };

            song = "${base07}";
            timestamp = "${base05}";
          };

          # network = {
          #   background.color = "${base02}";
          #   border.color = "${base02}";
          #   card.color = "${base01}";
          #
          #   iconbuttons = {
          #     active = "${base0E}";
          #     passive = "${base05}";
          #   };
          #
          #   icons = {
          #     active = "${base0E}";
          #     passive = "${base04}";
          #   };
          #
          #   label.color = "${base0E}";
          #
          #   listitems = {
          #     active = "${base0E}";
          #     passive = "${base05}";
          #   };
          #
          #   scroller.color = "${base0E}";
          #   status.color = "${base03}";
          #
          #   switch = {
          #     disabled = "${base02}";
          #     enabled = "${base0E}";
          #     puck = "${base03}";
          #   };
          #
          #   text = "${base08}";
          # };

          notifications = {
            background = "${base00}";
            border = "${base09}";
            card = "${base01}";
            clear = "${base08}";
            label = "${base07}";
            no_notifications_label = "${base04}";

            pager = {
              background = "${base03}";
              button = "${base07}";
              label = "${base05}";
            };

            scrollbar.color = "${base07}";

            switch = {
              disabled = "${base02}";
              enabled = "${base07}";
              puck = "${base04}";
            };

            switch_divider = "${base05}";
          };

          power = {
            background.color = "${base01}";
            border.color = "${base0E}";

            buttons = {
              logout = {
                background = "${base00}";
                icon = "${base04}";
                icon_background = "${base00}";
                text = "${base08}";
              };

              restart = {
                background = "${base00}";
                icon = "${base06}";
                icon_background = "${base00}";
                text = "${base08}";
              };

              shutdown = {
                background = "${base00}";
                icon = "${base04}";
                icon_background = "${base00}";
                text = "${base08}";
              };

              sleep = {
                background = "${base00}";
                icon = "${base04}";
                icon_background = "${base00}";
                text = "${base08}";
              };
            };
          };

          systray.dropdownmenu = {
            background = "${base00}";
            divider = "${base03}";
            text = "${base08}";
          };

          volume = {
            audio_slider = {
              background = "${base00}";
              backgroundhover = "${base03}";
              primary = "${base07}";
              puck = "${base04}";
            };

            background.color = "${base02}";
            border.color = "${base02}";
            card.color = "${base01}";

            iconbutton = {
              active = "${base08}";
              passive = "${base04}";
            };

            icons = {
              active = "${base08}";
              passive = "${base04}";
            };

            input_slider = {
              background = "${base00}";
              backgroundhover = "${base03}";
              primary = "${base07}";
              puck = "${base04}";
            };

            label.color = "${base07}";

            listitems = {
              active = "${base07}";
              passive = "${base04}";
            };

            text = "${base08}";
          };
        };

        popover = {
          background = "${base00}";
          border = "${base0A}";
          text = "${base07}";
        };

        progressbar = {
          background = "${base00}";
          foreground = "${base08}";
        };

        slider = {
          background = "${base00}";
          backgroundhover = "${base03}";
          primary = "${base07}";
          puck = "${base09}";
        };

        switch = {
          disabled = "${base02}";
          enabled = "${base07}";
          puck = "${base03}";
        };

        text = "${base08}";

        tooltip = {
          background = "${base00}";
          text = "${base08}";
        };
      };
    };

    notification = with colors; {
      actions = {
        background = "${base00}";
        text = "${base04}";
      };

      background = "${base02}";
      border = "${base06}";

      close_button = {
        background = "${base00}";
        label = "${base04}";
      };

      label = "${base05}";
      labelicon = "${base03}";
      text = "${base08}";
      time = "${base0D}";
    };

    osd = with colors; {
      bar_color = "${base07}";
      bar_container = "${base02}";
      bar_empty_color = "${base02}";
      bar_overflow_color = "${base07}";
      icon = "${base08}";
      icon_container = "${base07}";
      label = "${base07}";
    };
  };
}
