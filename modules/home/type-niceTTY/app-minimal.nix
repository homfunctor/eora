{pkgs, ...}: {
  home.packages = with pkgs; [
    erdtree
    killall
    rm-improved
  ];

  programs = {
    bat.enable = true;
    bottom.enable = true;
    fd.enable = true;
    gpg.enable = true;
    ripgrep.enable = true;
    tealdeer.enable = true;
  };

  # annoying
  stylix.enableReleaseChecks = false;
}
