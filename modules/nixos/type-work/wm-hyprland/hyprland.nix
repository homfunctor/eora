{
  hardware.brillo.enable = true;

  programs.hyprland.enable = true;

  security.pam.services.hyprlock.text = "auth include login";

  services.xserver.enable = false;
}
