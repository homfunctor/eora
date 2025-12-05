{pkgs, ...}: {
  home.packages = with pkgs; [
    brightnessctl
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
