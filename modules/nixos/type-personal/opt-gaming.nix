# stellaris
#   env --unset=SDL_VIDEODRIVER gamemoderun %command%
#
# lotro
#   launch options:  PROTON_ENABLE_WAYLAND=1 gamemoderun %command%"
#   fps no longer drops on focus loss. wayland is magick.
#
# civ 5 (vox populi)
#   launch options: PROTON_NO_ESYNC=1 PROTON_NO_FSYNC=1 PROTON_ENABLE_WAYLAND=1 taskset --cpu-list 0-7 gamemoderun %command%
#   do these work? only the devil knows.
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
        general = {
          renice = 15;
          softrealtime = "auto";
        };

        gpu = {
          amd_performance_level = "high";
          apply_gpu_optimisations = "accept-responsibility";
        };
      };
    };

    steam = {
      enable = true;
      platformOptimizations.enable = true;
      protontricks.enable = true;
    };

    wine.ntsync.enable = true;
  };

  services.pipewire.lowLatency = {
    enable = true;
    quantum = 512;
    rate = 48000; # default value
  };
}
