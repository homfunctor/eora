# pseudo desktop environment
{
  perSystem,
  pkgs,
  ...
}: let
  hyprsysteminfoPkg = perSystem.hyprsysteminfo.hyprsysteminfo;
in {
  home.packages = with pkgs; [
    brightnessctl
    ffmpeg-full
    ffmpegthumbnailer
    gnome-disk-utility
    gsettings-desktop-schemas
    grim
    grimblast
    hyprcursor
    hyprland-qtutils
    hyprsysteminfoPkg
    inotify-tools
    libsForQt5.qt5.qtwayland
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    libnotify
    libwebp
    mission-center
    networkmanagerapplet
    nix-search
    nurl
    p7zip
    pulseaudioFull
    pwvucontrol
    qt6Packages.qt6ct
    qt6Packages.qtstyleplugin-kvantum
    qt6Packages.qtwayland
    slurp
    tldr
    unrar
    unzip
    wayland-utils
    wayland-protocols
    wev
    wl-clipboard
    wlr-randr
    zip
  ];
}
