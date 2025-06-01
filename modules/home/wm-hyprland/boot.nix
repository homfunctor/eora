let
  uwsmapp = cmd: "uwsm app -- ${cmd}";
in {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "uwsm finalize"
      "systemctl --user start hyprpolkitagent"
      "hyprctl setcursor"
      "${uwsmapp "nm-applet"}"
      "${uwsmapp "kdeconnect-indicator"}"
    ];
  };
}
