{pkgs, ...}: {
  home.packages = with pkgs; [
    gimp3
    inkscape
    kdePackages.kolourpaint
    xournalpp
  ];
}
