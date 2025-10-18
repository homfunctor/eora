# https://github.com/nix-community/stylix/blob/master/modules/qt/hm.nix
{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (builtins) unsafeDiscardStringContext;
  inherit (config.lib.stylix) colors;

  iconThemeName = "Flat-Remix-Black-Dark";

  qtctConfig = ''
    [Appearance]
    style=kvantum
    icon_theme=${iconThemeName}
  '';

  # i just don't want github to say my flake is mostly Mustache
  svg = colors {
    extension = "svg";
    template = /. + unsafeDiscardStringContext "${inputs.sapadal}/assets/kvantum-svg.mustache";
  };

  kvconfig = colors {
    extension = ".kvconfig";
    template = /. + unsafeDiscardStringContext "${inputs.sapadal}/assets/kvconfig.mustache";
  };

  kvantumPackage = pkgs.runCommandLocal "base16-kvantum" {} ''
    directory="$out/share/Kvantum/Base16Kvantum"
    mkdir --parents "$directory"
    cat ${kvconfig} >>"$directory/Base16Kvantum.kvconfig"
    cat ${svg} >>"$directory/Base16Kvantum.svg"
  '';
in {
  stylix.targets.qt.enable = true;

  qt = {
    enable = true;
    platformTheme.name = lib.mkForce "kvantum";
  };

  home.packages = [kvantumPackage];

  xdg.configFile = {
    "Kvantum/Base16Kvantum".source = "${kvantumPackage}/share/Kvantum/Base16Kvantum";

    "Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini {}).generate "kvantum.kvconfig" {
      General.theme = "Base16Kvantum";
    };

    "qt5ct/qt5ct.conf".text = qtctConfig;

    "qt6ct/qt6ct.conf".text = qtctConfig;
  };
}
