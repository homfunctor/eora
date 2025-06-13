{inputs, ...}: {
  imports = with inputs.nixos-hardware.nixosModules; [
    lenovo-thinkpad-t490
  ];

  hardware.enableRedistributableFirmware = true;
}
