# todo: can touchpad be setup to only scroll/switch workspaces?
{
  programs.niri.settings = {
    input = {
      touchpad = {
        accel-profile = "flat";
        dwt = true;
        dwtp = true;
        tap = false;
      };

      trackpoint = {
        accel-profile = "flat";
      };
    };

    layout = {
      border.width = 5;
    };
  };
}
