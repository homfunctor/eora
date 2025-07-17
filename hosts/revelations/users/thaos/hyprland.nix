{config, ...}: let
  # assumes main monitor is 2nd in list
  mainMonitor = builtins.elemAt config.home.opts.bg.monitors 1;
in {
  wayland.windowManager.hyprland.settings.device = [
    {
      enabled = true;
      name = "huion-huion-tablet_h1060p";
      output = mainMonitor;
    }
  ];
}
