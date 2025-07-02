# todo: keyring unlock after autologin remains elusive
#   it unlocks properly after logging in through cosmic-greeter
#   but autologin does not unlock the keyring
{pkgs, ...}: {
  # one day this will work
  boot.initrd.systemd.enable = true;

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
