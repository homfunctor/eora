{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) getExe;

  # autologin to Hyprland with uwsm
  initial_session = {
    command = "${getExe pkgs.uwsm} start hyprland-uwsm.desktop";
    user = config.nixos.opts.adminUser;
  };

  # enter greeter after logging out
  default_session = {
    command = "${initial_session.command}";
    user = "cosmic-greeter";
  };
in {
  services = {
    displayManager.cosmic-greeter.enable = true;

    greetd.settings = {inherit default_session initial_session;};
  };
}
