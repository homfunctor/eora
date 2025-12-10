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

  programs.niri.settings.environment = {
    DXVK_ENABLE_NVAPI = "0";
    WINEDLLOVERRIDES = "winemenubuilder.exe=d";
    WINEWAYLAND_DISABLE_XWAYLAND = "1";
    WINE_VK_VULKAN_ONLY = "1";
  };
}
