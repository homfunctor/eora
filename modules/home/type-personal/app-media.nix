{pkgs, ...}: {
  home.packages = with pkgs; [
    picard
    soundconverter
    strawberry
    uget
  ];

  programs.yt-dlp = {
    enable = true;
    settings = {};
    extraConfig = '''';
  };
}
