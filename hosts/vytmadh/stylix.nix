{flake, ...}: {
  imports = with flake.modules.nixos; [
    stylix-cursor-nordzy
    stylix-fonts-iosevka
    stylix-fonts-notoEmoji
    stylix-theme-sdg
  ];
}
