{pkgs, ...}: {
  home.packages = with pkgs; [
    brightnessctl
    brillo
    # oct 25 broke
    # calibre
    ffmpeg-full
    inotify-tools
    libnotify
    libwebp
    networkmanagerapplet
    p7zip
    poppler-utils
    pulseaudioFull
    pwvucontrol
    unrar
    unzip
    zip
  ];
}
