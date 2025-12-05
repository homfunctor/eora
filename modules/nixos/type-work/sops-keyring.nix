# passwords used to unlock keyring
{
  config,
  flake,
  lib,
  ...
}: let
  cfg = config.nixos.opts.sops.keyring;
in {
  sops.secrets = lib.mkIf cfg.enable (builtins.listToAttrs (map (
      user: {
        name = flake.lib.mkSec [user "keyring" "password"];
        value.owner = user;
      }
    )
    config.nixos.opts.userNames));

  security.pam.services = {
    login.enableGnomeKeyring = true;
    greetd.enableGnomeKeyring = true;
  };
}
