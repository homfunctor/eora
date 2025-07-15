{
  config,
  flake,
  lib,
  pkgs,
  ...
}: let
  cfg = config.nixos.opts.sops.keyring;
in {
  config = lib.mkIf cfg.enable {
    sops.secrets."psswdForKeyring" = {
      enable = true;
      mode = "0400";
      owner = config.nixos.opts.adminUser;
      path = "/run/secrets/psswdForKeyring";
    };

    systemd.user.services.unlock-keyring = {
      description = "Unlock gnome-keyring with sops";
      wantedBy = ["graphical-session.target"];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = let
          psswdPath = flake.lib.mkSecretPath config ["psswdForKeyring"];
        in "${pkgs.gnome-keyring}/bin/gnome-keyring-daemon --unlock < ${psswdPath}";
      };
    };
  };
}
