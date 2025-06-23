# rest of font settings handled in stylix-fonts-*.nix
{pkgs, ...}: {
  environment.variables.LOG_ICONS = "true";

  fonts = {
    enableDefaultPackages = false;
    fontDir.enable = true;
    packages = with pkgs; [
      corefonts
      nerd-font-patcher
      nerd-fonts.symbols-only
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-extra
    ];
  };
}
