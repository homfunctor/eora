{
  config,
  lib,
  pkgs,
  ...
}: {
  # hyprland with uwsm
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    seahorse.enable = true;
    uwsm.enable = true;
  };

  # autologin with uwsm. also hyprlock pam access
  security.pam = {
    enableSSHAgentAuth = false;

    services = {
      hyprlock.text = "auth include login";

      login.enableGnomeKeyring = true;

      # luks decrypt -> password used for uwsm login
      uwsm = {
        enableGnomeKeyring = true;
        pamMount = true;
        startSession = true;
        text = lib.mkForce ''
          auth      include     login
          account   include     login
          password  include     login
          session   required    pam_env.so
          session   required    pam_limits.so
          session   optional    pam_keyinit.so revoke
          session   required    pam_systemd.so
          session   optional    ${pkgs.gnome.gnome-keyring}/lib/security/pam_gnome_keyring.so auto_start
        '';
      };
    };
  };

  # autologin, keyring
  boot.initrd.systemd.enable = true;

  services = {
    dbus = {
      enable = true;
      implementation = "broker";
      packages = with pkgs; [
        gcr
        gnome-keyring
      ];
    };

    getty.autologinUser = config.nixos.opts.adminuser;

    xserver.enable = false;
  };

  systemd = {
    user.services."uwsm-autostart" = {
      enable = true;
      description = "Autostart UWSM Hyprland session";
      wantedBy = ["graphical-session.target"];
      serviceConfig = {
        ExecStart = "${lib.getExe pkgs.uwsm} start hyprland-uwsm.desktop";
        LockPersonality = true;
        NoNewPrivileges = true;
        PrivateTmp = true;
        ProtectControlGroups = true;
        ProtectHome = "read-only";
        ProtectKernelTunables = true;
        ProtectSystem = "strict";
        Restart = "no";
        RestrictSUIDSGID = true;
        Type = "simple";
      };
    };

    # shorter shutdown, startup
    extraConfig = ''
      DefaultTimeoutStopSec=10s
      DefaultTimeoutStartSec=5s
    '';
  };
}
