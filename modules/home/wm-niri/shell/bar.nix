{
  inputs,
  osConfig,
  ...
}: {
  imports = [
    inputs.sapadal.homeModules.niri-doxtalia
  ];

  programs.noctalia-shell.settings = {
    bar = {
      inherit (osConfig.nixos.opts.noct.bar) widgets;

      backgroundOpacity = 1;
      capsuleOpacity = 1;
      compactMode = false;
      density = "comfortable";
      exclusive = true;
      floating = false;
      marginHorizontal = 0.50;
      marginVertical = 0.5;
      outerCorners = false;
      position = "top";
      showCapsule = false;
      showOutline = true;
      transparent = false;
    };

    calendar.cards = [
      {
        id = "calendar-header-card";
        enabled = false;
      }
      {
        id = "calendar-month-card";
        enabled = true;
      }
      {
        id = "timer-card";
        enabled = false;
      }
      {
        id = "weather-card";
        enabled = true;
      }
    ];

    controlCenter = {
      inherit (osConfig.nixos.opts.noct.controlCenter) cards shortcuts;
      position = "close_to_bar_button";
    };

    location = {
      showCalendarEvents = true;
      showCalendarWeather = true;
      showWeekNumberInCalendar = true;
      weatherEnabled = true;
      weatherShowEffects = true;
    };
  };
}
