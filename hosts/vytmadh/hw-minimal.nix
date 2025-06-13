{
  flake,
  inputs,
  ...
}: {
  imports = [
    flake.modules.nixos.hw-bluetooth
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t490
  ];
}
