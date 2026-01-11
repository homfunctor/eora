# todo: review revise redo
{
  boot = {
    initrd = {
      availableKernelModules = [
        "ahci"
        "nvme"
        "sd_mod"
        "usb_storage"
        "usbhid"
        "xhci_pci"
      ];
    };

    kernelModules = [
      "kvm-amd"
      "uinput"
    ];

    # todo: todo todo
    kernelParams = [
      #      "amd_iommu=on"
      #      "amd_pstate=active"
      #      "amdgpu.cik_support=1"
      #      "amdgpu.dcdebugmask=0x10"
      #      "amdgpu.dcfeaturemask=0x8"
      #      "amdgpu.ppfeaturemask=0xffffffff"
      #      "iommu=force"
      "nowatchdog"
      "preempt=full"
      #      "zswap.compressor=zstd"
      #      "zswap.enabled=1"
      #      "zswap.max_pool_percent=20"
      #      "zswap.zpool=z3fold"
    ];
  };
}
