# type-work:
#   work environment layered on top of minimal/nice tty
{flake, ...}: {
  imports = flake.lib.genImportsFromDir ./.;
}
