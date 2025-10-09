{
  config,
  lib,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.rustaceanvim;
in {
  programs.nixvim.plugins.rustaceanvim = lib.mkIf cfg.enable {
    enable = true;
    settings = {
      server = {
        default_settings.rust-analyzer = {
          cargo = {
            buildScripts.enable = true;
            features = "all";
          };

          check = {
            allTargets = true;
            command = "clippy";
          };

          checkOnSave = true;

          diagnostics = {
            enable = true;
            styleLints.enable = true;
          };

          files.excludeDirs = [
            ".cargo"
            ".direnv"
            ".git"
            "node_modules"
            "target"
          ];

          inlayHints = {
            bindingModeHints.enable = true;
            closureReturnTypeHints.enable = "always";
            closureStyle = "rust_analyzer";
            discriminantHints.enable = "always";
            expressionAdjustmentHints.enable = "always";
            implicitDrops.enable = true;
            lifetimeElisionHints.enable = "always";
            rangeExclusiveHints.enable = true;
          };

          procMacro.enable = true;

          rustc.source = "discover";
        };
      };

      tools.enable_clippy = true;
    };
  };
}
