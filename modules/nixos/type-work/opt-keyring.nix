# not using security.pam.services keyring options
# because keyring is unlocked in hm module
{pkgs, ...}: {
  boot.initrd.systemd.enable = true;

  programs.seahorse.enable = true;

  services = {
    dbus = {
      enable = true;
      implementation = "broker";
      packages = with pkgs; [
        gcr_4
        gnome-keyring
        libsecret
      ];
    };

    gnome.gnome-keyring.enable = true;
  };
}
