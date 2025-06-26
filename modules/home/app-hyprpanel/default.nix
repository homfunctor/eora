# todo: symbols seem too small
{
  config,
  flake,
  pkgs,
  ...
}: let
  inherit (config.home.opts) hyprpanelLayout;
in {
  imports = [
    ./themeColors.nix
    ./themeUI.nix
  ];

  programs.hyprpanel = {
    enable = true;
    package = pkgs.hyprpanel;

    settings = {
      bar = {
        autoHide = "never";
        layouts = hyprpanelLayout;

        battery = {
          hideLabelWhenFull = false;
          label = false;
          middleClick = "";
          rightClick = "";
          scrollDown = "";
          scrollUp = "";
        };

        bluetooth = {
          label = false;
          middleClick = "";
          rightClick = "";
          scrollDown = "";
          scrollUp = "";
        };

        clock = {
          format = "%a %b %d  %I:%M %p";
          icon = "󰸗";
          middleClick = "";
          rightClick = "";
          scrollDown = "";
          scrollUp = "";
          showIcon = true;
          showTime = true;
        };

        customModules = {
          cava = {
            autoSensitivity = true;
            barCharacters = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
            bars = 10;
            channels = 2;
            framerate = 60;
            highCutoff = 10000;
            icon = "";
            leftClick = "";
            lowCutoff = 50;
            middleClick = "";
            noiseReduction = 0.77;
            rightClick = "";
            samplerate = 44100;
            scrollDown = "";
            scrollUp = "";
            showActiveOnly = false;
            showIcon = true;
            spaceCharacter = " ";
            stereo = false;
          };

          cpu = {
            icon = "";
            label = true;
            leftClick = "";
            middleClick = "";
            pollingInterval = 2000;
            rightClick = "";
            round = true;
            scrollDown = "";
            scrollUp = "";
          };

          cpuTemp = {
            icon = "";
            label = true;
            leftClick = "";
            middleClick = "";
            pollingInterval = 2000;
            rightClick = "";
            round = true;
            scrollDown = "";
            scrollUp = "";
            sensor =
              ''/sys/devices/pci0000:00/0000:00:18.3/''
              + ''hwmon/hwmon3/temp1_input'';
            showUnit = true;
            unit = "metric";
          };

          hypridle = {
            label = true;
            middleClick = "";
            offIcon = "";
            offLabel = "Off";
            onIcon = "";
            onLabel = "On";
            pollingInterval = 2000;
            rightClick = "";
            scrollDown = "";
            scrollUp = "";
          };

          hyprsunset = {
            label = true;
            middleClick = "";
            offIcon = "󰛨";
            offLabel = "Off";
            onIcon = "󱩌";
            onLabel = "On";
            pollingInterval = 2000;
            rightClick = "";
            scrollDown = "";
            scrollUp = "";
            temperature = "6000k";
          };

          kbLayout = {
            icon = "󰌌";
            label = true;
            labelType = "code";
            leftClick = "";
            middleClick = "";
            rightClick = "";
            scrollDown = "";
            scrollUp = "";
          };

          microphone = {
            label = true;
            leftClick = "menu:audio";
            middleClick = "";
            mutedIcon = "󰍭";
            rightClick = "";
            scrollDown = "";
            scrollUp = "";
            unmutedIcon = "󰍬";
          };

          netstat = {
            dynamicIcon = false;
            icon = "󰖟";
            label = true;
            labelType = "full";
            leftClick = "";
            middleClick = "";
            networkInLabel = "↓";
            networkInterface = "";
            networkOutLabel = "↑";
            pollingInterval = 2000;
            rateUnit = "auto";
            rightClick = "";
            round = true;
          };

          power = {
            icon = "";
            leftClick = "menu:powerdropdown";
            middleClick = "";
            rightClick = "";
            scrollDown = "";
            scrollUp = "";
            showLabel = true;
          };

          ram = {
            icon = "";
            label = true;
            labelType = "percentage";
            leftClick = "";
            middleClick = "";
            pollingInterval = 2000;
            rightClick = "";
            round = true;
          };

          scrollSpeed = 5;

          storage = {
            icon = "󰋊";
            label = true;
            labelType = "percentage";
            leftClick = "";
            middleClick = "";
            pollingInterval = 2000;
            rightClick = "";
            round = false;
          };

          submap = {
            disabledIcon = "󰌌";
            disabledText = "Submap off";
            enabledIcon = "󰌐";
            enabledText = "Submap On";
            label = true;
            leftClick = "";
            middleClick = "";
            rightClick = "";
            scrollDown = "";
            scrollUp = "";
            showSubmapName = true;
          };

          label = true;
          leftClick = "";
          middleClick = "";
          rightClick = "";
          scrollDown = "";
          scrollUp = "";
          unit = "imperial";
        };

        launcher = {
          autoDetectIcon = false;
          icon = "";
          middleClick = "";
          rightClick = "";
          scrollDown = "";
          scrollUp = "";
        };

        media = {
          format = "{artist: - }{title}";
          middleClick = "";
          rightClick = "";
          scrollDown = "";
          scrollUp = "";
          show_active_only = false;
          show_label = false;
          truncation = true;
          truncation_size = 30;
        };

        network = {
          label = false;
          middleClick = "";
          rightClick = "";
          scrollDown = "";
          scrollUp = "";
          showWifiInfo = false;
          truncation = true;
          truncation_size = 7;
        };

        notifications = {
          hideCountWhenZero = false;
          middleClick = "";
          rightClick = "";
          scrollDown = "";
          scrollUp = "";
          show_total = true;
        };

        scrollSpeed = 5;

        systray.ignore = [];

        volume = {
          label = true;
          middleClick = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          rightClick = flake.lib.uApp "pwvucontrol";
          scrollDown = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          scrollUp = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        };

        windowtitle = {
          class_name = true;
          custom_title = true;
          icon = false;
          label = true;
          leftClick = "";
          middleClick = "";
          rightClick = "";
          scrollDown = "";
          scrollUp = "";
          truncation = true;
          truncation_size = 50;
        };

        workspaces = {
          applicationIconEmptyWorkspace = "";
          applicationIconFallback = "󰣆";
          applicationIconMap = {};
          applicationIconOncePerWorkspace = true;
          hideUnoccupied = false;
          icons.active = "";
          icons.available = "";
          icons.occupied = "";
          ignored = "";
          monitorSpecific = true;
          numbered_active_indicator = "underline";
          reverse_scroll = false;
          scroll_speed = 5;
          showAllActive = true;
          showApplicationIcons = true;
          showWsIcons = true;
          show_icons = true;
          show_numbered = true;
          spacing = 1;
          workspaceIconMap = {};
          workspaceMask = false;
          workspaces = 6;
        };
      };

      dummy = true;

      hyprpanel = {
        restartAgs = true;
        restartCommand =
          ''${pkgs.hyprpanel}/bin/hyprpanel q; ''
          + ''${pkgs.hyprpanel}/bin/hyprpanel'';
      };

      menus = {
        clock = {
          time = {
            hideSeconds = true;
            military = false;
          };

          weather = {
            enabled = false;
            interval = 60000;
            key = "";
            location = "Los Angeles";
            unit = "imperial";
          };
        };

        dashboard = {
          controls.enabled = true;

          directories = {
            enabled = true;

            left = {
              directory1 = {
                command = "bash -c \"xdg-open $HOME/Downloads/\"";
                label = "󰉍 Downloads";
              };

              directory2 = {
                command = "bash -c \"xdg-open $HOME/Videos/\"";
                label = "󰉏 Videos";
              };

              directory3 = {
                command = "bash -c \"xdg-open $HOME/Projects/\"";
                label = "󰚝 Projects";
              };
            };

            right = {
              directory1 = {
                command = "bash -c \"xdg-open $HOME/Documents/\"";
                label = "󱧶 Documents";
              };

              directory2 = {
                command = "bash -c \"xdg-open $HOME/Pictures/\"";
                label = "󰉏 Pictures";
              };

              directory3 = {
                command = "bash -c \"xdg-open $HOME/\"";
                label = "󱂵 Home";
              };
            };

            powermenu = {
              avatar = {
                image = "$HOME/.face.icon";
                name = "system";
              };

              confirmation = true;
              logout = "hyprctl dispatch exit";
              reboot = "systemctl reboot";
              shutdown = "systemctl poweroff";
              sleep = "systemctl suspend";
            };

            recording.path = "$HOME/Videos/Screencasts";

            shortcuts = {
              enabled = true;

              left = {
                shortcut1 = {
                  command = "microsoft-edge-stable";
                  icon = "󰇩";
                  tooltip = "Microsoft Edge";
                };

                shortcut2 = {
                  command = "spotify-launcher";
                  icon = "";
                  tooltip = "Spotify";
                };

                shortcut3 = {
                  command = "discord";
                  icon = "";
                  tooltip = "Discord";
                };

                shortcut4 = {
                  command = "rofi -show drun";
                  icon = "";
                  tooltip = "Search Apps";
                };
              };

              right = {
                shortcut1 = {
                  command = "sleep 0.5 && hyprpicker -a";
                  icon = "";
                  tooltip = "Color Picker";
                };

                shortcut3 = {
                  # command = "bash -c \"${../scripts/snapshot.sh}\"";
                  icon = "󰄀";
                  tooltip = "Screenshot";
                };
              };
            };

            stats = {
              enable_gpu = false;
              enabled = true;
              interval = 2000;
            };
          };
        };

        media = {
          displayTime = false;
          displayTimeTooltip = false;
          hideAlbum = false;
          hideAuthor = false;
          noMediaText = "";
        };

        power = {
          confirmation = false;
          logout = "uwsm stop";
          lowBatteryNotification = true;
          reboot = "systemctl reboot";
          showLabel = true;
          shutdown = "systemctl poweroff";
          sleep = "systemctl suspend";
        };

        transition = "crossfade";
        transitionTime = 200;
      };

      notifications = {
        active_monitor = true;
        cache_actions = true;
        clearDelay = 100;
        displayedTotal = 10;
        monitor = 0;
        position = "top right";
        showActionsOnHover = false;
        timeout = 7000;
        scalingPriority = "both";
        tear = false;
      };

      wallpaper = {
        enable = false;
        pywal = false;
      };
    };
  };
}
