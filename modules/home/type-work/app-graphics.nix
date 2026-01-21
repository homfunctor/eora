{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gimp3
    inkscape
    kdePackages.kolourpaint
    xournalpp
  ];

  xdg.mimeApps = {
    associations.added."image/x-dds" = "gimp.desktop";
    defaultApplications."image/x-dds" = "gimp.desktop";
  };

  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+Ctrl+Shift+J".action.spawn = lib.getExe pkgs.xournalpp;
  };
}
