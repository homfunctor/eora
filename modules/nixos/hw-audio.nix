{lib, ...}: {
  security.rtkit.enable = true;

  services = {
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
        # todo: is this still needed?
        # fixes battery usage issues
        extraConfig."10-disable-camera" = {
          "wireplumber.profiles".main = {
            "monitor.libcamera" = "disabled";
          };
        };
      };
    };

    pulseaudio.enable = lib.mkForce false;
  };
}
