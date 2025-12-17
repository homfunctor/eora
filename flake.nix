{
  description = "Eora NixOS Flake";

  inputs = {
    # core
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

    lanzaboote = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/lanzaboote";
    };

    rust-overlay = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:oxalica/rust-overlay";
    };

    # niri
    niri-flake = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:sodiboo/niri-flake";
    };

    # niri-scratchpad-flake = {
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   url = "github:gvolpe/niri-scratchpad";
    # };

    # nfsm-flake = {
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   url = "github:gvolpe/nfsm";
    # };

    noctalia = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:noctalia-dev/noctalia-shell";
    };

    # nsticky-flake = {
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   url = "github:lonerorz/nsticky";
    # };

    # nix
    nix-flatpak.url = "github:gmodena/nix-flatpak/";

    nix-gaming = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:fufexan/nix-gaming";
    };

    nix-index-database = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:mic92/nix-index-database";
    };

    nix-search = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:diamondburned/nix-search";
    };

    nixcord.url = "github:kaylorben/nixcord";

    nixos-hardware.url = "github:nixos/nixos-hardware";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixvim.url = "github:nix-community/nixvim";

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

    # secrets and privacy for the 21st century schizoid
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
