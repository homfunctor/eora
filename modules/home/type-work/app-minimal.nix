{pkgs, ...}: {
  home.packages = with pkgs; [
    celluloid
    dconf-editor
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
