{pkgs, ...}: {
  nixos.opts.iconTheme = {
    name = "Obsidian-Gray";
    package = pkgs.iconpack-obsidian;
  };
}
