# bare minimum tty environment
{flake, ...}: {
  imports = with flake.modules.home; [
    # minimal tty
    app-git
    app-minimal
    app-zoxide
    opt-minimal
    opts
  ];
}
