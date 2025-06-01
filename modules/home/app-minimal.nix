{pkgs, ...}: {
  home.packages = with pkgs; [
    erdtree
  ];

  programs = {
    bat.enable = true;
    eza = {
      enable = true;
      enableFishIntegration = true;
    };
    fd.enable = true;
    gpg.enable = true;
    home-manager.enable = true;
    ripgrep.enable = true;
  };
}
