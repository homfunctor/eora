# so cutting edge it bleeds
{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkForce;
in {
  boot.kernelPackages = mkForce pkgs.linuxPackages_cachyos;

  services.scx.enable = true;
}
