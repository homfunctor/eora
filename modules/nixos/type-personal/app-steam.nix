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
      settings = {
        general.renice = 20;

        gpu = {
          apply_gpu_optimisations = "accept-responsibility";
          amd_performance_level = "high";
        };
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
