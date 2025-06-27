# symbols:
# 🎜 🎞 🎼 💀 💻 💽 💾 📁 📂 🕱
# 🖸 🖮 🖳 🗁 🗂 🗖 🗔
# 🗡 🛠 🞎 🞕 󰁟 󰃖 󰃬 󰃭 󰃮 󰃯 󰅩
# 󰆍 󰆛 󰆟 󰇅
# 󰇄 󰇃 󰆾 󰈈 󰈉 󰈀
# 󰊴 󰊗 󰋋 󰋌
# 󰋊 󰋞 󰌌 󰌠 󰍬 󰍭 󰍮 󰏜
# 󰏘 󰐥 󰑫 󰒓 󰓓
# 󰕷 󰘔 󰙯 󰚌 󰚽 󰛄
# 󰛤 󰟔 󰣒 󰥻 󰦘
# 󰦣 󰨇 󰨊 󰭿
# 󰮂 󰯈 󰽴 🍓
# 󰿤 󱃸 󱄅
# 󱆀 󱅿 ⬚ ⬜ ⬛
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
          icon = "󰃭";
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
            framerate = 30;
            highCutoff = 10000;
            icon = "🎜";
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

          power = {
            icon = "󱄅";
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
          applicationIconMap = {
            "Alacritty" = "󰞷";
            "org.gnome.Nautilus" = "";
            "org.pwmt.zathura" = "󰐣";
            "title:Settings" = "";
            "vivaldi" = "";
          };
          applicationIconOncePerWorkspace = true;
          hideUnoccupied = false;
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
          weather.enabled = false;
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
      };

      scalingPriority = "gdk";
      tear = false;

      wallpaper = {
        enable = false;
        pywal = false;
      };
    };
  };
}
