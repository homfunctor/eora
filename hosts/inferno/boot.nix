{
  boot = {
    initrd = {
      availableKernelModules = [
        "nvme"
        "sd_mod"
        "usb_storage"
        "xhci_pci"
      ];
    };

    kernelParams = ["preempt=full"];
  };
}
