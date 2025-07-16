# notes on launch options
#
# stellaris
#   env --unset=SDL_VIDEODRIVER gamemoderun %command%
{inputs, ...}: {
  imports = with inputs.nix-gaming.nixosModules; [
    ntsync
    pipewireLowLatency
    platformOptimizations
  ];

  programs = {
    gamemode = {
      enable = true;
      settings.general = {
        renice = 15;
        softrealtime = "auto";
      };
    };

    steam = {
      enable = true;
      platformOptimizations.enable = true;
    };

    wine.ntsync.enable = true;
  };

  services.pipewire.lowLatency.enable = true;
}
