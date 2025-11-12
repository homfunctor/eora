{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.sapadal.modules.nixos.opt-nix-ldLibs];

  environment.systemPackages = [pkgs.patchelf];

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld;
  };

  services.envfs.enable = true;
}
