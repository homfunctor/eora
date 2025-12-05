# todo: picard
{pkgs, ...}: {
  home.packages = with pkgs; [
    soundconverter
    strawberry
  ];

  programs.yt-dlp = {
    enable = true;
    settings = {};
    extraConfig = '''';
  };
}
