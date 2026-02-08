{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    dconf-editor
    eog
    gnome-calculator
    gnome-calendar
    gnome-disk-utility
    mission-center
    nemo-with-extensions # just feels so good
    peazip
    showmethekey
    vlc # good stuff, nostalgic
  ];

  # want shell integration, so must be enabled after niceTTY
  programs = {
    niri.settings.binds = with config.lib.niri.actions; {
      "Mod+Ctrl+Shift+C".action.spawn = lib.getExe pkgs.gnome-calculator;
    };

    eza =
      {
        enable = true;
      }
      // config.home.opts.apps.shell.shellIntegration;

    # todo: theming broken rn
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

  services.network-manager-applet.enable = true;
}
