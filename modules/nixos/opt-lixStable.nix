{pkgs, ...}: {
  nix.package = pkgs.lixPackageSets.stable.lix;

  nixpkgs.overlays = [
    (_: prev: {
      inherit
        (prev.lixPackageSets.stable)
        nixpkgs-review
        nix-eval-jobs
        nix-fast-build
        colmena
        ;
    })
  ];
}
