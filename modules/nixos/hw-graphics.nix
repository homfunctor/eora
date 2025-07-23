{pkgs, ...}: {
  hardware = {
    enableAllFirmware = true;

    graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = with pkgs; [
        libva
        libva-utils
        libvdpau-va-gl
        vaapiVdpau
      ];

      extraPackages32 = with pkgs.pkgsi686Linux; [
        libdrm
        libva
        libvdpau
        libvdpau-va-gl
        vaapiVdpau
      ];
    };
  };
}
