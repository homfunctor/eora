{
  config,
  flake,
  lib,
  pkgs,
  ...
}: {
  programs.hyprpanel.settings.bar = {
    autoHide = "never";
    layouts = config.home.opts.hplLayout;

    battery = {
      hideLabelWhenFull = false;
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
        leftClick = "";
        middleClick = "";
        rightClick = "";
        scrollDown = "";
        scrollUp = "";
        showActiveOnly = true;
        showIcon = true;
      };

      cpu = {
        icon = "󰍛";
        leftClick = "";
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
        leftClick = "";
        middleClick = "";
        round = true;
        rightClick = "";
        scrollDown = "";
        scrollUp = "";
        showIcon = true;
      };
    };

    launcher = {
      icon = "";
      rightClick = (flake.lib.uTog "${lib.getExe pkgs.nwg-drawer}") + " -nofs -wm 'uwsm'";
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
      applicationIconMap = {
        "Alacritty" = "";
        "org.gnome.Nautilus" = "";
        "org.pwmt.zathura" = "";
        "title:Settings" = "";
        "vivaldi-stable" = "";
      };
      applicationIconOncePerWorkspace = false;
      showApplicationIcons = true;
      showWsIcons = true;
      show_icons = true;
      show_numbered = true;
      workspaceIconMap = {};
      workspaces = 6;
    };
  };
}
