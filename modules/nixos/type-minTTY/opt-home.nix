# basic home-manager settings
{inputs, ...}: {
  imports = [inputs.home-manager.nixosModules.home-manager];

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
