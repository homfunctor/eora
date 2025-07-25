{
  config,
  flake,
  lib,
  ...
}: let
  cfg = config.nixos.opts.sops.user;
in {
  config = lib.mkIf cfg.enable {
    sops.secrets.hashedPassword.neededForUsers = true;
    users = {
      mutableUsers = false;
      users = lib.genAttrs config.nixos.opts.userNames (_: {
        hashedPasswordFile = flake.lib.mkSecPath config ["hashedPassword"];
      });
    };
  };
}
