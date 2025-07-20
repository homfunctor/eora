{pkgs, ...}: {
  home.packages = with pkgs; [
    heroic
    ludusavi
    lutris
    protonplus
    umu-launcher
    wineWowPackages.fonts
    wineWowPackages.waylandFull
    winetricks
  ];
}
