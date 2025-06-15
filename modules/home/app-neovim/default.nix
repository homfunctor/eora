# todo: refactor once again
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
