# todo: setup nautilus to use alacritty
#   script for nautilus that uses zipunicode
{pkgs, ...}: {
  home.packages = with pkgs; [
    file-roller
    gnome-calculator
    gnome-disk-utility
    # sometimes you just want a boring basic gui for a quick edit
    gnome-text-editor
    gsettings-desktop-schemas
    loupe
    nautilus
    nautilus-open-any-terminal
    nautilus-python
    papers
  ];
}
