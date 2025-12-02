{
  flake,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    evtest
    libinput
    usbutils
  ];
  # ugly hack will replace with something else later

  # todo: spawn-at-startup
  #   "sudo rm /tmp/CoreFxPipe_OpenTabletDriver*"
  #   (flake.lib.uApp "${pkgs.opentabletdriver}/bin/otd-daemon")
  # ];
}
