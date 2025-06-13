{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.nixos.opts.dewm.de-cosmic;
in {
  config = mkIf cfg.enable {
    services.desktopManager.cosmic = {
      enable = true;
      xwayland.enable = true;
    };
  };
}
