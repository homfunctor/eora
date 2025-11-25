{
  lib,
  osConfig,
  perSystem,
  pkgs,
  ...
}: {
  # check if needed
  # sessionVariables.QML2_IMPORT_PATH = lib.concatStringsSep ":" [
  #   "${perSystem.quickshell.default}/lib/qt-6/qml"
  #   "${pkgs.kdePackages.qtdeclarative}/lib/qt-6/qml"
  #   "${pkgs.kdePackages.kirigami.unwrapped}/lib/qt-6/qml"
  # ];
  programs.quickshell = {
    enable = true;
    package = osConfig.nixos.opts.hypr.quickshell.pkg;
    systemd.enable = true;
  };
}
