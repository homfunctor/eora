{osConfig, ...}: {
  wayland.windowManager.hyprland = {
    settings = {
      general.layout = "hy3";
      plugin.hy3 = {
        # todo
      };
    };

    plugins = [osConfig.nixos.opts.hypr.hy3.pkg];
  };
}
