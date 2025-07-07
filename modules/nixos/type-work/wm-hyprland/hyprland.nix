# todo: do some reading https://github.com/Vladimir-csp/uwsm?tab=readme-ov-file
_: {
  hardware.brillo.enable = true;

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    uwsm.enable = true;
  };

  security.pam.services.hyprlock.text = "auth include login";

  services.xserver.enable = false;

  xdg.portal.enable = true;

  # systemd.user.tmpfiles.rules = [
  #   "L+ /usr/libexec/xdg-desktop-portal - - - - ${pkgs.xdg-desktop-portal}/libexec/xdg-desktop-portal "
  #   "L+ /usr/libexec/xdg-desktop-portal-gtk - - - - ${pkgs.xdg-desktop-portal-gtk}/libexec/xdg-desktop-portal-gtk "
  #   "L+ /usr/libexec/xdg-desktop-portal-hyprland - - - - ${pkgs.xdg-desktop-portal-hyprland}/libexec/xdg-desktop-portal-hyprland "
  #   "L+ /usr/share/xdg-desktop-portal/portals - - - - /run/current-system/sw/share/xdg-desktop-portal/portals "
  # ];
}
