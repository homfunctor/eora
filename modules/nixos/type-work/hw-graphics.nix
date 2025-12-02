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
        libva
        libva-vdpau-driver
        libvdpau-va-gl
        libGL
        mesa
      ];

      extraPackages32 = with pkgs.driversi686Linux; [
        libva-vdpau-driver
        libvdpau-va-gl
      ];
    };
  };
}
