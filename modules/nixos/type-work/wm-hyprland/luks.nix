{
  boot.initrd = {
    systemd.enable = true;
    luks.devices."root" = {
      allowDiscards = true;
      device = "/dev/nvme0n1p2";
      keyFile = "/etc/luks-key";
    };
  };

  security.pam.mount.enable = true;

  system.activationScripts.luks-key = {
    text = ''
      if [ ! -f /etc/luks-key ]; then
        touch /etc/luks-key
        chmod 600 /etc/luks-key
        echo "set LUKS password in /etc/luks-key"
      fi
    '';
    deps = [];
  };
}
