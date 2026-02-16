# todo: remake once again from scratch
# the only place neovim plugins are imported manually
# this is for easy disabling of stuff
# elsewhere any mention of them is automatic or in a list
{
  imports = [
    ./blink.nix
    ./bufferline.nix
    ./colorizer.nix
    ./conform.nix
    ./lint.nix
    ./lsp.nix
    ./lualine.nix
    ./mini.nix
    ./noice.nix
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
  ];
}
