# unlocks keyring on first (auto)login
# uses osConfig as i handle sops outside hm
{
  config,
  flake,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  cfg = osConfig.nixos.opts.sops.keyring;
  inherit (config.home.opts) userName;
  inherit (flake.lib) mkSecPath;
in {
  wayland.windowManager.hyprland.settings = lib.mkIf cfg.enable {
    exec-once = let
      daemonPath = "${pkgs.gnome-keyring}/bin/gnome-keyring-daemon";
      daemonArgs = "--daemonize --replace --unlock";
      passwordPath = mkSecPath osConfig [userName "keyring" "password"];
    in ["${daemonPath} ${daemonArgs} < ${passwordPath}"];
  };
}
