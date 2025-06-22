{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.home.opts.nvim.plugins.lint;
in {
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      shellcheck
      yamllint
    ];

    programs.nixvim.plugins.lint = {
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
        rust = ["clippy"];
        sh = ["shellcheck"];
        yaml = ["yamllint"];
      };
    };
  };
}
