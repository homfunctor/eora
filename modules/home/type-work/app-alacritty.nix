{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # for images in yazi
    ueberzugpp
    # temp to investigate hyprland swallowing issue
    kitty
    foot
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      colors.transparent_background_colors = true;

      env.TERM = "xterm-256color";

      terminal.shell = "${lib.getExe pkgs.fish}";
    };
  };
}
