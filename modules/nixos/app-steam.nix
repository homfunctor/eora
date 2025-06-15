{
  inputs,
  pkgs,
  ...
}: {
  imports = with inputs.nix-gaming.nixosModules; [
    pipewireLowLatency
    platformOptimizations
  ];

  programs = {
    gamemode = {
      enable = true;
      enableRenice = true;
      settings = {
        cpu = {
          park_cores = "no";
          pin_cores = "yes";
        };
        general.renice = 10;
        gpu = {
          amd_performance_level = "high";
          apply_gpu_optimisations = "accept-responsibility";
        };
      };
    };

    steam = {
      enable = true;
      extraPackages = with pkgs; [
        # might help with crashes caused by stellaris mods
        rust-jemalloc-sys-unprefixed
      ];
      platformOptimizations.enable = true;
      protontricks.enable = true;
      remotePlay.openFirewall = false;
    };
  };

  services = {
    irqbalance.enable = true;
    pipewire.lowLatency.enable = true;
  };
}
