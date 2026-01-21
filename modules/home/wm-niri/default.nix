{inputs, ...}: {
  imports = with inputs; [
    ./apps.nix
    ./binds.nix
    ./env.nix
    ./idle.nix
    ./lock.nix
    ./portal.nix
    ./rules.nix
    ./settings.nix
    ./shell
    niri-flake.homeModules.niri
  ];
}
