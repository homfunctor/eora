# the only place neovim plugins are imported
# elsewhere any mention of them is automatic or in a list
{
  imports = [
    ./blink.nix
    ./bufferline.nix
    ./colorizer.nix
    ./conform.nix
    ./illuminate.nix
    ./leap.nix
    ./lint.nix
    ./lsp.nix
    ./lualine.nix
    ./mini.nix
    ./noice.nix
    ./nvim-surround.nix
    ./precognition.nix
    ./render-markdown.nix
    ./rustaceanvim.nix
    ./smartcolumn.nix
    ./snacks.nix
    ./treesitter.nix
    ./undotree.nix
    ./vimtex.nix
    ./web-devicons.nix
    ./which-key.nix
    ./yazi.nix
  ];

  # todo: sops and a few other things need this?
  programs.nixvim.coloschemes.base16.enable = true;
}
