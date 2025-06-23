# bare minimum tty environment
{
  imports = [
    ./app-minimal.nix
    ./opt-boot.nix
    ./opt-disko.nix
    ./opt-home.nix
    ./opt-locale.nix
    ./opt-networking.nix
    ./opt-nix.nix
    ./opt-sops.nix
    ./opt-users.nix
  ];
}
