{osConfig, ...}: {
  wayland.windowManager.hyprland = {
    settings.plugin.hyprexpo = {
      # todo
    };

    plugins = [osConfig.nixos.opts.hypr.hyprexpo.pkg];
  };
}
