{pkgs, ...}: {
  home.packages = with pkgs; [
    brightnessctl
    brillo
    ffmpeg-full
    inotify-tools
    libwebp
    networkmanagerapplet
    p7zip
    pulseaudioFull
    pwvucontrol
    unrar
    unzip
    zip
  ];
}
