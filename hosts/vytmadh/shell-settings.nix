# to be inherited or adjoined to shell settings
{
  nixos.opts.niri = {
    # inherited within bar as widgets
    bar.widgets = {
      left = [
        {
          id = "ControlCenter";
          useDistroLogo = true;
          usePrimaryColor = true;
        }
        {
          id = "Workspace";
          colorizeIcons = true;
          enableScrollWheel = false;
          hideUnoccupied = false;
          labelMode = "none";
          showApplications = true;
        }
      ];

      center = [
        {
          formatHorizontal = "ddd MMM d h:mm AP";
          id = "Clock";
          usePrimaryColor = true;
        }
        {
          id = "Battery";
          displayMode = "alwaysShow";
          showNoctaliaPerformance = true;
          showPowerProfiles = true;
          warningThreshold = 20;
        }
      ];

      right = [
        {
          id = "Tray";
          usePrimaryColor = true;
          drawerEnabled = false;
        }
        {
          id = "Brightness";
        }
        {
          id = "Volume";
          displayMode = "alwaysShow";
        }
        {
          id = "Microphone";
          displayMode = "alwaysShow";
        }
        {
          id = "NotificationHistory";
          showUnreadBadge = true;
          hideWhenZero = true;
        }
        {
          id = "SessionMenu";
          usePrimaryColor = true;
        }
      ];
    };

    controlCenter = {
      # inherited
      cards = [
        {
          id = "profile-card";
          enabled = true;
        }
        {
          id = "shortcuts-card";
          enabled = true;
        }
        {
          id = "audio-card";
          enabled = true;
        }
        {
          id = "weather-card";
          enabled = false;
        }
        {
          id = "media-sysmon-card";
          enabled = true;
        }
      ];
      # inherited
      shortcuts = {
        left = [];
        right = [];
      };
    };

    # misc to adjoin to noctalia-shell.settings
    misc.network.wifiEnabled = true;
  };
}
