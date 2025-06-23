# apps for minimal tty system
{
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    just
    killall
    nix-output-monitor
    sbctl # for lanzaboote
    # make sure these actually get used
    (lib.hiPrio uutils-coreutils-noprefix)
    wget
  ];
}
