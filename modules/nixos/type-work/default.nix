# type-work:
#   work stuff
{flake, ...}: {
  imports = flake.lib.genImportsFromDir ./.;
}
