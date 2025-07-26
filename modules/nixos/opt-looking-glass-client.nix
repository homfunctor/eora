{pkgs, ...}: {
  boot.kernelParams = [
    "amd_iommu=on" # only using this on home pc, hence amd assumed
  ];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        ovmf.enable = true;
        swtpm.enable = true;
      };
    };
    spiceUSBRedirection.enable = true;
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="misc", KERNEL=="looking-glass", GROUP="kvm", MODE="0660"
  '';
}
