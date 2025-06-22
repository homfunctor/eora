# bare minimum tty environment
{
  imports = [
    ./app-git.nix
    ./opt-minimal.nix
  ];

  programs.home-manager.enable = true;
}
