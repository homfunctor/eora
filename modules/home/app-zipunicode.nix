{perSystem, ...}: {
  home.packages = with perSystem.self; [
    zipunicode
  ];
}
