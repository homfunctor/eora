{
  config,
  flake,
  lib,
  ...
}: let
  cfg = config.nixos.opts.sops.syncthing;
  inherit (flake.lib) mkSecretName;
in {
  sops.secrets = lib.mkIf cfg.enable (builtins.listToAttrs (lib.concatMap (
      user: [
        {
          name = mkSecretName [user "syncthing" "cert"];
          value.owner = user;
        }

        {
          name = mkSecretName [user "syncthing" "key"];
          value.owner = user;
        }
      ]
    )
    config.nixos.opts.userNames));
}
