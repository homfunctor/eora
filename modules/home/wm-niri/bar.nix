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
      inherit (osConfig.nixos.opts.niri.bar) widgets;

      density = "default";
      backgroundOpacity = 1;
      floating = false;

      outerCorners = false;

      position = "top";
      showCapsule = false;
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
      inherit (osConfig.nixos.opts.niri.controlCenter) cards shortcuts;

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
