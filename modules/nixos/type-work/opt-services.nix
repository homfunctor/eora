{pkgs, ...}: {
  services = {
    dbus = {
      enable = true;
      packages = [pkgs.dconf];
    };
    fstrim.enable = true;
    fwupd.enable = true;
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    libinput.enable = true;
    timesyncd.enable = true;
    udisks2.enable = true;
    upower.enable = true;
    xserver.enable = false;
  };
}
