{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
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
