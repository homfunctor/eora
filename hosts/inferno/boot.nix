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
    };

    kernelModules = ["kvm-intel"];

    kernelParams = ["preempt=full"];

    loader = {
      grub.enable = true;
      systemd-boot.enable = false;
    };

    plymouth.enable = lib.mkForce false;
  };
}
