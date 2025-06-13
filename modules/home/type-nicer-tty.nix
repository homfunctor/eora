# nicer tty environment
{flake, ...}: {
  imports = with flake.modules.home; [
    # nicer tty
    app-minimal
    app-neovim
    app-starship
    app-yazi
    app-zoxide
  ];
}
