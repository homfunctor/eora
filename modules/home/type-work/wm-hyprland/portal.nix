{pkgs, ...}: {
  xdg.portal = {
    enable = true;

    config = {
      common.default = ["hyprland"];

      hyprland = {
        "org.freedesktop.impl.portal.FileChooser" = "gtk";
        "org.freedesktop.impl.portal.ScreenCast" = "hyprland";
        default = ["gtk" "hyprland"];
      };
    };

    extraPortals = [pkgs.xdg-desktop-portal-gtk];

    xdgOpenUsePortal = true;
  };
}
