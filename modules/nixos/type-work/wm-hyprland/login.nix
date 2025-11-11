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
      # where is hyprland-uwsm.desktop located?
      # hyprExe = lib.getExe config.nixos.opts.hyprPkg;
      hyprExe = "uwsm start hyprland-uwsm.desktop";
      tuigreetExe = lib.getExe pkgs.tuigreet;
    in {
      initial_session = {
        command = hyprExe;
        user = config.nixos.opts.adminUser;
      };

      default_session = {
        command = "${tuigreetExe} --time --cmd ${hyprExe} --time-format '%F %R'";
        user = "greeter";
      };
    };
  };
}
