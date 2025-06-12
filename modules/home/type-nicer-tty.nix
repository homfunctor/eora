# nicer tty environment
{flake, ...}: {
  imports = with flake.modules.home; [
    # nicer tty
    app-fish
    # temporarily disabled while i make plugins modular
    # app-neovim
    opt-keyring
    opt-mime
  ];
}
