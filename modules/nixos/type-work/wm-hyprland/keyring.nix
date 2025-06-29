{
  programs.seahorse.enable = true;

  services.gnome.gnome-keyring.enable = true;
  security.pam.services = {
    greetd.enableGnomeKeyring = true;
    login.enableGnomeKeyring = true;
    uwsm.enableGnomeKeyring = true;
  };
}
