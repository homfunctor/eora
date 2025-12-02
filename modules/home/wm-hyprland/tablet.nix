{
  flake,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland.settings.exec-once = [
    # ugly hack will replace with something else later
    "sudo rm /tmp/CoreFxPipe_OpenTabletDriver*"
    (flake.lib.uApp "${pkgs.opentabletdriver}/bin/otd-daemon")
  ];
}
