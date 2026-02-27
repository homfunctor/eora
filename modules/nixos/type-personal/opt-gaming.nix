# stellaris
#   env --unset=SDL_VIDEODRIVER gamemoderun %command%
#
# lotro
#   launch options:
#     env --unset=TZ PROTON_ENABLE_WAYLAND=1 gamemoderun %command%
#   timezone unset otherwise it uses UTF-0
#   fps no longer drops on focus loss. wayland is magick.
#
# civ 5 (vox populi)
#   launch options: env --unset=TZ  PROTON_ENABLE_WAYLAND=1 taskset --cpu-list 0-7 gamemoderun %command%
#   running with wayland fixes the "feature" of audio muting on focus loss
{inputs, ...}: {
  imports = with inputs.nix-gaming.nixosModules; [
    pipewireLowLatency
    platformOptimizations
    wine
  ];

  # environment.systemPackages = [pkgs.gamemode];

  programs = {
    gamemode = {
      enable = false;
      settings = {
        general = {
          renice = 15;
          softrealtime = "auto";
        };

        # gpu = {
        #   amd_performance_level = "high";
        #   apply_gpu_optimisations = "accept-responsibility";
        # };
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
