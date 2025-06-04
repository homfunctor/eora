# todo: adjust settings further
{
  programs.kitty = {
    enable = true;

    settings = {
      confirm_os_window_close = 0;
      copy_on_select = "clipboard";
      enable_audio_bell = false;
      scrollback_lines = 10000;
      selection_background = "none";
      selection_foreground = "none";
      shell = "fish";
      show_hyperlink_targets = "no";
      underline_hyperlinks = "never";
      url_style = "none";
      window_padding_width = 10;
    };
  };
}
