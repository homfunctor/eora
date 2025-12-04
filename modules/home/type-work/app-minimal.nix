{pkgs, ...}: {
  home.packages = with pkgs; [
    cosmic-ext-calculator
    cosmic-ext-tweaks
    cosmic-files
    cosmic-settings
    dconf-editor
    file-roller
    gnome-calculator
    gnome-calendar
    gnome-disk-utility
    grim
    loupe
    mission-center
    showmethekey
    slurp
    vlc
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlr-randr
  ];
}
