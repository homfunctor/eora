{
  flake,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    flake.modules.home.stylix-neovim
    inputs.nixvim.homeModules.nixvim
    ./highlight.nix
    ./keymaps.nix
    ./plugins
    ./settings.nix
  ];

  home.packages = with pkgs; [
    alejandra
    deadnix
  ];

  programs.nixvim.enable = true;
}
