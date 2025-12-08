{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    libva-utils
    vdpauinfo
  ];

  hardware = {
    enableAllFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = with pkgs; [
        libdrm
        libva
        libva-vdpau-driver
        libvdpau
        libvdpau-va-gl
      ];

      extraPackages32 = with pkgs.driversi686Linux; [
        libva-vdpau-driver
        libvdpau-va-gl
      ];
    };
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
    scsiLinkPolicy = "med_power_with_dipm";
  };
}
