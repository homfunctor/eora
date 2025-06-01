# polkit
{perSystem, ...}: {
  home.packages = with perSystem; [
    hyprpolkitagent.default
  ];
}
