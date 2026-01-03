{pkgs, ...}: {
  environment.systemPackages = [pkgs.simple-scan];

  hardware.sane.enable = true;

  services.printing = {
    enable = true;
    # temp issues
    # drivers = [pkgs.cnijfilter2];
  };
}
