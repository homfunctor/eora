{pkgs, ...}: {
  home.packages = with pkgs; [
    choose
    erdtree
    fclones
    killall
    pastel
    procs
    rm-improved
    rnr
    sd
  ];

  programs = {
    bat.enable = true;
    bottom.enable = true;
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
