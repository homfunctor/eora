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
    # DXVK_ENABLE_NVAPI = "0";
    PROTON_ENABLE_WAYLAND = "1";
    WINEDLLOVERRIDES = "winemenubuilder.exe=d";
    # WINEWAYLAND_DISABLE_XWAYLAND = "1";
    # WINE_VK_VULKAN_ONLY = "1";
  };
}
