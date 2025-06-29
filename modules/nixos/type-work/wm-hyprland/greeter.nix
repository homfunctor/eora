{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config.nixos.opts) adminuser;

  keyringPkg = "${pkgs.gnome-keyring}";
  sessionCmd = "${lib.getExe pkgs.uwsm} start hyprland-uwsm.desktop";
in {
  services.greetd = {
    enable = true;
    settings = {
      # autologin after luks decrypt
      initial_session = {
        command = "${keyringPkg}/bin/gnome-keyring-daemon -- start && ${sessionCmd}";
        user = adminuser;
      };

      # entered after logging out of autologin session
      default_session = {
        command = "${lib.getExe pkgs.greetd.regreet} --config /etc/regreet.toml";
        user = "greeter";
      };
    };
  };

  # todo: background
  environment.etc."regreet.toml".text = ''
    command = "${sessionCmd}"
    user = "${adminuser}"
    remember = true
    [env]
    DBUS_SESSION_BUS_ADDRESS = "unix:path=$XDG_RUNTIME_DIR/bus"
    GNOME_KEYRING_CONTROL = "$XDG_RUNTIME_DIR/keyring"
    SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/keyring/ssh"
  '';

  # secure greeter user
  users.users.greeter = {
    isSystemUser = true;
    group = "greeter";
    home = "/var/lib/greeter";
    createHome = true;
    shell = "${pkgs.shadow}/bin/nologin";
  };
}
