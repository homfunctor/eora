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
          sh = ["shfmt"];
          xml = ["xmlformat"];
          yaml = ["yamlfmt"];
        };

        notify_on_error = true;
      };
    };
  };
}
