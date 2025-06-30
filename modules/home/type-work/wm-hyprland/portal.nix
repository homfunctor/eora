{pkgs, ...}: {
  xdg.portal = {
    enable = true;

    config = {
      common.default = [
        "gtk"
        "hyprland"
      ];

      hyprland."org.freedesktop.impl.portal.FileChooser" = "gtk";
    };

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];

    xdgOpenUsePortal = true;
  };
}
