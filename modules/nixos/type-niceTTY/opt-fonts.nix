# rest of font settings handled in stylix-fonts-*.nix
{pkgs, ...}: {
  environment.variables.LOG_ICONS = "true";

  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [
      nerd-font-patcher
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      noto-fonts-extra
    ];
  };
}
