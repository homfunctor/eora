{
  config,
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    cage
    libsecret
    wayland-utils
    wl-clipboard
    xwayland-satellite
  ];

  programs.niri = {
    enable = true;
    package = config.nixos.opts.niri.pkg;
  };

  nixos.opts.loginCmd = "${config.nixos.opts.niri.pkg}/bin/niri-session";

  nixpkgs.overlays = [inputs.niri-flake.overlays.niri];

  security.pam.services.swaylock.text = "auth include login";

  services.seatd.enable = true;
}
