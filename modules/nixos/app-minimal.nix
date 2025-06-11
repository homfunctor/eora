# apps for minimal tty system
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    just
    nix-output-monitor
    sbctl # for lanzaboote
    uutils-coreutils-noprefix
    vim
    wget
  ];
}
