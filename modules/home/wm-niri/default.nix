{
  inputs,
  osConfig,
  ...
}: {
  imports = with inputs; [
    ./apps.nix
    ./binds.nix
    ./env.nix
    ./idle.nix
    ./lock.nix
    ./portal.nix
    ./settings.nix
    ./shell
    niri-flake.homeModules.niri
  ];

  programs.niri = {
    enable = true;
    package = osConfig.nixos.opts.niri.wm.pkg;
  };
}
