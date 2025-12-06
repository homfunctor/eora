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
    ./security.nix
    ./settings.nix
    ./swaybg.nix
    ./swayidle.nix
    ./swaylock.nix
    ./swaync.nix
    ./tablet.nix
    ./waybar.nix
    ./wlogout.nix
    inputs.niri-flake.homeModules.niri
  ];

  programs.niri = {
    enable = true;
    package = osConfig.nixos.opts.niri.wm.pkg;
  };
}
