{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;
  inherit (config.home.opts) username;
  homeDirectory = "/home/${username}";
  dirName = "Books";
  cfg = config.home.opts.sync;
in {
  config = mkIf cfg.folder."${dirName}".enable {
    services.syncthing.settings = {
      folders."${homeDirectory}/${dirName}" = {
        enable = true;
        inherit (cfg) versioning;

        id = "${dirName}";
        label = "${dirName}";

        copyOwnershipFromParent = true;

        devices = [
          "aedyr"
          "revelations"
          "vytmadh"
        ];
      };
    };
  };
}
