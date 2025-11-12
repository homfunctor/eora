{
  osConfig,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland.portalPackage = osConfig.nixos.opts.hypr.portal.pkg;

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    xdgOpenUsePortal = true;
  };
}
