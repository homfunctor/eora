{pkgs, ...}: {
  boot.kernelPackages = pkgs.linuxPackages_cachyos;
  services.scx.enable = true;
}
