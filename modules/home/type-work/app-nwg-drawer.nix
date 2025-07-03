{
  config,
  pkgs,
  ...
}: let
  inherit (config.lib.stylix) colors;
in {
  home.packages = with pkgs; [
    nwg-drawer
  ];

  xdg.configFile.".config/nwg-drawer/drawer.css".text = with colors; ''
    window {
      background-color: rgba(${base01-rgb-r},${base01-rgb-g},${base01-rgb-b},0.75);
      color: #${base07};
    }

    /* search entry */
    entry {
      background-color: rgba(${base02-rgb-r},${base02-rgb-g},${base02-rgb-b},0.5);
    }

    button, image {
      background: none;
      border: none;
    }

    button:hover {
      background-color: rgba(${base03-rgb-r},${base03-rgb-g},${base03-rgb-b},0.1);
    }

    /* in case you wanted to give category buttons a different look */
    #category-button {
      margin: 0 10px 0 10px
    }

    #pinned-box {
      padding-bottom: 5px;
      border-bottom: 1px dotted;
      border-color: #${base08};
    }

    #files-box {
      padding: 5px;
      border: 1px dotted gray;
      border-radius: 15px
      border-color: #${base08};
    }
  '';
}
