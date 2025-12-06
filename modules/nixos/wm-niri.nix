{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.niri = {
    enable = true;
    package = config.nixos.opts.niri.pkg;
  };

  nixos.opts.loginCmd = "${config.nixos.opts.niri.pkg}/bin/niri-session";

  nixpkgs.overlays = [inputs.niri-flake.overlays.niri];

  security.pam.services.swaylock.text = "auth include login";
}
