{pkgs, ...}: {
  home.packages = with pkgs; [
    grim
    grimblast
    hyprcursor
    hyprland-qtutils
    hyprpicker
    hyprsysteminfo
    showmethekey
    slurp
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlr-randr
  ];
}
