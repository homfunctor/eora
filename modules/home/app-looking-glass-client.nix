{pkgs, ...}: {
  home.packages = with pkgs; [
    spice-gtk
    virt-manager
    win-virtio
  ];

  programs.looking-glass-client.enable = true;
}
