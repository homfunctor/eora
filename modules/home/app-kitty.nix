# todo: adjust settings further
{
  programs.kitty = {
    enable = true;

    settings = {
      confirm_os_window_close = 0;
      copy_on_select = "clipboard";
      enable_audio_bell = false;
      scrollback_lines = 10000;
      selection_foreground = "none";
      selection_background = "none";
      shell = "fish";
      show_hyperlink_targets = "no";
      window_padding_width = 10;
      url_style = "none";
      underline_hyperlinks = "never";
    };
  };
}
