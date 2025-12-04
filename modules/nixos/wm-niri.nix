{
  config,
  inputs,
  ...
}: {
  nixos.opts.loginCmd = "${config.nixos.opts.niri.pkg}/bin/niri-session";

  nixpkgs.overlays = [inputs.niri-flake.overlays.niri];

  # todo: check if this works with niri, else use own solution
  security.pam.services.greetd.enableGnomeKeyring = true;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "linuxmobile";
}
