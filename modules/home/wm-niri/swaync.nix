{osConfig, ...}: {
  services.swaync = {
    enable = true;
    package = osConfig.nixos.opts.niri.nc.pkg;
  };
}
