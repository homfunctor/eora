{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    OVMF.fd
    virt-manager
    win-virtio
  ];

  networking.firewall.trustedInterfaces = ["virbr0"];

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      ovmf = {
        enable = true;
        packages = [pkgs.OVMF.fd];
      };
      runAsRoot = true;
      swtpm.enable = true;
      # shared directory at ~/Shared
      vhostUserPackages = [pkgs.virtiofsd];
    };
  };
}
