{
  config,
  inputs,
  ...
}: {
  nixos.opts.loginCmd = "${config.nixos.opts.niri.pkg}/bin/niri-session";

  nixpkgs.overlays = [inputs.niri-flake.overlays.niri];

  security.pam.services.swaylock.text = "auth include login";

  # security.pam.services.niri.enableGnomeKeyring = true;
}
