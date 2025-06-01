# system-side host boot settings for revelations
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
    ];

    kernelParams = [
      "mitigations=off"
      "nowatchdog"
      "preempt=full"
    ];
  };
}
