# todo: revise
{
  config,
  lib,
  perSystem,
  pkgs,
  ...
}: let
  hypridlePkg = perSystem.hypridle.hypridle;
  lock = "${pkgs.systemd}/bin/loginctl lock-session";
  lockPkg = lib.getExe config.programs.hyprlock.package;
  timeout = 1200;
in {
  services.hypridle = {
    enable = true;

    package = hypridlePkg;

    settings = {
      general = {
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";

        lock_cmd = "pgrep hyprlock || ${lockPkg}";
      };

      listener = [
        {
          inherit timeout;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }

        {
          timeout = timeout + 10;
          on-timeout = lock;
        }
      ];
    };
  };
}
