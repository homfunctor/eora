# todo: setup nautilus to use kitty
#   script for nautilus that uses zipunicode
{pkgs, ...}: {
  home.packages = with pkgs; [
    dconf-editor
    file-roller
    gnome-calculator
    gnome-calendar
    gnome-disk-utility
    gsettings-desktop-schemas
    loupe
    nautilus
    nautilus-open-any-terminal
    nautilus-python
    papers
    wdisplays
  ];
}
