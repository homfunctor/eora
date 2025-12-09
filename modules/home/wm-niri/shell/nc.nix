{config, ...}: {
  programs.noctalia-shell.settings.notifications = {
    enabled = true;

    monitors = [config.home.opts.mainMonitor];
  };
}
