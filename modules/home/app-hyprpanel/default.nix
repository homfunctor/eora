{
  perSystem,
  ...
}: {
  imports = [
    ./settings.nix
    ./theme.nix
  ];

  programs.hyprpanel = {
    enable = true;
    package = perSystem.hyprpanel.default;
  };
}
