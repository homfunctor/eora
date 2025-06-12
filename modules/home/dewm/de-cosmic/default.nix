{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.home.opts.dewm.de-cosmic;
in {
  config = mkIf cfg.enable {
    # cosmic settings
  };
}
