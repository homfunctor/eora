{perSystem, ...}: {
  home.packages = with perSystem.self; [
    stellar-maps
  ];
}
