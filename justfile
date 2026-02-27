default:
    @just --list

# flake check
chflake:
    nix flake check

# collect garbage
clean:
    nix-collect-garbage -d  --log-format internal-json  |& nom --json

# format
nf:
    nix fmt

# update to current flake config without going online
offlate:
    sudo nixos-rebuild switch --flake . --offline  --log-format internal-json  |& nom --json

# violently destroy all remains of nixos channels
purgech:
    sudo rm -rf /root/.nix-defexpr/channels && sudo rm -rf /nix/var/nix/profiles/per-user/root/channels

# current flake config applied on next boot
upboot:
    sudo nixos-rebuild boot --flake . --log-format internal-json  |& nom --json

# --dry-activate
upcheck:
    sudo nixos-rebuild dry-activate --flake .  --log-format internal-json  |& nom --json

# update to current flake config
update:
    sudo nixos-rebuild switch --flake . --log-format internal-json |& nom --json

# update flake inputs
upflake:
    nix flake update

# --dry-activate  --show-trace
uptrace:
    sudo nixos-rebuild dry-activate --flake . --log-format internal-json  --show-trace |& nom --json
