{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.opts.home.nvim.plugins.conform;
in {
  config = mkIf cfg.enable {
    # already installed: alejandra
    home.packages = with pkgs; [
      black
      jq
      shfmt
      stylua
      xmlformat
      yamlfmt
    ];

    programs.nixvim.plugins.conform-nvim = {
      enable = true;

      settings = {
        default_format_opts.lsp_format = "fallback";

        format_on_save = {
          lspFallback = true;
          timeoutMs = 500;
        };

        formatters_by_ft = {
          "_" = [
            "squeeze_blanks"
            "trim_whitespace"
            "trim_newlines"
          ];
          bash = ["shfmt"];
          fish = ["fish_indent"];
          json = ["jq"];
          lua = ["stylua"];
          nix = ["alejandra"];
          python = ["black"];
          rust = ["rustfmt"];
          xml = ["xmlformat"];
          yaml = ["yamlfmt"];
        };

        notify_on_error = true;
      };
    };
  };
}
