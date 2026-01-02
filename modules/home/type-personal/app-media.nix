{pkgs, ...}: {
  home.packages = with pkgs; [
    # gdown
    picard
    soundconverter
    strawberry
    # uget
  ];

  programs.yt-dlp = {
    enable = true;
    settings = {};
    extraConfig = '''';
  };
}
