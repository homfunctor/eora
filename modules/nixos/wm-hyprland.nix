{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  security.pam.services.hyprlock.text = "auth include login";

  services.xserver = {
    enable = false;
    desktopManager.runXdgAutostartIfNone = true;
  };
}
