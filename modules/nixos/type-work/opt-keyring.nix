# not using security.pam.services keyring options
# because keyring is unlocked in hm module
{pkgs, ...}: {
  boot.initrd.systemd.enable = true;

  programs.seahorse.enable = true;

  security.pam.services.hyprlock.text = "auth include login";

  services = {
    dbus = {
      enable = true;
      implementation = "broker";
      packages = with pkgs; [
        gcr
        gnome-settings-daemon
        libsecret
      ];
    };

    gnome.gnome-keyring.enable = true;
  };
}
