{
  config,
  flake,
  osConfig,
  pkgs,
  ...
}: let
  inherit (config.home.opts) username;
  inherit (flake.lib) mkSecretPath;
in {
  imports = [
    ./devices.nix
    ./options.nix
    ./sync-folders
  ];

  services.syncthing = {
    enable = true;
    package = pkgs.syncthing;

    cert = mkSecretPath osConfig ["syncthing" "${username}" "cert"];
    key = mkSecretPath osConfig ["syncthing" "${username}" "key"];

    # strictly declarative
    overrideDevices = true;
    overrideFolders = true;
  };
}
