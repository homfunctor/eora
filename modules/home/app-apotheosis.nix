{perSystem, ...}: {
  home.packages = with perSystem.self; [
    apotheosis
  ];
}
