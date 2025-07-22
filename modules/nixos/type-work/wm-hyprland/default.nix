{pkgs, ...}: {
  imports = [
    ./hyprland.nix
    ./keyring.nix
    ./login.nix
  ];

  services.udev.packages = [pkgs.gnome-settings-daemon];
}
