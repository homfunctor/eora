{pkgs, ...}: {
  imports = [
    ./bar.nix
    ./notBar.nix
    ./themeColors.nix
    ./themeUI.nix
  ];

  programs.hyprpanel = {
    enable = true;
    package = pkgs.hyprpanel;
  };
}
