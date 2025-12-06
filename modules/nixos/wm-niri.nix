{
  config,
  inputs,
  ...
}: {
  programs.niri = {
    enable = true;
    package = config.nixos.opts.niri.wm.pkg;
  };

  nixpkgs.overlays = [inputs.niri-flake.overlays.niri];

  security.pam.services.swaylock.text = "auth include login";
}
