{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.conform;
in {
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      black
      jq
      prettierd
      python313Packages.sqlparse
      shfmt
      sqls
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

        formatters = {
          sqlformat = {
            args = [
              "--reindent"
              "--use_space_around_operators"
              "--wrap_after"
              "80"
              "--indent_width"
              "2"
              "-"
            ];
            command = "sqlformat";
            stdin = true;
          };
        };

        formatters_by_ft = {
          "_" = [
            "squeeze_blanks"
            "trim_newlines"
            "trim_whitespace"
          ];
          bash = ["shfmt"];
          fish = ["fish_indent"];
          json = ["jq"];
          lua = ["stylua"];
          markdown = ["prettierd" "prettier"];
          nix = ["alejandra"];
          python = ["black"];
          rust = ["rustfmt"];
          sh = ["shfmt"];
          sql = ["sqlformat"];
          xml = ["xmlformat"];
          yaml = ["yamlfmt"];
        };

        notify_on_error = true;
      };
    };
  };
}
