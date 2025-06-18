{perSystem, ...}: {
  home.packages = with perSystem.self; [
    Apotheosis
  ];
}
