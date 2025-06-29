{
  config,
  flake,
  lib,
  ...
}: let
  inherit (config.nixos.opts) userNames;
  inherit (flake.lib) mkSecretPath;
  inherit (lib) genAttrs mkIf;

  cfg = config.nixos.opts.sops.user;
in {
  config = mkIf cfg.enable {
    sops.secrets.hashedPassword.neededForUsers = true;
    users = {
      mutableUsers = false;
      users = genAttrs userNames (
        _user: {
          hashedPasswordFile = mkSecretPath config ["hashedPassword"];
        }
      );
    };
  };
}
