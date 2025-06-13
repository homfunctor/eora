# nicer minimum tty environment with lanzaboote,
# stylix and chaotic cache available
{flake, ...}: {
  imports = with flake.modules.nixos; [
    app-fish
    chaotic-cachix
    opt-fonts
    opt-lanzaboote
    opt-lix
    opt-stylix
    sops-users
  ];

  programs = {
    dconf.enable = true;
  };
}
