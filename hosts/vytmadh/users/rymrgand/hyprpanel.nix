{flake, ...}: let
  inherit (flake.lib) uApp;
in {
  home.opts.hyprpanelLayout = {
    "*" = {
      "left" = ["power" "workspaces" "windowtitle"];
      "middle" = ["cpu" "clock" "battery"];
      "right" = ["volume" "microphone" "systray" "notifications"];
    };
  };

  wayland.windowManager.hyprland.settings.exec-once = [
    (uApp "blueman-applet")
    (uApp "hyprpanel")
  ];
}
