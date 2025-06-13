{flake, ...}: {
  imports = with flake.modules.nixos; [
    hw-audio
    hw-bluetooth
    hw-graphics
    hw-printing
    hw-tablet
  ];
}
