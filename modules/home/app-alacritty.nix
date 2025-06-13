# todo: adjust settings further
{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      terminal.shell = "${pkgs.fish}/bin/fish";
    };
  };
}
