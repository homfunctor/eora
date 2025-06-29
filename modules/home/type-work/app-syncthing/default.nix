{
  config,
  flake,
  osConfig,
  pkgs,
  ...
}: let
  inherit (config.home.opts) userName;
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

    cert = mkSecretPath osConfig ["syncthing" "${userName}" "cert"];
    key = mkSecretPath osConfig ["syncthing" "${userName}" "key"];

    # strictly declarative
    overrideDevices = true;
    overrideFolders = true;
  };
}
