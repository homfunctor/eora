{pkgs, ...}: {
  home.packages = with pkgs; [
    celluloid
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
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlr-randr
  ];
}
