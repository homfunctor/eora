{
  flake,
  osConfig,
  pkgs,
  ...
}: {
  # to deal with primary monitor being DP-2, not DP-1
  home.packages = with pkgs; [xorg.xrandr];

  imports = [flake.modules.home.opt-tablet];

  wayland.windowManager.hyprland.settings.exec-once = [
    # set primary monitor for games using xwayland
    "xrandr --output ${osConfig.nixos.opts.mainMonitor} --primary"
  ];
}
