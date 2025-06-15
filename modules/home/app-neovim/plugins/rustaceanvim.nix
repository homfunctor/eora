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
          command = "clippy";
          allTargets = true;
        };
        inlayHints = {
          maxLength = 99;
          lifetimeElisionHints.enable = "always";
        };
      };
    };
  };
}
