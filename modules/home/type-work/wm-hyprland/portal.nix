{pkgs, ...}: {
  xdg.portal = {
    enable = true;

    config = {
      common.default = ["hyprland"];

      hyprland = {
        "org.freedesktop.impl.portal.FileChooser" = "gtk";
        "org.freedesktop.impl.portal.ScreenCast" = "hyprland";
        default = ["hyprland" "gtk"];
      };
    };

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];

    xdgOpenUsePortal = true;
  };
}
