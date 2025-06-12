# bare minimum tty environment with lanzaboote,
# stylix and chaotic cache available
{flake, ...}: {
  imports = with flake.modules.nixos; [
    app-fish
    app-minimal
    chaotic-cachix
    opt-boot
    opt-disko
    opt-fonts
    opt-hardening
    opt-home
    opt-keyring
    opt-lanzaboote
    opt-locale
    opt-networking
    opt-nix
    opt-services
    opt-sops
    opt-stylix
    opt-users
    opts
    sops-users
  ];
}
