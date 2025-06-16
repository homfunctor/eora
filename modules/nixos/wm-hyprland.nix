# todo: fix keyring not unlocking
{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config.nixos.opts) adminuser;
  inherit (lib) getExe;

  # autologin to adminuser
  # can logout and login as workuser
  args = "--asterisks --remember --remember-user-session --cmd";
  tuigreet = getExe pkgs.greetd.tuigreet;

  default_session = {
    command = "${tuigreet}  ${args} ${initial_session.command}";
    user = "greeter";
  };

  initial_session = {
    command = "${getExe pkgs.uwsm} start hyprland-uwsm.desktop";
    user = adminuser;
  };
in {
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };

    uwsm.enable = true;
  };

  security.pam.services.hyprlock.text = "auth include login";

  services = {
    greetd = {
      enable = true;
      settings = {
        inherit default_session initial_session;
        terminal.vt = 1;
      };
    };
    xserver.enable = false;
  };
}
