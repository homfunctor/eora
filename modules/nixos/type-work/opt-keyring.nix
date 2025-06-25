{pkgs, ...}: {
  security.pam.services.login.enableGnomeKeyring = true;

  services = {
    dbus = {
      enable = true;
      implementation = "broker";
      packages = with pkgs; [
        gcr
        gnome-keyring
      ];
    };
    gnome.gnome-keyring.enable = true;
  };

  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
