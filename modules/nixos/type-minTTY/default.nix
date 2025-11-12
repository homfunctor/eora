# bare minimum tty environment
# goal is to minimize install time
{
  imports = [
    ./app-minimal.nix
    ./opt-boot.nix
    ./opt-disko.nix
    ./opt-home.nix
    ./opt-locale.nix
    ./opt-networking.nix
    ./opt-nix.nix
    ./opt-security.nix
    ./opt-sops.nix
    ./opt-users.nix
  ];
}
