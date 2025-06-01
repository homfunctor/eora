# todo: configure declaratively
# temporarily built locally until unstable has it again
{perSystem, ...}: {
  home.packages = with perSystem.self; [
    vivaldi
  ];

  # todo: check if still needed
  # xdg.desktopEntries.vivaldi-stable = {
  #   name = "Vivaldi";
  #   genericName = "Web Browser";
  #   exec = "vivaldi %U --disable-gpu-memory-buffer-video-frames";
  #   icon = "vivaldi";
  # };
}
