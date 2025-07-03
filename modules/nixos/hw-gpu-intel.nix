{pkgs, ...}: {
  boot.kernelParams = ["i915"];

  hardware.graphics.extraPackages = with pkgs; [intel-media-driver];
}
