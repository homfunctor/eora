# todo: just write something to unlock an empty password keyring
{pkgs, ...}: {
  programs.seahorse.enable = true;

  security.pam.services = {
    greetd-password.enableGnomeKeyring = true;
    greetd.enableGnomeKeyring = true;
    login.enableGnomeKeyring = true;
  };

  services = {
    dbus = {
      enable = true;
      implementation = "broker";
      packages = with pkgs; [
        gcr_4
        gnome-keyring
      ];
    };

    gnome.gnome-keyring.enable = true;
  };
}
