{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.opts.home.nvim.plugins.lsp;
in {
  config.programs.nixvim.plugins = mkIf cfg.enable {
    lsp-format.enable = true;

    lsp = {
      enable = true;

      inlayHints = true;

      servers = {
        basedpyright.enable = true;
        bashls.enable = true;
        fish_lsp.enable = true;
        jsonls.enable = true;
        lua_ls.enable = true;
        marksman.enable = true;
        nixd = {
          enable = true;
          settings = {
            diagnostic.settings.suppress = ["sema-escaping-with"];
            formatting.command = ["${pkgs.alejandra}/bin/alejandra"];
            nixpkgs.expr = "import <nixpkgs> {}";
            options = {
              home_manager.expr = "(builtins.getFlake (\"git+file://\" + toString ./.)).homeConfigurations.options";
              nixos.expr = "(builtins.getFlake (\"git+file://\" + toString ./.)).nixosConfigurations.options";
            };
          };
        };
        statix.enable = true;
        texlab.enable = true;
        typos_lsp = {
          enable = true;
          extraOptions.init_options.diagnosticSeverity = "Hint";
        };
      };
    };
  };
}
