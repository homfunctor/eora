{pkgs, ...}: {
  home.packages = with pkgs; [
    libsecret
    networkmanagerapplet
    systemctl-tui
    wayland-utils
    xsel
    xwayland-satellite
  ];
}
