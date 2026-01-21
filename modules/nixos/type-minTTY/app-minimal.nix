# apps for minimal tty system
{
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (lib.hiPrio uutils-coreutils-noprefix) # we rusty here
    just
    nix-output-monitor
    sbctl # for lanzaboote
    wget
  ];
}
