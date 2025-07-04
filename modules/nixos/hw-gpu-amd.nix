{
  lib,
  pkgs,
  ...
}: {
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

  # todo: check if still needed
  systemd = {
    packages = [pkgs.lact];
    services.lact = {
      serviceConfig.ExecStart = "${lib.getExe pkgs.lact} daemon";
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
