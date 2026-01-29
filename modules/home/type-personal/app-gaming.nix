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
    steamcmd
    umu-launcher
    wineWowPackages.fonts
    wineWowPackages.waylandFull
    winetricks
  ];

  programs.niri.settings.environment = {
    # wine and wayland what a time to be alive
    PROTON_ENABLE_WAYLAND = "1";
    # no messing with associations
    WINEDLLOVERRIDES = "winemenubuilder.exe=d";
  };
}
