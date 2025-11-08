{
  description = "Eora NixOS Flake";

  inputs = {
    blueprint = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/blueprint";
    };

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    disko = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/disko";
    };

    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };

    # todo: worth it to go bleeding edge? probably not
    # hy3 = {
    #   inputs.hyprland.follows = "hyprland";
    #   url = "github:outfoxxed/hy3";
    # };
    #
    # hyprland = {
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   url = "github:hyprwm/hyprland";
    # };
    #
    # hyprland-plugins = {
    #   url = "github:hyprwm/hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    # };
    #
    lanzaboote = {
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.rust-overlay.follows = "rust-overlay";
      url = "github:nix-community/lanzaboote";
    };

    nix-gaming = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:fufexan/nix-gaming";
    };

    nix-index-database = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:mic92/nix-index-database";
    };

    nixcord.url = "github:kaylorben/nixcord";

    nixos-hardware.url = "github:nixos/nixos-hardware";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixvim.url = "github:nix-community/nixvim";

    rust-overlay = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:oxalica/rust-overlay";
    };

    sops-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:mic92/sops-nix";
    };

    stylix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:danth/stylix";
    };

    treefmt-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/treefmt-nix";
    };

    # secrets and privacy for the paranoid
    sapadal = {
      inputs = {
        blueprint.follows = "blueprint";
        nixpkgs.follows = "nixpkgs";
        sops-nix.follows = "sops-nix";
        treefmt-nix.follows = "treefmt-nix";
      };
      url = "git+ssh://git@github.com/homfunctor/sapadal?shallow=1?ref=main";
    };
  };

  outputs = inputs:
    inputs.blueprint {
      inherit inputs;
      systems = ["x86_64-linux"];
    };
}
