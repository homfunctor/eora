# todo: check it works right
{pkgs, ...}: {
  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
    package = pkgs.opentabletdriver;
  };
}
