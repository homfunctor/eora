{pkgs, ...}: {
  home.packages = with pkgs; [
    xdg-utils
  ];

  xdg.portal = {
    enable = true;

    # config = {
    #   common = {
    #     default = [
    #       "gtk"
    #       "hyprland"
    #     ];
    #
    #     "org.freedesktop.impl.portal.Secret" = ["gnome-keyring"];
    #   };
    # };

    configPackages = [pkgs.hyprland];

    extraPortals = with pkgs; [
      # xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];

    xdgOpenUsePortal = true;
  };
}
