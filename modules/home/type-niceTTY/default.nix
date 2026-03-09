# type-niceTTY:
#   nicer tty environment
#   a few apps, neovim
{flake, ...}: {
  imports = flake.lib.genImportsFromDir ./.;
}
