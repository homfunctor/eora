{
  config,
  pkgs,
  ...
}: let
  keyringPkg = pkgs.gnome-keyring;
in {
  boot.initrd.systemd.enable = true;
  programs.seahorse.enable = true;
  services.gnome.gnome-keyring.enable = true;

  security.pam.services = {
    login = {
      enableGnomeKeyring = true;
      pamMount = true;
      text = ''
        auth       include login
        account    include login
        password   include login
        session    required pam_systemd_loadkey.so /etc/luks-key
        session    optional ${keyringPkg}/lib/security/pam_gnome_keyring.so auto_start
      '';
    };

    greetd = {
      enableGnomeKeyring = true;
      pamMount = true;
      text = ''
        auth       include greetd
        account    include greetd
        password   include greetd
        session    required pam_systemd_loadkey.so /etc/luks-key
        session    optional ${keyringPkg}/lib/security/pam_gnome_keyring.so auto_start
      '';
    };

    uwsm = {
      enableGnomeKeyring = true;
      pamMount = true;
      text = ''
        auth       include login
        account    include login
        password   include login
        session    required pam_systemd_loadkey.so /etc/luks-key
        session    optional ${keyringPkg}/lib/security/pam_gnome_keyring.so auto_start
        session    required pam_systemd.so
      '';
    };
  };

  # todo: remove from uwsm env as it is set here
  environment.sessionVariables = {
    GNOME_KEYRING_CONTROL = "$XDG_RUNTIME_DIR/keyring";
    SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/keyring/ssh";
    DBUS_SESSION_BUS_ADDRESS = "unix:path=$XDG_RUNTIME_DIR/bus";
  };

  systemd.services."import-credentials@" = {
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.systemd}/bin/systemd-import /etc/luks-key";
    };
  };
}
