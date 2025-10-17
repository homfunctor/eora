{config, ...}: {
  programs.kitty = {
    enable = true;

    keybindings = {};

    settings = {
      confirm_os_window_close = "0";
      copy_on_select = "clipboard";
      cursor_shape = "block";
      cursor_trail = 3;
      cursor_trail_decay = "0.1 0.4";
      cursor_underline_thickness = 3;
      disable_ligatures = "never";
      enable_audio_bell = false;
      open_url_with = "default";
      remember_window_size = "no";
      scrollback_lines = 10000;
      shell = config.home.opts.apps.shell.exe;
      update_check_interval = 0;
      url_style = "curly";
      window_padding_width = 10;
    };

    shellIntegration.enableFishIntegration = true;

    extraConfig = ''
    '';
  };
}
