{
  config,
  lib,
  ...
}: let
  cfg = config.nixos.opts.sops.keyring;
in {
  sops.secrets = lib.mkIf cfg.enable {
    password = {
      mode = "0400";
      owner = config.nixos.opts.adminUser;
    };
  };
}
