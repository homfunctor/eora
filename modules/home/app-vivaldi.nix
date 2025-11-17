# i just backup everything and copy paste it hangs like an albatross around my neck
{pkgs, ...}: {
  home.packages = with pkgs; [
    vivaldi
    vivaldi-ffmpeg-codecs
  ];
}
