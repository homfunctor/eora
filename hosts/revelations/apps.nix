# system-side apps for revelations
{flake, ...}: {
  imports = with flake.modules.nixos; [
    app-gaming
    app-minimal
    app-nix-ld
  ];
}
