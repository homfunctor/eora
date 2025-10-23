{pkgs, ...}: {
  i18n = {
    # inputMethod = {
    #   enable = true;
    #   fcitx5 = {
    #     addons = with pkgs; [
    #       fcitx5-gtk
    #       fcitx5-mozc
    #     ];
    #     waylandFrontend = true;
    #   };
    #   type = "fcitx5";
    # };

    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };

    supportedLocales = ["all"];
  };

  time.timeZone = "America/Chicago";
}
