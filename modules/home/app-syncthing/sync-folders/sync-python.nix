{
  config,
  lib,
  ...
}: let
  inherit (config.home.opts) username;
  inherit (lib) mkIf;

  dirName = "Python";
  homeDirectory = "/home/${username}";

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
          "revelations"
          "vytmadh"
        ];
      };
    };
  };
}
