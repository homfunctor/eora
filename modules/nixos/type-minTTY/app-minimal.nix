# apps for minimal tty system
{
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (lib.hiPrio uutils-coreutils-noprefix)
    just
    nix-output-monitor
    sbctl # for lanzaboote
    wget
  ];
}
