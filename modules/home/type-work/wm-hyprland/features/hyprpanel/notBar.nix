{
  config,
  inputs,
  ...
}: let
  inherit
    (config.home.opts)
    hostName
    panelOpts
    userName
    ;

  faceImg = "${inputs.sapadal}/assets/${userName}.png";
  logoutCmd = ''loginctl terminate-user ""'';
  rebootCmd = "systemctl reboot";
  shutdownCmd = "systemctl poweroff";
  sleepCmd = "systemctl suspend";
in {
  programs.hyprpanel.settings = {
    hyprpanel.restartAgs = false;

    menus = {
      clock = {
        time = {
          hideSeconds = true;
          military = false;
        };
        weather.enabled = false;
      };

      dashboard = {
        controls.enabled = false;

        directories = {
          enabled = true;
          left = {
            inherit
              (panelOpts.leftdirs)
              directory1
              directory2
              directory3
              ;
          };
          right = {
            inherit
              (panelOpts.rightdirs)
              directory1
              directory2
              directory3
              ;
          };
        };

        powermenu = {
          avatar = {
            image = faceImg;
            name = "${userName}@${hostName}";
          };

          confirmation = false;

          logout = logoutCmd;
          reboot = rebootCmd;
          shutdown = shutdownCmd;
          sleep = sleepCmd;
        };

        shortcuts = {
          enabled = true;
          left = {
            inherit
              (panelOpts.leftcuts)
              shortcut1
              shortcut2
              shortcut3
              shortcut4
              ;
          };
          right = {
            inherit
              (panelOpts.rightcuts)
              shortcut1
              shortcut3
              ;
          };
        };

        stats.enabled = false;
      };

      media.noMediaText = "";

      power = {
        confirmation = false;
        logout = logoutCmd;
        lowBatteryNotification = true;
        reboot = rebootCmd;
        showLabel = true;
        shutdown = shutdownCmd;
        sleep = sleepCmd;
      };

      transition = "slide_down";
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
}
