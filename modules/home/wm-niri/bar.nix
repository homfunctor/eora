# todo
_: {
  programs.noctalia-shell.settings.bar = {
    density = "compact";
    position = "top";
    showCapsule = false;
    widgets = {
      left = [
        {
          id = "ControlCenter";
          useDistroLogo = true;
        }
      ];

      center = [
        {
          hideUnoccupied = false;
          id = "Workspace";
          labelMode = "none";
        }
      ];

      right = [
        {
          formatHorizontal = "HH:mm";
          id = "Clock";
          useMonospacedFont = true;
          usePrimaryColor = true;
        }
      ];
    };
  };
}
