{
  config,
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
      pkgs.xdg-desktop-portal-gtk
    ];

    xdgOpenUsePortal = true;
  };
}
