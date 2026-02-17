{
  flake,
  inputs,
  ...
}: {
  imports = with flake.modules.nixos; [
    hw-audio
    hw-cpu-amd
    hw-gpu-amd
    hw-printing
  ];

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
    scsiLinkPolicy = "med_power_with_dipm";
  };

  services.fstrim.enable = true;
}
