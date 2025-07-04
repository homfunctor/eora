# nicer minimum tty environment with lanzaboote, stylix
# and chaotic cache available
{
  imports = [
    ./app-fish.nix
    ./chaotic-cachix.nix
    ./opt-fonts.nix
    ./opt-lanzaboote.nix
    ./opt-lix.nix
    ./opt-services.nix
    ./opt-stylix.nix
    ./sops-users.nix
  ];

  programs.dconf.enable = true;
}
