# apps for minimal tty system
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    just
    killall
    nix-output-monitor
    sbctl # for lanzaboote
    uutils-coreutils-noprefix
    wget
  ];
}
