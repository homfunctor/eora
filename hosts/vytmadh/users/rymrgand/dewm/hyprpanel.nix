{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.home.opts.dewm.wm-hyprland;
in {
  config = mkIf cfg.enable {
    home.opts.hyprpanelLayout = {
      "*" = {
        "left" = ["power" "workspaces" "windowtitle"];
        "middle" = ["cpu" "clock" "battery"];
        "right" = ["volume" "microphone" "systray" "notifications"];
      };
    };

    wayland.windowManager.hyprland.settings.exec-once = [
      "uwsm app -- blueman-applet"
      "uwsm app -- hyprpanel"
    ];
  };
}
