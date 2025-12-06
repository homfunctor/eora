{pkgs, ...}: {
  home.packages = with pkgs; [
    ffmpeg-full
    inotify-tools
    libnotify
    libwebp
    p7zip
    poppler-utils
    pulseaudioFull
    pwvucontrol
    unrar
    unzip
    zip
  ];
}
