{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    just
    libsecret
    nix-output-monitor
    sbctl # for lanzaboote
    vim
    wget
  ];

  programs.dconf.enable = true;
}
