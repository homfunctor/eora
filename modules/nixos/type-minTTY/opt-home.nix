# basic home-manager settings
{inputs, ...}: {
  imports = [inputs.home-manager.nixosModules.home-manager];

  home-manager = {
    backupFileExtension = "hm.old";
    extraSpecialArgs = {inherit inputs;};
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
