{
  lib,
  osConfig,
  perSystem,
  pkgs,
  ...
}: {
  home.sessionVariables.QML2_IMPORT_PATH = lib.concatStringsSep ":" [
    "${osConfig.nixos.opts.hypr.quickshell.pkg}/lib/qt-6/qml"
    "${pkgs.kdePackages.qtdeclarative}/lib/qt-6/qml"
    "${pkgs.kdePackages.kirigami.unwrapped}/lib/qt-6/qml"
  ];

  programs.quickshell = {
    enable = true;
    package = osConfig.nixos.opts.hypr.quickshell.pkg;
    systemd.enable = true;
  };
}
