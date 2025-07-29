{pkgs, ...}: {
  boot.initrd.systemd.enable = true;

  programs.seahorse.enable = true;

  # todo: not needed since we manually unlock?
  # security.pam.services = {
  #   greetd-password.enableGnomeKeyring = true;
  #   greetd.enableGnomeKeyring = true;
  #   login.enableGnomeKeyring = true;
  # };

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
