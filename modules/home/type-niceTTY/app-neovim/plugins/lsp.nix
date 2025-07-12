{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.home.opts.nvim.plugins.lsp;
in {
  programs.nixvim.plugins = lib.mkIf cfg.enable {
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
            formatting.command = ["${lib.getExe pkgs.alejandra}"];
            nixpkgs.expr = "import <nixpkgs> {}";
            options = {
              home_manager.expr = "(builtins.getFlake (\"git+file://\" + toString ./.)).homeConfigurations.options";
              nixos.expr = "(builtins.getFlake (\"git+file://\" + toString ./.)).nixosConfigurations.options";
            };
          };
        };
        statix.enable = true;
        typos_lsp.enable = true;
      };
    };
  };
}
