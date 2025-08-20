{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.sapadal.modules.home.private-apps];

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
