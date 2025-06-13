# bare minimum tty environment
{flake, ...}: {
  imports = with flake.modules.home; [
    # minimal tty
    app-git
    opt-minimal
    opts
  ];

  programs.home-manager.enable = true;
}
