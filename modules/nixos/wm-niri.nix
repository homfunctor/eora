{config, ...}: {
  programs.uwsm.waylandCompositors.niri = {
    prettyName = "niri";
    binPath = "${config.nixos.opts.niri.pkg}/bin/niri-session";
  };
}
