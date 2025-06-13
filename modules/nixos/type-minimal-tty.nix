# bare minimum tty environment
{flake, ...}: {
  imports = with flake.modules.nixos; [
    app-minimal
    opt-boot
    opt-disko
    opt-home
    opt-locale
    opt-networking
    opt-nix
    opt-services
    opt-sops
    opt-users
    opts
  ];
}
