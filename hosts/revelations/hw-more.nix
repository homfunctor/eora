{
  flake,
  inputs,
  ...
}: {
  imports = with flake.modules.nixos; [
    hw-audio
    hw-graphics
    hw-printing
    hw-tablet
  ];
}
