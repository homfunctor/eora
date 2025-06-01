# it's secure and it boots
{inputs, ...}: {
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];

  boot = {
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };

    loader.systemd-boot.enable = false;
  };
}
