{pkgs, ...}: {
  security.pam.services = {
    greetd-password.enableGnomeKeyring = true;
    greetd.enableGnomeKeyring = true;
    login.enableGnomeKeyring = true;
  };

  services = {
    dbus = {
      enable = true;
      implementation = "broker";
      packages = [pkgs.gcr_4];
    };
    gnome.gnome-keyring.enable = true;
  };
}
