{osConfig, ...}: {
  wayland.windowManager.hyprland.settings = {
    device = [
      {
        enabled = true;
        name = "huion-huion-tablet_h1060p";
        output = osConfig.nixos.opts.mainMonitor;
      }
    ];
  };
}
