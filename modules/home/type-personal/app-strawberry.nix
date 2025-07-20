# {pkgs, ...}: {home.packages = [pkgs.strawberry-qt6];}
# temp
{perSystem, ...}: {home.packages = [perSystem.self.strawberry];}
