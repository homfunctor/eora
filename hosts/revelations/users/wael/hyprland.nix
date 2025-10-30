{
  osConfig,
  pkgs,
  ...
}: {
  # to deal with primary monitor being HDMI-A-1, not DP-1
  home.packages = with pkgs; [xorg.xrandr];

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      # set primary monitor for games using xwayland
      "xrandr --output ${osConfig.nixos.opts.mainMonitor} --primary"
    ];

    general.gaps_out = 10;
  };
}
