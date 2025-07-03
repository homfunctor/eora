# todo: do some reading https://github.com/Vladimir-csp/uwsm?tab=readme-ov-file
{lib, ...}: {
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

  xdg.portal.enable = lib.mkForce false;
}
