# minimal services
{pkgs, ...}: {
  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        domain = true;
        userServices = true;
      };
    };

    dbus = {
      enable = true;
      implementation = "broker";
      packages = with pkgs; [
        gcr
        gnome-settings-daemon
      ];
    };

    fstrim.enable = true;
    fwupd.enable = true;
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    libinput.enable = true;
    udisks2.enable = true;
    upower.enable = true;

    xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
}
