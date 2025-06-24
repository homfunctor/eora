{pkgs, ...}: {
  home.packages = with pkgs; [
    choose
    erdtree
    fclones
    mission-center
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
    btop.enable = true;
    eza = {
      enable = true;
      enableFishIntegration = true;
    };
    fd.enable = true;
    gpg.enable = true;
    ripgrep.enable = true;
    tealdeer.enable = true;
  };
}
