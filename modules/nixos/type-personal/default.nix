# type-personal:
#   it's personal
{flake, ...}: {
  imports = flake.lib.genImportsFromDir ./.;
}
