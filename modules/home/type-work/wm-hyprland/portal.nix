{
  lib,
  osConfig,
  perSystem,
  pkgs,
  ...
}: {
  programs.hyprland = lib.mkIf osConfig.nixos.opts.hyprGit {
    portalPackage = perSystem.hyprland.xdg-desktop-portal-hyprland;
  };

  xdg.portal = {
    enable = true;

    extraPortals = [pkgs.xdg-desktop-portal-gtk];

    xdgOpenUsePortal = true;
  };
}
