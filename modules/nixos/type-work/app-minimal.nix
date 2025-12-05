{pkgs, ...}: {
  hardware.brillo.enable = true;

  programs = {
    kdeconnect.enable = true;
    seahorse.enable = true;
  };

  services = {
    dbus = {
      enable = true;
      implementation = "broker";
      packages = [pkgs.gcr];
    };
    xserver.enable = false;
  };
}
