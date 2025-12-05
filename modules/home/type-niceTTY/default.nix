# nicer tty environment
{
  imports = [
    ./app-minimal.nix
    ./app-neovim
  ];

  stylix.enableReleaseChecks = false;
}
