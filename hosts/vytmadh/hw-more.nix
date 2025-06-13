{
  flake,
  inputs,
  ...
}: let
  nixosHW = with inputs.nixos-hardware.nixosModules; [
    common-cpu-intel
    common-gpu-intel
    common-pc-laptop-ssd
  ];
in {
  imports = with flake.modules.nixos;
    [
      hw-cpu-intel
      hw-gpu-intel
      hw-audio
      hw-graphics
      hw-printing
      hw-tablet
    ]
    ++ nixosHW;
}
