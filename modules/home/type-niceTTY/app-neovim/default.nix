{
  flake,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./highlight.nix
    ./keymaps.nix
    ./plugins
    ./settings.nix
    flake.modules.home.stylix-neovim
    inputs.nixvim.homeModules.nixvim
  ];

  home.packages = with pkgs; [
    alejandra
    deadnix
  ];

  programs.nixvim.enable = true;
}
