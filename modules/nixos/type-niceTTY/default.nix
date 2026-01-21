# nicer minimum tty environment with lanzaboote, stylix
# and chaotic cache available
{
  imports = [
    ./chaotic-cache.nix
    ./opt-fonts.nix
    ./opt-lanzaboote.nix
    ./opt-stylix.nix
    ./sops-users.nix
  ];

  # todo: put this elsewhere
  programs.dconf.enable = true;
}
