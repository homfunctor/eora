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

    hyprcursor = {
      inputs = {
        hyprlang.follows = "hyprland/hyprlang";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:hyprwm/hyprcursor";
    };

    hyprland-guiutils = {
      inputs = {
        hyprgraphics.follows = "hyprland/hyprgraphics";
        hyprlang.follows = "hyprland/hyprlang";
        hyprutils.follows = "hyprland/hyprutils";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:hyprwm/hyprland-guiutils";
    };

    hypridle = {
      inputs = {
        hyprlang.follows = "hyprland/hyprlang";
        hyprutils.follows = "hyprland/hyprutils";
        nixpkgs.follows = "hyprland/nixpkgs";
      };
      url = "github:hyprwm/hypridle";
    };

    hyprland.url = "github:hyprwm/hyprland";

    hyprlock = {
      inputs = {
        hyprgraphics.follows = "hyprland/hyprgraphics";
        hyprlang.follows = "hyprland/hyprlang";
        hyprutils.follows = "hyprland/hyprutils";
        nixpkgs.follows = "hyprland/nixpkgs";
      };
      url = "github:hyprwm/hyprlock";
    };

    hyprpanel = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:jas-singhfsu/hyprpanel";
    };

    hyprpaper = {
      inputs = {
        hyprgraphics.follows = "hyprland/hyprgraphics";
        hyprlang.follows = "hyprland/hyprlang";
        hyprutils.follows = "hyprland/hyprutils";
        nixpkgs.follows = "hyprland/nixpkgs";
      };
      url = "github:hyprwm/hyprpaper";
    };

    hyprland-contrib = {
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
      url = "github:hyprwm/contrib";
    };

    hyprland-plugins = {
      inputs.hyprland.follows = "hyprland";
      url = "github:hyprwm/hyprland-plugins";
    };

    hyprshell = {
      inputs = {
        hyprland.follows = "hyprland";
        nixpkgs.follows = "hyprland/nixpkgs";
      };
      url = "github:h3rmt/hyprshell";
    };

    lanzaboote = {
      inputs.nixpkgs.follows = "nixpkgs";
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

    nur = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nur";
    };

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
