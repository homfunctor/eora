# todo: check plugins work correctly
#   transparency in alacritty?
#   thinner smartcolumn?
#   vimtex settings
#   check rymrgand setup for performance
#   keybinds, again
#   snacks settings
#   check how blink+conform works without lsp-format
{
  flake,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    flake.modules.home.stylix-neovim
    inputs.nixvim.homeManagerModules.nixvim
    ./autocmd.nix
    ./keymaps.nix
    ./opts.nix
    ./plugins
    ./settings.nix
  ];

  home.packages = with pkgs; [
    alejandra
    deadnix
  ];

  programs.nixvim.enable = true;
}
