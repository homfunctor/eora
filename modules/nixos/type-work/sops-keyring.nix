{
  config,
  lib,
  ...
}: let
  inherit (config.nixos.opts) adminUser;
  cfg = config.nixos.opts.sops.keyring;
in {
  sops.secrets = lib.mkIf cfg.enable {
    password = {
      inherit (config.users.users.${adminUser}) group;
      mode = "0400";
    };
  };
}
