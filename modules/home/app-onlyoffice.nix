{pkgs, ...}: {
  programs.onlyoffice = {
    enable = true;
    package = pkgs.onlyoffice-bin_latest;
    # todo: configure settings here
    # settings = {};
  };
}
