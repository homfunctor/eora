# todo: check XDG_DESKTOP_PORTAL_DIR
{
  osConfig,
  ...
}: let
  niriPortalPkg = osConfig.nixos.opts.niri.portal.pkg;
in {
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    config.niri = {
      "org.freedesktop.impl.portal.Access" = ["gtk"];
      "org.freedesktop.impl.portal.Notification" = ["gtk"];
      "org.freedesktop.impl.portal.Secret" = ["gnome-keyring"];
      default = ["gtk"];
    };

    configPackages = [niriPortalPkg];

    extraPortals = [niriPortalPkg];
  };
}
