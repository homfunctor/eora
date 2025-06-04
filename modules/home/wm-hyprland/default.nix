{perSystem, ...}: let
  hyprlandPkg = perSystem.hyprland.hyprland;
in {
  imports = [
    ./binds.nix # keybinds common to all types
    ./boot.nix # startup settings
    ./dconf.nix # some dconf settings
    ./env.nix # environment settings
    ./hypridle.nix # hypridle settings
    ./hyprpaper.nix # common hyprpaper settings
    ./hyprlock.nix # hyprlock settings
    ./packages.nix # packages
    ./polkit.nix # polkit settings (mate polkit)
    ./portal.nix # portal settings (hyprland-portal)
    ./settings.nix # settings common to all types
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprlandPkg;
    xwayland.enable = true;
  };
}
