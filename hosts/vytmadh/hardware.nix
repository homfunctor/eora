{
  flake,
  inputs,
  ...
}: {
  imports = with flake.modules.nixos; [
    hw-audio
    hw-bluetooth
    hw-cpu-intel
    hw-gpu-intel
    hw-printing
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t490
  ];

  services.fstrim.enable = true;
}
