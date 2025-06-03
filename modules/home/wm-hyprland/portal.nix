{pkgs, ...}: {
  xdg.portal = {
    enable = true;

    config = {
      common = {
        default = ["hyprland"];
        "org.freedesktop.impl.portal.Secret" = ["gnome-keyring"];
      };

      hyprland = {
        default = ["gtk" "hyprland"];
        "org.freedesktop.impl.portal.Secret" = ["gnome-keyring"];
      };
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];

    xdgOpenUsePortal = true;
  };
}
