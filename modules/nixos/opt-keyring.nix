{
  programs.seahorse.enable = true;

  security.pam.services = {
    greetd.enableGnomeKeyring = true;
    greetd-password.enableGnomeKeyring = true;
    login.enableGnomeKeyring = true;
  };

  services.gnome.gnome-keyring.enable = true;
}
