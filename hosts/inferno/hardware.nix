{
  flake,
  inputs,
  ...
}: let
  nixosHW = with inputs.nixos-hardware.nixosModules; [
    common-cpu-intel
    common-gpu-amd
    common-pc-ssd
  ];
in {
  imports = with flake.modules.nixos;
    [
      hw-audio
      hw-cpu-intel
      hw-gpu-amd
      hw-printing
    ]
    ++ nixosHW;
}
