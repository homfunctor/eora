{
  lib,
  pkgs,
  ...
}: {
  boot.kernelModules = ["uinput"];
  environment.systemPackages = with pkgs; [
    evtest
    libinput
  ];
}
