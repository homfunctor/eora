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
    loupe
    nemo-with-extensions
    papers
    wdisplays
  ];
}
