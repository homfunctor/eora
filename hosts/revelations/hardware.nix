{
  flake,
  inputs,
  ...
}: let
  nixosHW = with inputs.nixos-hardware.nixosModules; [
    common-cpu-amd
    common-cpu-amd-pstate
    common-gpu-amd
    common-pc-ssd
  ];
in {
  imports = with flake.modules.nixos;
    [
      hw-audio
      hw-cpu-amd
      hw-gpu-amd
      hw-printing
    ]
    ++ nixosHW;
}
