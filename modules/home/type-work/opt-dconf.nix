# todo: redo with nemo
{
  dconf = {
    enable = true;

    settings = {
      "org/freedesktop/appearance".color-scheme = 1;

      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/desktop/privacy".remember-recent-files = false;

      # "org/gnome/nautilus/icon-view".default-zoom-level = "small-plus";
      # "org/gnome/nautilus/preferences" = {
      #   show-create-link = true;
      # };

      "org/gtk/gtk4/settings/file-chooser".sort-directories-first = true;
      "org/gtk/settings/file-chooser" = {
        sort-directories-first = true;
        date-format = "with-time";
      };
    };
  };
}
