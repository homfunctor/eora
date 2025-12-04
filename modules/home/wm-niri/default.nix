# very wip
{
  inputs,
  osConfig,
  ...
}: {
  imports = [
    ./binds.nix
    ./portal.nix
    ./settings.nix
    inputs.niri-flake.homeModules.niri
  ];

  programs.niri = {
    enable = true;
    package = osConfig.nixos.opts.niri.pkg;
  };
}
