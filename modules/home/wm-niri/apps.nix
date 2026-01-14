{pkgs, ...}: {
  home.packages = with pkgs; [
    networkmanagerapplet
    systemctl-tui
    wayland-utils
    wl-clipboard-rs
    xwayland-satellite
  ];
}
