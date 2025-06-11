{pkgs, ...}: {
  boot.initrd.kernelModules = [
    "amdgpu"
  ];

  environment.systemPackages = [pkgs.lact];

  # todo: check performance
  # hardware.amdgpu.amdvlk = {
  #   enable = true;
  #   package = pkgs.amdvlk;
  #   support32Bit.enable = true;
  # };

  systemd = {
    packages = [pkgs.lact];
    services.lact = {
      enable = true;
      wantedBy = ["multi-user.target"];
    };
  };
}
