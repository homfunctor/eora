{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.uwsm.enable = true;

  services.greetd = {
    enable = true;
    restart = false;

    settings = let
      inherit (config.nixos.opts) wmName;
      uwsmExe = "${lib.getExe config.programs.uwsm.package}";
      loginExe = "${uwsmExe} start ${wmName}-uwsm.desktop";
      tuigreetExe = lib.getExe pkgs.tuigreet;
    in {
      initial_session = {
        command = loginExe;
        user = config.nixos.opts.adminUser;
      };

      default_session = {
        command = ''
          ${tuigreetExe} --time --cmd "${loginExe}" --time-format '%F %R'
        '';
        user = "greeter";
      };
    };
  };
}
