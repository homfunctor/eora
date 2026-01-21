{pkgs, ...}: {
  boot.kernelPackages = pkgs.linuxPackages_cachyos;

  services.scx = {
    enable = true;
    extraArgs = ["--performance"];
    package = pkgs.scx.full;
    scheduler = "scx_lavd";
  };
}
