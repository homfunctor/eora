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

    # todo: gaps
    layout = {
      border.width = 5;
    };
  };
}
