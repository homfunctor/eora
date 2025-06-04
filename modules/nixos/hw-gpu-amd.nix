{pkgs, ...}: {
  boot.initrd.kernelModules = [
    "amdgpu"
  ];

  environment.systemPackages = with pkgs; [
    lact
  ];
  hardware.amdgpu.amdvlk = {
    enable = true;
    package = pkgs.amdvlk;

    support32Bit.enable = true;
  };

  systemd.services.lact = {
    enable = true;

    description = "AMDGPU Control Daemon";
    after = ["multi-user.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig.ExecStart = "${pkgs.lact}/bin/lact daemon";
  };
}
