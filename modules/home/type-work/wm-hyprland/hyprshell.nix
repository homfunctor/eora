# todo: revise
{
  inputs,
  perSystem,
  ...
}: {
  imports = [
    inputs.hyprshell.homeModules.hyprshell
  ];

  home.packages = [
    perSystem.hyprshell.hyprshell
  ];

  programs.hyprshell = {
    enable = false;
  };

  # wayland.windowManager.hyprland.settings.exec-once = [
  # "systemctl --user enable --now hyprshell.service"
  # ];
}
