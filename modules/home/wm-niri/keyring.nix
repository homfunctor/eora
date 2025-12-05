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
in {
  programs.niri.settings = lib.mkIf cfg.enable {
    spawn-at-startup = let
      unlockKeyring = ''
        {pkgs.gnome-keyring}/bin/gnome-keyring-daemon \
        --daemonize \
        "--replace \
        --unlock < \
        ${flake.lib.mkSecPath osConfig [
          config.home.opts.userName
          "keyring"
          "password"
        ]}
      '';
    in [{sh = unlockKeyring;}];
  };
}
