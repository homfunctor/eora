# apps for minimal tty system
{
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    just
    nix-output-monitor
    sbctl # for lanzaboote
    (lib.hiPrio uutils-coreutils-noprefix)
    wget
  ];
}
