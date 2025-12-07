# very wip
{
  inputs,
  osConfig,
  ...
}: {
  imports = with inputs; [
    ./apps.nix
    ./bar.nix
    ./bg.nix
    ./binds.nix
    ./env.nix
    ./idle.nix
    ./lock.nix
    ./logout.nix
    ./nc.nix
    ./portal.nix
    ./security.nix
    ./settings.nix
    ./shell.nix
    ./stylix.nix
    ./tablet.nix
    niri-flake.homeModules.niri
  ];

  programs.niri = {
    enable = true;
    package = osConfig.nixos.opts.niri.wm.pkg;
  };
}
