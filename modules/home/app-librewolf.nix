{flake, ...}: {
  imports = [
    flake.modules.home.stylix-librewolf
  ];

  programs.librewolf = {
    enable = true;
  };
}
