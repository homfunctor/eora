{
  perSystem,
  pkgs,
  ...
}: let
  hyprsysteminfoPkg = perSystem.hyprsysteminfo.hyprsysteminfo;
in {
  home.packages = with pkgs; [
    grim
    grimblast
    hyprcursor
    hyprland-qtutils
    hyprpicker
    hyprsysteminfoPkg
    showmethekey
    slurp
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlr-randr
  ];
}
