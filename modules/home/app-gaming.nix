{pkgs, ...}: {
  home.packages = with pkgs; [
    ludusavi
    protonplus
    umu-launcher
    wineWowPackages.fonts
    wineWowPackages.stagingFull
    winetricks
  ];
}
