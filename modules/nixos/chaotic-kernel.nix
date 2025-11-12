{pkgs, ...}: {
  boot.kernelPackages = pkgs.linuxPackages_cachyos;
  services.scx = {
    enable = true;
    package = pkgs.scx.full;
    scheduler = "scx_lavd";
    extraArgs = ["--performance"];
  };
}
