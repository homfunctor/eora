{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    virt-manager
    virtio-win
  ];

  networking.firewall.trustedInterfaces = ["virbr0"];

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      # ovmf.enable = true;
      runAsRoot = true;
      swtpm.enable = true;
      vhostUserPackages = [pkgs.virtiofsd];
    };
  };
}
