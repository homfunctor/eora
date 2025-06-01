{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) getExe;
  portalPkg = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;

  # let's me autologin to adminuser, logout then login to workuser
  # should find another way
  args = "--asterisks --remember --remember-user-session --cmd";
  tuigreet = getExe pkgs.greetd.tuigreet;

  default_session = {
    command = "${tuigreet}  ${args} ${initial_session.command}";
    user = "greeter";
  };

  initial_session = {
    command = "${getExe pkgs.uwsm} start hyprland-uwsm.desktop";
    user = config.nixos.opts.adminuser;
  };
in {
  environment.pathsToLink = ["/shares/icon"];

  hardware.brillo.enable = true;

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      portalPackage = portalPkg;
    };
    uwsm.enable = true;
  };

  security.pam.services.hyprlock.text = "auth include login";

  # auto-logins to Hyprland on boot (passwd used to decrypt at boot)
  # if logged out, then run tuigreet (for switching to work account)
  services.greetd = {
    enable = true;
    settings = {
      inherit default_session initial_session;
      terminal.vt = 1;
    };
  };

  # handled by hm?
  # xdg.portal = {
  #   enable = true;
  #   xdgOpenUsePortal = true;
  #   config = {
  #     common.default = ["gtk"];
  #     hyprland.default = ["gtk" "hyprland"];
  #   };
  #
  #   extraPortals = [
  #     pkgs.xdg-desktop-portal-gtk
  #   ];
  # };
}
