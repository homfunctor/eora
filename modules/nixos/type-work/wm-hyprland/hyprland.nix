{
  config,
  pkgs,
  ...
}: {
  hardware.brillo.enable = true;

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    uwsm.enable = true;
  };

  security.pam.services.hyprlock.text = "auth include login";

  services.xserver = {
    enable = false;
    desktopManager.runXdgAutostartIfNone = true;
  };
}
