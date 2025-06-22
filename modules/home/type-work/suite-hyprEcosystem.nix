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
    hyprsysteminfoPkg
    slurp
    wayland-protocols
    wayland-utils
    wev
    wl-clipboard
    wlr-randr
  ];
}
