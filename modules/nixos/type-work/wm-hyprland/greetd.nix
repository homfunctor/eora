{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) getExe;
  args = "--remember --time --cmd";
  initial_session = {
    command = "${getExe pkgs.uwsm} start hyprland-uwsm.desktop";
    user = config.nixos.opts.adminuser;
  };
in {
  services.greetd = {
    enable = true;
    settings = {
      inherit initial_session;
      default_session = {
        command = ''
          ${getExe pkgs.greetd.tuigreet} ${args} ${initial_session.command}
        '';
        user = "greeter";
      };
    };
  };
}
