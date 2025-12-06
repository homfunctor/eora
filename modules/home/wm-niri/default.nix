# very wip
{
  inputs,
  osConfig,
  ...
}: {
  imports = with inputs; [
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
    ./tablet.nix
    niri-flake.homeModules.niri
    noctalia.homeModules.default
  ];

  programs = {
    niri = {
      enable = true;
      package = osConfig.nixos.opts.niri.wm.pkg;
    };

    noctalia-shell = {
      enable = true;
      settings = {
        # todo
      };
    };
  };
}
