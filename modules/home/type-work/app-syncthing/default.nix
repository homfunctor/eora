{
  config,
  flake,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  inherit (config.home.opts) userName;
  inherit (flake.lib) mkSecPath;
in {
  imports = [
    ./devices.nix
    ./options.nix
    ./sync-folders
  ];

  services.syncthing = {
    enable = true;
    package = pkgs.syncthing;

    cert = mkSecPath osConfig [userName "syncthing" "cert"];
    key = mkSecPath osConfig [userName "syncthing" "key"];

    # strictly declarative
    overrideDevices = true;
    overrideFolders = true;

    # todo: get syncthingtray working properly
    tray = {
      enable = false;
      command = "{lib.getExe pkgs.syncthingtray} --wait --config-dir-path /home/${userName}/.local/state/syncthing";
      package = pkgs.syncthingtray;
    };
  };
}
