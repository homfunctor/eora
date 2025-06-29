{
  boot.initrd = {
    systemd.enable = true;
    luks.devices."root" = {
      device = "/dev/nvme0n1p2";
      allowDiscards = true;
      keyFile = "/etc/luks-key";
    };
  };

  security.pam.mount.fields.password = "password,luks";

  system.activationScripts.luks-key = {
    text = ''
      if [ ! -f /etc/luks-key ]; then
        touch /etc/luks-key
        chmod 600 /etc/luks-key
        echo "Set your LUKS password in /etc/luks-key"
      fi
    '';
    deps = [];
  };
}
