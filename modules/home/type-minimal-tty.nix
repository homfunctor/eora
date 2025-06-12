# bare minimum tty environment
{flake, ...}: {
  imports = with flake.modules.home; [
    # minimal tty
    app-fish
    app-git
    app-minimal
    # temporarily disabled while i make plugins modular
    # app-neovim
    app-zoxide
    opt-keyring
    opt-mime
    opt-minimal
    opt-stylix
    opts
  ];
}
