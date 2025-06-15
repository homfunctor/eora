{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.opts.home.nvim.precognition;
in {
  programs.nixvim = mkIf cfg.enable {
    extraPlugins = with pkgs.vimPlugins; [precognition-nvim];

    extraConfigLua = ''
      require('precognition').setup({})
    '';
  };
}
