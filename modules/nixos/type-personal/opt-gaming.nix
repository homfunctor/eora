# stellaris
#   env --unset=SDL_VIDEODRIVER gamemoderun %command%
#
# lotro
# launch options:  PROTON_USE_WAYLAND=1 gamemoderun %command%"
#
# civ 5 (vox populi)
# still very wip
#   launch options: PROTON_ENABLE_WAYLAND=1 PROTON_NO_ESYNC=1 PROTON_NO_FSYNC=1 taskset --cpu-list 0-7 gamemoderun %command%
#   running with wayland fixes the "feature" of audio muting on focus loss
{
  inputs,
  pkgs,
  ...
}: {
  imports = with inputs.nix-gaming.nixosModules; [
    pipewireLowLatency
    platformOptimizations
    wine
  ];

  environment.systemPackages = [pkgs.gamemode];

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

  services.pipewire.lowLatency = {
    enable = true;
    quantum = 512;
    rate = 48000; # default value
  };
}
