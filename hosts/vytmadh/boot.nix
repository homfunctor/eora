{
  boot = {
    initrd = {
      availableKernelModules = [
        "nvme"
        "rtsx_pci_sdmmc"
        "sd_mod"
        "usb_storage"
        "xhci_pci"
      ];
    };

    kernelModules = [
    ];

    kernelParams = [
      "preempt=full"
    ];
  };
}
