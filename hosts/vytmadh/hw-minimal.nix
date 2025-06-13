{
  flake,
  inputs,
  ...
}: let
  nixosHW = with inputs.nixos-hardware.nixosModules; [
    common-cpu-intel
    common-gpu-intel
    common-pc-laptop-ssd
    lenovo-thinkpad-t490
  ];
in {
  imports = with flake.modules.nixos;
    [
      hw-cpu-intel
      hw-gpu-intel
    ]
    ++ nixosHW;
}
