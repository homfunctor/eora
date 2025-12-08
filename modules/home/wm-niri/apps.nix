{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    networkmanagerapplet
    systemctl-tui
    wayland-utils
    xwayland-satellite
  ];
}
