{pkgs, ...}: {
  home.packages = with pkgs; [
    zoom-us
    # (zoom-us.override {
    #   hyprlandXdgDesktopPortalSupport = true;
    # })
  ];
}
