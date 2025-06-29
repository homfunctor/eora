{
  config,
  flake,
  ...
}: let
  inherit (config.home.opts) hplLayout;
in {
  imports = [
    ./themeColors.nix
    ./themeUI.nix
  ];

  programs.hyprpanel.settings = {
    bar = {
      autoHide = "never";
      layouts = hplLayout;

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
          icon = "";
          middleClick = "";
          rightClick = "";
          scrollDown = "";
          scrollUp = "";
          showActiveOnly = true;
          showIcon = true;
        };

        cpu = {
          icon = "󰍛";
          middleClick = "";
          rightClick = "";
          scrollDown = "";
          scrollUp = "";
          showIcon = true;
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
          icon = "󰐥";
          leftClick = "menu:powerdropdown";
          middleClick = "";
          rightClick = "";
          scrollDown = "";
          scrollUp = "";
          showLabel = true;
        };

        ram = {
          icon = "";
          middleClick = "";
          rightClick = "";
          scrollDown = "";
          scrollUp = "";
          showIcon = true;
        };
      };

      launcher = {
        icon = "";
        rightClick = "rofi -show drun -run-command 'uwsm app -- {cmd}'";
      };

      media = {
        leftClick = "";
        middleClick = "";
        rightClick = "";
        scrollDown = "";
        scrollUp = "";
        show_active_only = true;
        truncation_size = 15;
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
        truncation_size = 20;
      };

      workspaces = {
        applicationIconEmptyWorkspace = "";
        applicationIconFallback = "󰣆";
        applicationIconMap = {
          "Alacritty" = "";
          "org.gnome.Nautilus" = "";
          "org.pwmt.zathura" = "";
          "title:Settings" = "";
          "vivaldi-stable" = "";
        };
        applicationIconOncePerWorkspace = false;
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
  };
}
