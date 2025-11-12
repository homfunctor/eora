# todo: setup nemo to use kitty
#   script for nemo that uses zipunicode
{pkgs, ...}: {
  home.packages = with pkgs; [
    celluloid
    dconf-editor
    file-roller
    gnome-calculator
    gnome-calendar
    gnome-disk-utility
    grim
    hyprsysteminfo
    loupe
    mission-center
    nemo-with-extensions
    nwg-displays
    showmethekey
    slurp
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlr-randr
  ];
}
