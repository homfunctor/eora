{
  config,
  pkgs,
  ...
}: {
  services.greetd = {
    enable = true;
    restart = false;

    settings = {
      initial_session = {
        command = "uwsm start hyprland-uwsm.desktop";
        user = config.nixos.opts.adminUser;
      };

      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd 'uwsm start hyprland-uwsm.desktop' --time-format '%F %R'";
        user = "greeter";
      };
    };
  };
}
