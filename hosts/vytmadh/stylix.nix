{flake, ...}: {
  imports = with flake.modules.nixos; [
    stylix-cursor-nordzy
    stylix-fonts-iosevka
    stylix-icons-obsidian
    stylix-theme-sdg
  ];
}
