# useful defaults to keep in mind
#   touchpad:
#   two fingers scroll up/down
#   three fingers move left/right between columns
#     or up/down between workspaces
{
  programs.niri.settings = {
    input = {
      touchpad = {
        accel-profile = "flat";
        dwt = true;
        dwtp = true;
        tap = false;
      };

      trackpoint.accel-profile = "flat";
    };

    layout = {
      gaps = 0;
      border.width = 4;
    };
  };
}
