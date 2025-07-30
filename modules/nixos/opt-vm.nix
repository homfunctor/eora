{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    virt-manager
    win-virtio
  ];

  networking.firewall.trustedInterfaces = ["virbr0"];

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      ovmf.enable = true;
      runAsRoot = true;
      # shared directory at ~/Shared
      vhostUserPackages = [pkgs.virtiofsd];
    };
  };
}
