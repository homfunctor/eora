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
        command = "Hyprland";
        user = config.nixos.opts.adminUser;
      };

      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd 'Hyprland' --time-format '%F %R'";
        user = "greeter";
      };
    };
  };
}
