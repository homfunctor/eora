{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.opts.home.nvim.lint;
in {
  config.programs.nixvim.plugins.lint = mkIf cfg.enable {
    enable = true;

    lintersByFt = {
      bash = ["shellcheck"];
      fish = ["fish"];
      json = ["jsonlint"];
      lua = ["luacheck"];
      markdown = ["markdownlint"];
      nix = [
        "deadnix"
        "nix"
      ];
      python = ["basedpyright"];
      sh = ["shellcheck"];
    };
  };
}
