{
  config,
  lib,
  pkgs,
  ...
}: {
  services.greetd = {
    enable = true;
    restart = false;

    settings = let
      inherit (config.nixos.opts) loginCmd;
      tuigreetExe = lib.getExe pkgs.tuigreet;
    in {
      initial_session = {
        command = loginCmd;
        user = config.nixos.opts.adminUser;
      };

      default_session = {
        command = ''
          ${tuigreetExe} --time --cmd "${loginCmd}" --time-format '%F %R'
        '';
        user = "greeter";
      };
    };
  };

  security.pam.services = {
    login.enableGnomeKeyring = true;
    greetd.enableGnomeKeyring = true;
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
