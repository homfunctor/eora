{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.lint;
in {
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      jsonfmt
      lua54Packages.luacheck
      markdownlint-cli
      shellcheck
      yamllint
    ];

    programs.nixvim.plugins.lint = {
      enable = true;

      lintersByFt = {
        bash = ["shellcheck"];
        fish = ["fish"];
        json = ["jsonfmt"];
        lua = ["luacheck"];
        markdown = ["markdownlint"];
        nix = [
          "deadnix"
          "nix"
          "statix"
        ];
        python = ["basedpyright"];
        rust = ["clippy"];
        sh = ["shellcheck"];
        yaml = ["yamllint"];
      };
    };
  };
}
