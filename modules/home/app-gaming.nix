{pkgs, ...}: {
  home.packages = with pkgs; [
    ludusavi
    umu-launcher
    wineWowPackages.fonts
    wineWowPackages.stagingFull
    winetricks
  ];
}
