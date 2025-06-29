{pkgs, ...}: {
  programs.seahorse.enable = true;

  security.pam.services = {
    greetd.enableGnomeKeyring = true;
    login.enableGnomeKeyring = true;
    uwsm.enableGnomeKeyring = true;
  };

  services.gnome.gnome-keyring.enable = true;

  # required for unlock-on-autologin to work
  systemd.user.services."gnome-keyring" = {
    partOf = ["graphical-session.target"];
    serviceConfig = {
      ExecStart = "${pkgs.gnome-keyring}/bin/gnome-keyring-daemon --start --foreground --components=secrets,pkcs11,ssh";
      Restart = "on-failure";
    };
  };
}
