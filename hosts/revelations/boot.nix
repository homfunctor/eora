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
      # "amdgpu.gpu_recovery=1"
      # "amdgpu.runpm=0"
      # "nowatchdog"
      # "preempt=full"
    ];
  };
}
