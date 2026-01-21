# useful defaults to keep in mind
#   touchpad:
#   two fingers scroll up/down
#   three fingers move left/right between columns
#     or up/down between workspaces
{
  config,
  pkgs,
  ...
}: let
  inherit (config.home.opts) mainMonitor;

  mirrorExe = "${pkgs.wl-mirror}/bin/wl-present";
  mirrorCmd = "${mirrorExe} mirror ${mainMonitor}";
in {
  programs.niri.settings = {
    binds = with config.lib.niri.actions; {
      "Mod+P".action.spawn-sh = "pkill wl-mirror ||  ${mirrorCmd}";
    };

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
