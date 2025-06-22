# todo: configure declaratively
{pkgs, ...}: {
  home.packages = with pkgs; [
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
