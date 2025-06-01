# todo: vaguely recall kdeconnect wants something else
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    blueman
  ];
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;
}
