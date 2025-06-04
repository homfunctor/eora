let
  uwsmapp = cmd: "uwsm app -- ${cmd}";
in {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "uwsm finalize"
      "systemctl --user start polkit-mate-authentication-agent-1"
      "hyprctl setcursor"
      "${uwsmapp "nm-applet"}"
    ];
  };
}
