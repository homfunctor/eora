{pkgs, ...}: {
  nixos.opts.iconTheme = {
    name = "Flat-Remix-Black-Dark";
    package = pkgs.flat-remix-icon-theme;
  };
}
