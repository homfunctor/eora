{pkgs, ...}: {
  nixos.opts.iconTheme = {
    name = "Vimix-black-dark";
    package = pkgs.vimix-icon-theme;
  };
}
