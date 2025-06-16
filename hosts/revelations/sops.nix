{
  sops.secrets = {
    # syncthing
    "syncthing/thaos/cert".owner = "thaos";
    "syncthing/thaos/key".owner = "thaos";
    "syncthing/wael/cert".owner = "wael";
    "syncthing/wael/key".owner = "wael";
  };
}
