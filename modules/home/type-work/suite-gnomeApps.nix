# todo: setup nautilus to use alacritty
#   script for nautilus that uses zipunicode
{pkgs, ...}: {
  home.packages = with pkgs; [
    file-roller
    gnome-calculator
    gnome-disk-utility
    gnome-text-editor
    gsettings-desktop-schemas
    nautilus
    nautilus-open-any-terminal
    nautilus-python
    papers
  ];
}
