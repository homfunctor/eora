{lib, ...}: {
  services = {
    pulseaudio.enable = lib.mkForce false;
    pipewire = {
      enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
      pulse.enable = true;
      wireplumber = {
        enable = true;
        # battery issues
        extraConfig."10-disable-camera" = {
          "wireplumber.profiles".main = {
            "monitor.libcamera" = "disabled";
          };
        };
      };
    };
  };

  security.rtkit.enable = true;
}
