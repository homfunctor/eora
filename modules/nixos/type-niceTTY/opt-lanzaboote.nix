# it's secure and it boots
{
  config,
  inputs,
  lib,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.nixos.opts.lanzaboote;
in {
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];

  config.boot = mkIf cfg.enable {
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };

    loader.systemd-boot.enable = false;
  };
}
