{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config.nixos.opts) adminuser;
  inherit (lib) getExe;
in {
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };

    uwsm.enable = true;
  };

  security.pam.services.hyprlock.text = "auth include login";

  # autologin
  boot.initrd.systemd.enable = true;
  services = {
    getty.autologinUser = adminuser;
    xserver.enable = false;
  };
  systemd.user.services."uwsm-autostart" = {
    enable = true;
    description = "Start uwsm on login";
    wantedBy = ["graphical-session.target"];
    serviceConfig = {
      ExecStart = "${getExe pkgs.uwsm} start hyprland-uwsm.desktop";
      Restart = "no";
    };
  };
}
