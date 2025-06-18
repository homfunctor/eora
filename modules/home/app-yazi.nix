# todo: configure (make third column bigger)
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    settings.manager = {
      show_hidden = true;
      sort_dir_first = true;
    };
  };
}
