{config, ...}: {
  services.hyprpaper = {
    enable = true;
    settings =
      {
        ipc = "off";
        splash = false;
      }
      // config.home.opts.hpl.paperOpts.settings;
  };
}
