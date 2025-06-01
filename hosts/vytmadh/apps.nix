# system-side apps for revelations
{flake, ...}: {
  imports = with flake.modules.nixos; [
    app-minimal
    app-nix-ld
  ];
}
