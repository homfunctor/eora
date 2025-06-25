{
  description = "Eora NixOS Flake";

  inputs = {
    # core inputs
    blueprint = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/blueprint";
    };

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

    lix-module = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = ''
        https://git.lix.systems/lix-project/nixos-module/archive/2.93.0.tar.gz'';
    };

    nix-index-database = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:mic92/nix-index-database";
    };

    nixcord.url = "github:kaylorben/nixcord";

    nixos-hardware.url = "github:nixos/nixos-hardware";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixvim = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nixvim";
    };

    rust-overlay = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:oxalica/rust-overlay";
    };

    sops-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:mic92/sops-nix";
    };

    treefmt-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/treefmt-nix";
    };

    # desktop environment
    hyprpanel.url = "github:jas-singhfsu/hyprpanel";

    hyprshell = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:H3rmt/hyprshell?ref=hyprshell-release";
    };

    hyprsysteminfo = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:hyprwm/hyprsysteminfo";
    };

    # extras
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    nix-gaming = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:fufexan/nix-gaming";
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

    # theming
    stylix = {
      inputs = {
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:nix-community/stylix";
    };
  };

  outputs = inputs:
    inputs.blueprint {
      inherit inputs;
      systems = ["x86_64-linux"];
    };
}
