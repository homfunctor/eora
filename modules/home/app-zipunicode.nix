# todo: write script for use in nemo
# can nemo do scripts like caja?
{perSystem, ...}: {
  home.packages = with perSystem.self; [
    zipunicode
  ];
}
