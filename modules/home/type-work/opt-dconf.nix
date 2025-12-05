# todo: more
{config, ...}: {
  dconf = {
    enable = true;

    settings = {
      "org/freedesktop/appearance".color-scheme = 1;

      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/desktop/privacy" = {
        remember-app-usage = false;
        remember-recent-files = false;
      };

      "org/gtk/gtk4/settings/file-chooser".sort-directories-first = true;
      "org/gtk/settings/file-chooser" = {
        sort-directories-first = true;
        date-format = "with-time";
      };

      "org/cinnamon/desktop/applications/terminal" = {
        exec = config.home.opts.apps.terminal.exe;
      };
    };
  };
}
