{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.opts.home.nvim.rustaceanvim;
in {
  programs.nixvim.plugins.rustaceanvim = mkIf cfg.enable {
    enable = true;
    settings.server = {
      default_settings.rust-analyzer = {
        check = {
          allTargets = true;
          command = "clippy";
        };
        inlayHints = {
          lifetimeElisionHints.enable = "always";
          maxLength = 99;
        };
      };
    };
  };
}
