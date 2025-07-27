{pkgs, ...}: {
  home.packages = with pkgs; [
    spice-gtk
    virt-manager
    win-virtio
  ];
}
