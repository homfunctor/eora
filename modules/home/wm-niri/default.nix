# very wip
{
  inputs,
  osConfig,
  ...
}: {
  imports = [
    ./app-niriApps.nix
    ./binds.nix
    ./env.nix
    # ./keyring.nix
    ./portal.nix
    ./security.nix
    ./settings.nix
    ./tablet.nix
    inputs.niri-flake.homeModules.niri
  ];

  programs.niri = {
    enable = true;
    package = osConfig.nixos.opts.niri.pkg;
  };
}
