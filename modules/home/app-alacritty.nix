# todo: adjust settings further
{pkgs, ...}: {
  home.packages = with pkgs; [
    # for images in yazi
    ueberzugpp
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      colors.transparent_background_colors = true;

      env.TERM = "xterm-256color";

      terminal.shell = "${pkgs.fish}/bin/fish";

      window.padding = {
        x = 16;
        y = 16;
      };
    };
  };
}
