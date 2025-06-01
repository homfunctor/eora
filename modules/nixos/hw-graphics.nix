{pkgs, ...}: {
  hardware = {
    enableAllFirmware = true;

    graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = with pkgs; [
        libva
        libvdpau-va-gl
        vaapiVdpau
      ];

      extraPackages32 = with pkgs.pkgsi686Linux; [
        libvdpau-va-gl
        vaapiVdpau
      ];
    };
  };
}
