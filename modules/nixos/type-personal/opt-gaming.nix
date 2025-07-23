# stellaris
#   env --unset=SDL_VIDEODRIVER gamemoderun %command%
#
# lotro
# todo
#
# civ 5 (vox populi)
#   this was a real struggle to get right
#   still crashes, but way less often
#   launch options: bash -c "ulimit -s unlimited && DXVK_ASYNC=1 PROTON_ENABLE_WAYLAND=1 PROTON_NO_ESYNC=1 SDL_AUDIODRIVER=pipewire taskset --cpu-list 0-7 gamemoderun %command%"
#   running with wayland fixes the "feature" of audio muting on focus loss
{
  inputs,
  pkgs,
  ...
}: {
  imports = with inputs.nix-gaming.nixosModules; [
    ntsync
    pipewireLowLatency
    platformOptimizations
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

    # for lotro to keep regular fps on focus loss
    gamescope = {
      enable = true;
      package = pkgs.gamescope;

      capSysNice = true;
      args = [
        "--rt"
        "--expose-wayland"
      ];
    };

    steam = {
      enable = true;
      gamescopeSession.enable = true;
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
