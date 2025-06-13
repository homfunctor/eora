{
  config,
  perSystem,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    xdg-utils
    xdg-user-dirs
  ];

  xdg.portal = {
    enable = true;

    config = {
      common = {
        default = [
          "gtk"
          "hyprland"
        ];

        "org.freedesktop.impl.portal.Secret" = ["gnome-keyring"];
      };
    };

    extraPortals = [
      perSystem.hyprland.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];

    xdgOpenUsePortal = true;
  };
}
