{pkgs, ...}: {
  # lact
  boot = {
    initrd.kernelModules = [
      "amdgpu"
    ];

    kernelParams = [
      "amdgpu.ppfeaturemask=0xfffd7fff"
    ];
  };
  environment.systemPackages = [pkgs.lact];
  systemd = {
    packages = [pkgs.lact];
    services.lact = {
      serviceConfig.ExecStart = "${pkgs.lact}/bin/lact daemon";
      wantedBy = ["multi-user.target"];
    };
  };

  # todo: get around to this todo
  # todo: check performance with and without
  # hardware.amdgpu.amdvlk = {
  #   enable = true;
  #   package = pkgs.amdvlk;
  #   support32Bit.enable = true;
  # };
}
