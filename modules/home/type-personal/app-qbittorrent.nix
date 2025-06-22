{pkgs, ...}: {
  home.packages = with pkgs; [
    protonvpn-gui
    qbittorrent-enhanced-nox
  ];
}
