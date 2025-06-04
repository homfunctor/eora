let
  uwsmapp = cmd: "uwsm app -- ${cmd}";
in {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "uwsm finalize"
      "hyprctl setcursor"
      "${uwsmapp "nm-applet"}"
    ];
  };
}
