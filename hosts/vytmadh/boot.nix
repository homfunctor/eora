{
  boot = {
    initrd = {
      availableKernelModules = [
        "nvme"
        "rtsx_pci_sdmmc"
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

    kernelParams = [
      "mitigations=off"
      "nowatchdog"
      "preempt=full"
    ];
  };
}
