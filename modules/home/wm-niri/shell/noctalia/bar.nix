{
  config,
  inputs,
  osConfig,
  ...
}: {
  imports = [
    inputs.sapadal.homeModules.niri-doxtalia
  ];

  programs.noctalia-shell.settings = with config.stylix; {
    bar = {
      inherit (osConfig.nixos.opts.noct.bar) widgets;

      barType = "simple";
      backgroundOpacity = opacity.desktop;
      capsuleOpacity = opacity.desktop;
      compactMode = false;
      density = "comfortable";
      exclusive = true;
      floating = false;
      outerCorners = false;
      position = "top";
      showCapsule = true;
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
      useErrorColor = true;
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
