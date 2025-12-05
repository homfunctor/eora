{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    dconf-editor
    file-roller
    gnome-calculator
    gnome-calendar
    gnome-disk-utility
    loupe
    mission-center
    nemo-with-extensions # just feels so good
    showmethekey
    vlc # good stuff, nostalgic
  ];

  # want shell integration, so must be enabled after niceTTY
  programs = {
    eza =
      {
        enable = true;
      }
      // config.home.opts.apps.shell.shellIntegration;

    yazi =
      {
        enable = true;
        settings.manager = {
          ratio = [1 2 4];
          show_hidden = true;
          show_symlink = true;
          sort_by = "alphabetical";
          sort_dir_first = true;
          sort_sensitive = false;
        };
      }
      // config.home.opts.apps.shell.shellIntegration;

    zoxide =
      {
        enable = true;
      }
      // config.home.opts.apps.shell.shellIntegration;
  };
}
