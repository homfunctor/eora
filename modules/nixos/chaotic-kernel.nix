{pkgs, ...}: {
  boot.kernelPackages = pkgs.linuxPackages_cachyos;
  services.scx = {
    enable = true;
    package = pkgs.scx_git.full;
    scheduler = "scx_lavd";
    extraARgs = ["--performance"];
  };
}
