{pkgs, ...}: {
  hardware.sane.enable = true;

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cnijfilter2
    ];
  };
}
