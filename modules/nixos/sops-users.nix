{
  config,
  flake,
  lib,
  ...
}: let
  inherit (builtins) listToAttrs;
  inherit (config.nixos.opts) usernames;
  inherit (flake.lib) mkSecretPath;
  inherit (lib) mkIf nameValuePair;

  cfg = config.nixos.opts.sops.user;
in {
  config = mkIf cfg.enable {
    sops.secrets.hashedPassword.neededForUsers = true;
    users = {
      mutableUsers = false;
      users = listToAttrs (
        map (
          user:
            nameValuePair user {
              hashedPasswordFile = mkSecretPath config ["hashedPassword"];
            }
        )
        usernames
      );
    };
  };
}
