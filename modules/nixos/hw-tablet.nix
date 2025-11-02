{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    evtest
    libinput
    libwacom
    usbutils
    xorg.xinput
  ];
}
