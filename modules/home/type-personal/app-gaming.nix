{pkgs, ...}: {
  home.packages = with pkgs; [
    angle
    heroic
    jdk
    ludusavi
    lutris
    protonplus
    umu-launcher
    wineWowPackages.fonts
    wineWowPackages.waylandFull
    winetricks
  ];
}
