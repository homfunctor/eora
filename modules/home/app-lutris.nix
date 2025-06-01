# todo: manage declaratively in sapadal?
{pkgs, ...}: {
  home.packages = with pkgs; [
    lutris
  ];
}
