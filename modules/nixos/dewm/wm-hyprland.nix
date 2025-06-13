{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.opts.nixos.dewm.wm-hyprland;
in {
  config = mkIf cfg.enable {
    programs = {
      hyprland = {
        enable = true;
        withUWSM = true;
      };

      uwsm.enable = true;
    };

    security.pam.services.hyprlock.text = "auth include login";
  };
}
