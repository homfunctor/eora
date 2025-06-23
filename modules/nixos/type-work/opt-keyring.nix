{pkgs, ...}: {
  security.pam.services = {
    greetd-password = {
      enableGnomeKeyring = true;
      startSession = true;
    };

    greetd = {
      enableGnomeKeyring = true;
      startSession = true;
    };
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
