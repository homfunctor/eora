{pkgs, ...}: {
  home.packages = with pkgs; [
    dconf-editor
    file-roller
    gnome-calculator
    gnome-calendar
    gnome-disk-utility
    grim
    loupe
    mission-center
    nemo-with-extensions
    showmethekey
    slurp
    vlc
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlr-randr
  ];
}
