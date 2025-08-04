# nix settings for nix to nix with
{
  inputs,
  lib,
  ...
}: let
  inherit (lib) mkDefault;
  flakeInputs = lib.filterAttrs (_: v: lib.isType "flake" v) inputs;
in {
  documentation = {
    doc.enable = false;
    info.enable = false;
    man = {
      enable = true;
      generateCaches = true;
    };
  };

  hardware.enableRedistributableFirmware = true;

  nix = {
    channel.enable = false;
    daemonCPUSchedPolicy = "idle";
    daemonIOSchedClass = "idle";

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
      persistent = true;
    };
    optimise.automatic = true;

    # all the cool kids do it
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;

    settings = {
      accept-flake-config = false;
      allowed-users = ["@wheel"];
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = [
        "flakes"
        "nix-command"
      ];
      flake-registry = "";
      http-connections = 50;
      keep-derivations = true;
      keep-going = true;
      keep-outputs = true;
      log-lines = 50;
      sandbox = true;
      trusted-users = ["@wheel"];
      warn-dirty = false;

      substituters = [
        "https://cache.nixos.org?priority=10"
        "https://hyprland.cachix.org"
        "https://numtide.cachix.org"
        "https://nix-community.cachix.org"
        "https://nix-gaming.cachix.org"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE"
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      ];

      use-xdg-base-directories = true;
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = mkDefault "x86_64-linux";
  };

  security.sudo-rs = {
    enable = true;
    wheelNeedsPassword = false;
  };

  services.xserver.xkb = {
    layout = mkDefault "us";
    variant = mkDefault "";
  };

  system.stateVersion = "25.05";
}
