{lib, ...}: {
  boot = {
    initrd = {
      availableKernelModules = [
        "sd_mod"
        "usb_storage"
        "xhci_pci"
        "ehci_pci"
        "ahci"
        "usbhid"
      ];

      kernelModules = ["dm-snapshot"];

      loader = {
        grub.enable = true;
        systemd-boot.enable = false;
      };
    };

    kernelModules = ["kvm-intel"];

    kernelParams = ["preempt=full"];

    plymouth.enable = lib.mkForce false;
  };
}
