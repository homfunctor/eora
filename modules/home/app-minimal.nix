{pkgs, ...}: {
  home.packages = with pkgs; [
    choose
    fclones
    pastel
    procs
    rm-improved
    rnr
    sd
  ];

  programs = {
    bat.enable = true;
    bottom.enable = true;
    broot.enable = true;
    eza = {
      enable = true;
      enableFishIntegration = true;
    };
    fd.enable = true;
    gpg.enable = true;
    home-manager.enable = true;
    ripgrep.enable = true;
    tealdeer.enable = true;
  };
}
