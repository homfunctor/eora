# todo: setup nautilus to use kitty
#   script for nautilus that uses zipunicode
{pkgs, ...}: {
  home.packages = with pkgs; [
    celluloid
    dconf-editor
    file-roller
    gnome-calculator
    gnome-calendar
    gnome-disk-utility
    loupe
    nautilus
    nautilus-open-any-terminal
    nautilus-python
    papers
    wdisplays
  ];
}
