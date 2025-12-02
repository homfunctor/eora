{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    evtest
    libinput
    usbutils
  ];

  hardware.opentabletdriver.enable = true;
}
