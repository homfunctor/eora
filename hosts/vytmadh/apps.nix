# system-side apps
{flake, ...}: {
  imports = with flake.modules.nixos; [
    app-minimal
    app-nix-ld
  ];
}
