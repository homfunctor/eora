# type-minTTY:
#   bare minimum tty environment
#   goal is to minimize install time
#   have to disable lanzaboote
#   if stripping down to this level
{flake, ...}: {
  imports = flake.lib.genImportsFromDir ./.;
}
