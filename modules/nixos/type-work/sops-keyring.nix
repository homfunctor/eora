{
  config,
  lib,
  ...
}: let
  cfg = config.nixos.opts.sops.keyring;
in {
  sops.secrets.password = lib.mkIf cfg.enable {
    mode = "0400";
    owner = config.nixos.opts.adminUser;
  };
}
