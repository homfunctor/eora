# very wip
{
  config,
  inputs,
  osConfig,
  ...
}: let
  inherit (config.home.opts) apps;
in {
  imports = [inputs.niri-flake.homeModules.niri];

  programs.niri = {
    enable = true;
    package = osConfig.nixos.opts.niri.pkg;
    settings = {
      binds = with config.lib.niri.actions; {
        "Mod+R".action = spawn [
          "${apps.launcher.exe}"
          "${apps.launcher.args}"
        ];
      };
      prefer-no-csd = true;
      spawn-at-startup = [
        # wip
        {command = ["kitty"];}
      ];
    };
  };
}
