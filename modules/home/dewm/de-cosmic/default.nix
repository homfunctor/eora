{
  config,
  inputs,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.home.opts.dewm.de-cosmic;
in {
  imports = [
    inputs.cosmic-manager.homeManagerModules.cosmic-manager
  ];

  config = mkIf cfg.enable {
    programs = {
      cosmic-applibrary.enable = true;
      cosmic-manager.enable = true;
      tasks.enable = true;
    };

    wayland.desktopManager.cosmic = {
      enable = true;
    };
  };
}
