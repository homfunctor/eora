{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.sapadal.modules.home.private-apps];

  home.packages = with pkgs; [
    hashdeep
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
