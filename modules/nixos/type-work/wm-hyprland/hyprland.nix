{pkgs, ...}: {
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    uwsm.enable = true;
  };

  security.pam.services.hyprlock.text = "auth include login";

  services.xserver.enable = false;

  environment.systemPackages = [
    (pkgs.writeScriptBin "logout-session" ''
      #!${pkgs.bash}/bin/bash
      ${pkgs.systemd}/bin/loginctl terminate-user $USER
    '')
  ];
}
