{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.home.opts.dewm.wm-hyprland;
in {
  config.dconf = mkIf cfg.enable {
    enable = true;

    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/desktop/privacy".remember-recent-files = false;
    };
  };
}
