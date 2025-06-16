# minimal services
{
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

    fstrim.enable = true;
    fwupd.enable = true;
    gvfs.enable = true;
    libinput.enable = true;
    udisks2.enable = true;
    upower.enable = true;
  };
}
