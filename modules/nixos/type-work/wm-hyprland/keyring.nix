{
  boot.initrd.systemd.enable = true;

  programs.seahorse.enable = true;

  security.pam.services = {
    greetd.enableGnomeKeyring = true;
    login.enableGnomeKeyring = true;
    uwsm.enableGnomeKeyring = true;
  };

  services.gnome.gnome-keyring.enable = true;
}
