# todo: modularize for example place archivers in home.app-archivers
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
    file-roller
    gnome-calculator
    gnome-disk-utility
    grim
    grimblast
    gsettings-desktop-schemas
    hyprcursor
    hyprland-qtutils
    hyprsysteminfoPkg
    inotify-tools
    libnotify
    libsForQt5.qt5.qtwayland
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    libwebp
    mission-center
    nemo-with-extensions
    networkmanagerapplet
    nix-search
    nurl
    p7zip
    papers
    pix
    pulseaudioFull
    pwvucontrol
    qt6Packages.qt6ct
    qt6Packages.qtstyleplugin-kvantum
    qt6Packages.qtwayland
    slurp
    unrar
    unzip
    wayland-protocols
    wayland-utils
    wev
    wl-clipboard
    wlr-randr
    zip
  ];
}
