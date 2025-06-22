# todo: write script for use in nemo
{perSystem, ...}: {
  home.packages = with perSystem.self; [
    zipunicode
  ];
}
