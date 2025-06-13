# nicer minimum tty environment with lanzaboote,
# stylix and chaotic cache available
{flake, ...}: {
  imports = with flake.modules.nixos; [
    app-fish
    chaotic-cachix
    opt-fonts
    opt-hardening
    opt-keyring
    opt-lanzaboote
    opt-lix
    opt-sops
    opt-stylix
    sops-users
  ];
}
