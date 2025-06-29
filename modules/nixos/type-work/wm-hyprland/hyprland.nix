# todo: autologin
# {
#   config,
#   lib,
#   pkgs,
#   ...
# }:
# let
#   inherit (config.nixos.opts) adminuser;
#   inherit (lib) getExe;
# in
{
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };

    uwsm.enable = true;
  };

  security.pam.services.hyprlock.text = "auth include login";

  boot.initrd.systemd.enable = true;

  services.xserver.enable = false;
}
