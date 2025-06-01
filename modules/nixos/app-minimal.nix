{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    just
    nix-output-monitor
    sbctl # for lanzaboote
    vim
    wget
  ];

  programs = {
    dconf.enable = true;
    seahorse.enable = true;
  };
}
