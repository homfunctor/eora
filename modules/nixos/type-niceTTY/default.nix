# type-niceTTY:
#   nicer minimum tty environment with lanzaboote, stylix
{flake, ...}: {
  imports = flake.lib.genImportsFromDir ./.;
}
