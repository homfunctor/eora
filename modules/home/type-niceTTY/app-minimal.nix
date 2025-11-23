{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    erdtree
    killall
    rm-improved
  ];

  programs = {
    bat.enable = true;
    bottom.enable = true;
    eza =
      {
        enable = true;
      }
      // config.home.opts.apps.shell.shellIntegration;
    fd.enable = true;
    gpg.enable = true;
    ripgrep.enable = true;
    tealdeer.enable = true;
  };
}
