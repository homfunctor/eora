{config, ...}: {
  nixos.opts.loginCmd = "${config.nixos.opts.niri.pkg}/bin/niri-session";
}
