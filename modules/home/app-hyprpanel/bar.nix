# todo: mouse actions over buttons
{
  config,
  flake,
  lib,
  ...
}: let
  inherit (flake.lib) uApp uTog;
  inherit (config.home.opts) apps bg panelOpts;
in {
  programs.hyprpanel.settings.bar = {
    inherit (panelOpts) layouts;
    autoHide = "never";

    # icon is dynamic and managed by hyprpanel
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
      icon = "";
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

      media = {
        icon = "";
        label = "";
        noMediaText = "";
        truncation_size = 25;
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
        rightClick = uApp "missioncenter";
        scrollDown = "";
        scrollUp = "";
        showLabel = true;
      };

      ram = {
        icon = "";
        leftClick = "";
        middleClick = "";
        round = true;
        rightClick = uApp "missioncenter";
        scrollDown = "";
        scrollUp = "";
        showIcon = true;
      };
    };

    launcher = {
      icon = "";
      rightClick = "${uTog "${apps.launcher.exe}"} ${apps.launcher.args}";
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
      rightClick = uApp "pwvucontrol";
      scrollDown = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
      scrollUp = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
    };

    windowtitle = {
      class_name = true;
      custom_title = true;
      icon = true;
      label = true;
      leftClick = "";
      middleClick = "";
      rightClick = "";
      scrollDown = "";
      scrollUp = "";
      truncation = true;
      truncation_size = 25;
      title_map = [
        ["com.github.xournalpp.xournalpp" "󰙏" "Xournal"]
        ["firefox" "󰈹" "Browser"]
        ["kitty" "󰄛" "Terminal"]
        ["nemo" "" "Files"]
        ["neovide" "" "Editor"]
        ["org.gnome.calculator" "󱖦" "Calculator"]
        ["org.pwmt.zathura" "󰈙 " "Zathura"]
        ["vivaldi-stable" "" "Browser"]
      ];
    };

    workspaces = {
      applicationIconMap = {
        "org.gnome.calculator" = "󱖦";
        "com.github.xournalpp.xournalpp" = "󰙏";
        "kitty" = "󰄛";
        "vivaldi-stable" = "";
      };
      applicationIconOncePerWorkspace = true;
      hideUnoccupied = false;
      showApplicationIcons = true;
      show_icons = true;
      workspaces = (lib.length bg.monitors) * bg.nWS;
    };
  };
}
