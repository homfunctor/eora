{osConfig, ...}: {
  services.hyprshell = {
    enable = true;
    package = osConfig.nixos.opts.hypr.hyprshell.pkg;
    settings = {
      #todo
    };
    systemd.args = "-v";
  };
}
