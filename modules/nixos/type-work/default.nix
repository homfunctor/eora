# work environment layered on top of minimal/nicer tty
{config, ...}: {
  imports = [
    ./chaotic-kernel.nix
    ./wm-hyprland
  ];
}
