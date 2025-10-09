{config, ...}: let
  inherit (config.home) homeDirectory;
in {
  services.syncthing.settings = {
    extraOptions = [
      "--config=${homeDirectory}/syncthing/"
      "--data=${homeDirectory}"
      "--no-default-folder"
    ];

    gui.theme = "black";

    options = {
      listenAddresses = ["default"];
      minHomeDiskFree = {
        unit = "%";
        value = 1;
      };
      urAccepted = -1;
    };
  };
}
