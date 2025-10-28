{pkgs, ...}: {
  home.packages = with pkgs; [
    brightnessctl
    brillo
    calibre
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
