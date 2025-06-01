# hypridle settings
{
  config,
  lib,
  perSystem,
  pkgs,
  ...
}: let
  inherit (lib) getExe mkForce;

  brillo = getExe pkgs.brillo;
  hypridlePkg = perSystem.hypridle.hypridle;
  lock = "${pkgs.systemd}/bin/loginctl lock-session";
  timeout = 1200;
in {
  services.hypridle = {
    enable = true;

    package = hypridlePkg;

    settings = {
      general = {
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";

        lock_cmd = "pgrep hyprlock || ${getExe config.programs.hyprlock.package}";
      };

      listener = [
        {
          timeout = timeout - 10;
          # save the current brightness and dim the screen over a period of
          # 500 ms
          on-timeout = "${brillo} -O; ${brillo} -u 500000 -S 10";
          # brighten the screen over a period of 250ms to the saved value
          on-resume = "${brillo} -I -u 250000";
        }

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

  systemd.user.services = {
    hypridle.Unit.After = mkForce "config.wayland.systemd.target";
  };
}
