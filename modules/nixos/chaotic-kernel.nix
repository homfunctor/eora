# so cutting edge it bleeds
{
  lib,
  pkgs,
  ...
}: {
  boot.kernelPackages = pkgs.linuxPackages_cachyos;

  services.scx.enable = true;
}
