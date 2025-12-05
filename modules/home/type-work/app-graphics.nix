{pkgs, ...}: {
  home.packages = with pkgs; [
    gimp3
    inkscape
    kdePackages.kolourpaint
    # xournalpp
  ];
  xdg.mimeApps = {
    associations.added."image/x-dds" = "gimp.desktop";
    defaultApplications."image/x-dds" = "gimp.desktop";
  };
}
