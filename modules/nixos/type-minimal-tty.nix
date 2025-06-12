# bare minimum tty environment
{flake, ...}: {
  imports = with flake.modules.nixos; [
    app-minimal
    opt-boot
    opt-disko
    opt-hardening
    opt-home
    opt-locale
    opt-networking
    opt-nix
    opt-services
    opt-users
    opts
  ];
}
