{pkgs, ...}: {
  security.pam.services = {
    greetd.enableGnomeKeyring = true;
    greetd-password.enableGnomeKeyring = true;
    login.enableGnomeKeyring = true;
  };

  services = {
    dbus = {
      enable = true;
      packages = [pkgs.gcr_4];
    };
    gnome.gnome-keyring.enable = true;
    implementation = "broker";
  };
}
