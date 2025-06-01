{
  home = {
    stateVersion = "25.05";
  };

  services.udiskie = {
    enable = true;

    automount = true;
    notify = true;
    tray = "always";
  };
}
