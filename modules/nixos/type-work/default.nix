# work environment layered on top of minimal/nicer tty
{
  imports = [
    ./chaotic-kernel.nix
    ./opt-keyring.nix
    ./wm-hyprland.nix
  ];

  programs.seahorse.enable = true;
}
