{
  config,
  lib,
  ...
}: let
  lock_cmd = "pidof hyprlock || ${lockPkg}";
  lockPkg = lib.getExe config.programs.hyprlock.package;
  timeout = 1200;
in {
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        inherit lock_cmd;
        after_sleep_cmd = "hyprctl dispatch dpms on";
        before_sleep_cmd = "loginctl lock-session";
      };

      listener = [
        {
          inherit timeout;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }

        {
          timeout = timeout + 10;
          on-timeout = lock_cmd;
        }
      ];
    };
  };
}
