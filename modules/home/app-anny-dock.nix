{perSystem, ...}: {
  home.packages = with perSystem.self; [
    anny-dock
  ];
}
