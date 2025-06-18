{perSystem, ...}: {
  home.packages = with perSystem.self; [
    irony-mod-manager
  ];
}
