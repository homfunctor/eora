# nicer tty environment
{
  imports = [
    ./app-minimal.nix
    ./app-neovim
    ./app-starship.nix
    ./app-yazi.nix
    ./app-zoxide.nix
    ./opt-dconf.nix
    ./opt-fonts.nix
  ];
}
