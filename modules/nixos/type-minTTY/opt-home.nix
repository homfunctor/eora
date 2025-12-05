# basic home-manager settings
{inputs, ...}: {
  imports = [inputs.home-manager.nixosModules.home-manager];

  # required for using home-manager user packages within nixos
  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  home-manager = {
    backupFileExtension = "hm.old";
    extraSpecialArgs = {inherit inputs;};
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
