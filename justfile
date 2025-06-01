# update to current flake config
update:
    sudo nixos-rebuild switch --flake . --log-format internal-json -v |& nom --json

# current flake config applied on next boot
upboot:
    sudo nixos-rebuild boot --flake .  --log-format internal-json -v |& nom --json

# collect garbage
clean:
    nix-collect-garbage -d  --log-format internal-json -v |& nom --json

# update flake inputs
upflake:
    nix flake update

# flake check
chflake:
    nix flake check 

# --dry-activate
upcheck:
    sudo nixos-rebuild dry-activate --flake .   --log-format internal-json -v |& nom --json 

# --dry-activate  --show-trace
uptrace:
    sudo nixos-rebuild dry-activate --flake .  --log-format internal-json -v --show-trace |& nom --json 

# update to current flake config without going online
offlate:
    sudo nixos-rebuild switch --flake . --offline  --log-format internal-json -v |& nom --json

# install vytmadh configuration
install-vytmadh:
    sudo nixos-rebuild boot --flake .#vytmadh   --log-format internal-json -v |& nom --json

# install revelations configuration
install-revelations:
    sudo nixos-rebuild boot --flake .#revelations   --log-format internal-json -v |& nom --json

# violently destroy all remains of nixos channels
purge-channels:
    sudo rm -rf /root/.nix-defexpr/channels && sudo rm -rf /nix/var/nix/profiles/per-user/root/channels
