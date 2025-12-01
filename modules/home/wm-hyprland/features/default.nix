{flake, ...}: {
  imports = [
    ./app-quickshell
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    flake.modules.home.app-hyprpanel
  ];
}
