{
  osConfig,
  pkgs,
  ...
}: {
  programs.hyprland.portalPackage = osConfig.portal.pkg;

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    xdgOpenUsePortal = true;
  };
}
