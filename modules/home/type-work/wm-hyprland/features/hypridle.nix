{
  lib,
  osConfig,
  ...
}: let
  lock_cmd = "pidof hyprlock || ${lockExe}";
  lockExe = lib.getExe osConfig.nixos.opts.hypr.hyprlock.pkg;
  timeout = 1200;
in {
  services.hypridle = {
    enable = true;
    package = osConfig.nixos.opts.hypr.hypridle.pkg;

    settings = {
      general = {
        inherit lock_cmd;
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          inherit timeout;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }

        {
          on-timeout = lock_cmd;
          timeout = timeout + 10;
        }
      ];
    };
  };
}
