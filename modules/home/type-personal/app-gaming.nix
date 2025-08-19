{pkgs, ...}: {
  home.packages = with pkgs; [
    heroic
    jdk
    libglvnd
    ludusavi
    lutris
    protonplus
    umu-launcher
    wineWowPackages.fonts
    wineWowPackages.waylandFull
    winetricks
  ];
}
