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

    kernelModules = ["kvm-amd"];

    kernelParams = [
      "mitigations=off"
      "nowatchdog"
      "preempt=full"
      "video=DP-1:1680x1050@60"
      "video=DP-2:1920x1080@60"
      "video=DP-3:1366x768@60"
    ];
  };
}
