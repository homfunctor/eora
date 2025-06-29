{pkgs, ...}: {
  environment = {
    pathsToLink = ["/shares/icon"];
    systemPackages = [pkgs.libnotify];
  };

  hardware.brillo.enable = true;

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    uwsm.enable = true;
  };

  security.pam.services.hyprlock.text = "auth include login";

  services.xserver.enable = false;
}
