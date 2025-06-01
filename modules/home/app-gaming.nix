{pkgs, ...}: {
  home.packages = with pkgs; [
    ludusavi
    protonplus
    umu-launcher
    winetricks
    wineWowPackages.fonts
    wineWowPackages.stagingFull
  ];
}
