# very wip
{
  config,
  inputs,
  osConfig,
  ...
}: let
  inherit (config.home.opts) apps;
in {
  imports = [
    ./binds.nix
    ./portal.nix
    inputs.niri-flake.homeModules.niri
  ];

  programs.niri = {
    enable = true;
    package = osConfig.nixos.opts.niri.pkg;
    settings = {
      prefer-no-csd = true;
      spawn-at-startup = [
        # wip
        {command = ["kitty"];}
      ];
    };
  };
}
