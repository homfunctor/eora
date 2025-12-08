# very wip
# very dire need for reorganization
# rough draft of it:
# apps.nix
# shell/{etc}.nix
# security.nix
# portal.nix
# tablet.nix
# env.nix
# binds.nix
# basically, niri settings in wm-niri/, shell settings in shell/
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
