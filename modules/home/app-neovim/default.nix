{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./autocmd.nix
    ./keymaps.nix
    ./options.nix
    ./plugins
  ];

  home.packages = with pkgs; [
    alejandra
    deadnix
  ];

  programs.nixvim.enable = true;
}
