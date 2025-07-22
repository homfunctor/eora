# notes on launch options
# PROTON_ENABLE_WAYLAND=1
#
# stellaris
#   env --unset=SDL_VIDEODRIVER gamemoderun %command%
# lotro
#
# civ 5 (vox populi)
# todo: force it to use dx11
# PROTON_ENABLE_WAYLAND=1 %command
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

    steam = {
      enable = true;
      platformOptimizations.enable = true;
    };

    wine.ntsync.enable = true;
  };

  services.pipewire.lowLatency.enable = true;
}
