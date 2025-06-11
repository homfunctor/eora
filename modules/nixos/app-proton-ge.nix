{perSystem, ...}: {
  programs.steam.extraCompatPackages = [
    perSystem.chaotic.proton-ge-custom
  ];
}
