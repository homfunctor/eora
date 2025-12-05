# very wip
{
  inputs,
  osConfig,
  ...
}: {
  imports = [
    ./binds.nix
    ./env.nix
    ./portal.nix
    ./quickshell.nix
    ./security.nix
    ./settings.nix
    ./swayidle.nix
    ./swaylock.nix
    ./tablet.nix
    inputs.niri-flake.homeModules.niri
  ];

  programs.niri = {
    enable = true;
    package = osConfig.nixos.opts.niri.pkg;
  };
}
