{osConfig, ...}: {
  wayland.windowManager.hyprland = {
    settings.plugin.hyprbars = {
      # todo
    };

    plugins = [osConfig.nixos.opts.hypr.hyprbars.pkg];
  };
}
