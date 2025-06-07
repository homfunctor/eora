{
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };

    uwsm.enable = true;
  };

  security.pam.services.hyprlock.text = "auth include login";
}
