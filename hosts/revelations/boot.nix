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

    kernelParams = [
      "mitigations=off"
      "nowatchdog"
      "preempt=full"
    ];
  };
}
