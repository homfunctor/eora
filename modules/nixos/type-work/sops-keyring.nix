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
    sops.secrets.password = {
      mode = "0400";
      owner = config.nixos.opts.adminUser;
    };

    # overrides default initial_session.command
    services.greetd.settings.initial_session.command = let
      daemonPath = "${pkgs.gnome-keyring}/bin/gnome-keyring-daemon";
      daemonArgs = "--daemonize --replace --unlock";
      loginCmd = "${lib.getExe pkgs.uwsm} start hyprland-uwsm.desktop";
      passwordPath = flake.lib.mkSecretPath config ["password"];
    in "${loginCmd}; ${daemonPath} ${daemonArgs} < ${passwordPath}";
  };
}
