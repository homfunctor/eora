{
  config,
  flake,
  lib,
  ...
}: let
  cfg = config.nixos.opts.sops.keyring;
in {
  sops.secrets = lib.mkIf cfg.enable (builtins.listToAttrs (lib.concatMap (
      user: [
        {
          name = flake.lib.mkSecretName [user "keyring" "password"];
          value.owner = user;
        }
      ]
    )
    config.nixos.opts.userNames));
}
