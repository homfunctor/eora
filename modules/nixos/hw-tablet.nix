{pkgs, ...}: {
  environment.systemPackages = with pkgs; [libinput];

  hardware.opentabletdriver.enable = true;
}
