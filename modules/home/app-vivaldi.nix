# todo: configure declaratively
{
  programs.vivaldi.enable = true;

  xdg.desktopEntries.vivaldi-stable = {
    name = "Vivaldi";
    genericName = "Web Browser";
    exec = "vivaldi %U --disable-gpu-memory-buffer-video-frames";
    icon = "vivaldi";
  };
}
