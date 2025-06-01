{pkgs, ...}: {
  home.packages = with pkgs; [
    geogebra6
    octaveFull
    rstudio
  ];
}
