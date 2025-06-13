# work environment layered on top of minimal tty
{flake, ...}: {
  imports = with flake.modules.nixos; [
    app-nix-ld
    chaotic-kernel
    dewm
    opt-greeter
    sops-users
  ];
}
