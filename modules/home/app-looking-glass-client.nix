{pkgs, ...}: {
  home.packages = with pkgs; [
    spice-gtk
    looking-glass-client
    virt-manager
  ];
}
