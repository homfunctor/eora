# nicer tty environment
{flake, ...}: {
  imports = with flake.modules.home; [
    # nicer tty
    app-fish
    app-neovim
    opt-keyring
    opt-mime
  ];
}
