# notes on launch options
# proton options: PROTON_USE_NTSYNC=1 PROTON_USE_WOW64=1 PROTON_ENABLE_WAYLAND=1
# these work with lotro but it only runs on DP-1. can be moved to DP-2 but
# resolution does not change
# otherwise runs fantastic
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
