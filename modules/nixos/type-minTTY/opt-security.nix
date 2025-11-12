{pkgs, ...}: {
  services.dbus.apparmor = "enabled";

  security = {
    apparmor = {
      enable = true;
      enableCache = true;
      packages = [pkgs.apparmor-profiles];
    };

    polkit.enable = true;

    sudo-rs = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };
}
