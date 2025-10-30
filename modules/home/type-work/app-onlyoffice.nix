{pkgs, ...}: {
  programs.onlyoffice = {
    enable = true;
    package = pkgs.onlyoffice-desktopeditors;
    # todo: configure settings here
    # settings = {};
  };
}
