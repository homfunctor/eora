# work environment layered on top of minimal/nicer tty
{flake, ...}: {
  imports = with flake.modules.nixos; [
    app-nix-ld
    chaotic-kernel
    opt-keyring
    wm-hyprland
  ];

  programs.seahorse.enable = true;
}
