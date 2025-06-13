# nicer tty environment
{flake, ...}: {
  imports = with flake.modules.home; [
    # nicer tty
    app-fish
    app-minimal
    app-neovim
    app-zoxide
  ];
}
