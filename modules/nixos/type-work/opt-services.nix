{pkgs, ...}: {
  services = {
    dbus = {
      enable = true;
      packages = with pkgs; [
        dconf
        gcr
        gnome-keyring
        gnome-settings-daemon
        libsecret
      ];
    };
    fstrim.enable = true;
    fwupd.enable = true;
    gvfs.enable = true;
    libinput.enable = true;
    timesyncd.enable = true;
    udisks2.enable = true;
    upower.enable = true;
    xserver.enable = false;
  };
}
