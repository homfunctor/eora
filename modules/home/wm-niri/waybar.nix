# todo
{osConfig, ...}: {
  programs.waybar = {
    enable = true;
    package = osConfig.nixos.opts.niri.bar.pkg;

    systemd.enable = true;
  };
}
