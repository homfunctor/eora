# it's secure and it boots
{
  config,
  inputs,
  lib,
  ...
}: let
  cfg = config.nixos.opts.lanzaboote;
in {
  imports = [inputs.lanzaboote.nixosModules.lanzaboote];

  boot = lib.mkIf cfg.enable {
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };

    loader.systemd-boot.enable = false;
  };
}
