{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) getExe;
  args = "--asterisks --remember --remember-user-session --time --cmd";
  initial_session = {
    command = ''
      ${getExe pkgs.uwsm} start hyprland-uwsm.desktop
    '';
    user = config.nixos.opts.adminuser;
  };
in {
  services.greetd = {
    enable = true;
    restart = false;

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

  systemd.services.greetd.serviceConfig = {
    StandardError = "journal";
    StandardInput = "tty";
    StandardOutput = "tty";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
    Type = "idle";
  };
}
