# didn't go so well
# notes for when i get around to reinstalling:
#   grub 2
#   xfce
#   boot.loader.grub.enable = true;
#   .device = "/dev/sda";
#   .useOSProber = true;
#   x11
#   lightdm
#   xfce
#   aKM: xhci_pci, ehci_pci, ahci, usbhid, usb_storage, sd_mod
#   kM: kvm-intel
#   basic ext4
#
{flake, ...}: {
  imports = with flake.modules.nixos; [
    # minimal tty
    ./boot.nix
    ./hardware.nix
    # done imperatively ah well
    fsys-inferno
    opts
    type-minTTY

    # nicer tty
    ./stylix.nix
    type-niceTTY

    # family PC
    type-familyPC

    # extras
    app-nix-ld
    opt-lix
  ];

  # recursive to avoid defining adminUser twice
  nixos.opts = rec {
    fontSizes = {
      applications = 12;
      desktop = 12;
      popups = 12;
      terminal = 14;
    };

    hostName = "inferno";

    opacity = {
      popups = 1.0;
      terminal = 1.0;
    };

    sops.user.enable = true;

    adminUser = "magran";
    userNames = [adminUser];
  };
}
