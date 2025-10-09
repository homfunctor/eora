{
  inputs,
  pkgs,
  ...
}:
inputs.treefmt-nix.lib.mkWrapper pkgs {
  projectRootFile = "flake.nix";

  programs = {
    alejandra.enable = true;
    deadnix.enable = true;
    jsonfmt.enable = true;
    just.enable = true;
    rustfmt.enable = true;
    statix.enable = true;
  };
}
