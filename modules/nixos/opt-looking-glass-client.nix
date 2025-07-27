{
  config,
  pkgs,
  ...
}: {
  boot = {
    extraModulePackages = [config.boot.kernelPackages.kvmfr];

    # only using this on home pc, hence amd assumed
    initrd.kernelModules = [
      "kvm-amd"
      "kvmfr"
      "vfio"
      "vfio_iommu_type1"
      "vfio_pci"
    ];
    kernelParams = [
      "amd_iommu=on"
      "iommu=pt"
      "pcie_acs_override=downstream"
    ];
  };

  networking.firewall.trustedInterfaces = [
    "virbr0"
  ];

  virtualisation = {
    libvirtd = {
      enable = true;
      onBoot = "ignore";
      onShutdown = "shutdown";

      qemu = {
        package = pkgs.qemu_kvm;
        ovmf = {
          enable = true;
          packages = [pkgs.OVMFFull.fd];
        };
        runAsRoot = true;
        swtpm.enable = true;
      };
    };
    spiceUSBRedirection.enable = true;
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="misc", KERNEL=="looking-glass", GROUP="kvm", MODE="0660"
  '';
}
