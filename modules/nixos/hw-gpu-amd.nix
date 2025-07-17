{
  lib,
  pkgs,
  ...
}: {
  # lact
  boot = {
    initrd.kernelModules = ["amdgpu"];
    kernelParams = ["amdgpu.ppfeaturemask=0xfffd7fff"];
  };
  environment.systemPackages = [pkgs.lact];

  systemd = {
    packages = [pkgs.lact];
    services.lact = {
      serviceConfig.ExecStart = "${lib.getExe pkgs.lact} daemon";
      wantedBy = ["multi-user.target"];
    };
  };
}
