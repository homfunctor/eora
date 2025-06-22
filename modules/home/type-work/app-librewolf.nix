# todo: configure further
{
  config,
  flake,
  ...
}: let
  inherit (config.home.opts) username;
in {
  imports = [
    flake.modules.home.stylix-librewolf
  ];

  programs.librewolf = {
    enable = true;

    profiles."${username}" = {};
  };
}
