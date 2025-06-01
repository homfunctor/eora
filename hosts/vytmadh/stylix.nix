{flake, ...}: {
  imports = with flake.modules.nixos; [
    stylix-cursor-nordzy
    stylix-fonts-notoEmoji
    stylix-fonts-iosevka
    stylix-theme-sdg
  ];
}
