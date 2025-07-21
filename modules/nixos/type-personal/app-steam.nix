# notes on launch options
# PROTON_ENABLE_WAYLAND=1
#
# stellaris
#   env --unset=SDL_VIDEODRIVER gamemoderun %command%
# lotro
#
# civ 5 (vox populi)
# PROTON_ENABLE_WAYLAND=1
#   ask which directx on launch otherwise it sometimes uses dx9
#   running with wayland fixes the "feature" of audio muting on focus loss
{inputs, ...}: {
  imports = with inputs.nix-gaming.nixosModules; [
    ntsync
    pipewireLowLatency
    platformOptimizations
  ];

  programs = {
    # todo: everything complains about not finding some .so file. are these
    # okay to ignore or serious? is gamemode really working?
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
