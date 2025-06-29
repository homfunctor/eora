{
  config,
  lib,
  ...
}: let
  inherit (config.home.opts) userName;

  dirName = "Math";
  homeDirectory = "/home/${userName}";

  cfg = config.home.opts.sync;
in {
  config = lib.mkIf cfg.folder."${dirName}".enable {
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
          "suninshadow"
          "vytmadh"
        ];
      };
    };
  };
}
