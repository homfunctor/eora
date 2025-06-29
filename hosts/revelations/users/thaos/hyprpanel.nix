{flake, ...}: {
  home.opts.hplLayout = {
    "0" = {
      "left" = ["power" "workspaces" "windowtitle"];
      "middle" = ["clock"];
      "right" = ["volume" "microphone" "systray" "notifications"];
    };

    "1" = {
      "left" = ["power" "workspaces" "windowtitle"];
      "middle" = ["clock"];
      "right" = ["volume" "microphone" "systray" "notifications"];
    };

    "2" = {
      "left" = ["workspaces" "windowtitle"];
      "middle" = ["clock"];
      "right" = ["volume" "microphone" "systray"];
    };
  };

  wayland.windowManager.hyprland.settings.exec-once = [
    (flake.lib.uApp "hyprpanel")
  ];
}
