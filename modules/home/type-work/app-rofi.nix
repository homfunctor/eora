# todo
{
  config,
  pkgs,
  ...
}: let
  inherit (config.lib.stylix) colors;
in {
  home.packages = [pkgs.nwg-drawer];

  xdg.configFile."nwg-drawer/drawer.css".text = with colors; ''
    window {
      background-color: rgba(${base00-rgb-r},${base00-rgb-g},${base00-rgb-b},0.8);
      color: #${base08}
    }

    /* search entry */
    entry {
      background-color: rgba(${base02-rgb-r},${base02-rgb-g},${base02-rgb-b},0.8)
    }

    button, image {
      background: none;
      border: none
    }

    button:hover {
      background-color: rgba(${base03-rgb-r},${base03-rgb-g},${base03-rgb-b},0.2)
    }
  '';
}
