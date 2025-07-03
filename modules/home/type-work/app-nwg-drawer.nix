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

  home.file.".config/nwg-drawer/drawer.css".text = with colors;
    ''
      window {
      background-color: rgba(''
    + base00-rgb-r
    + ","
    + base00-rgb-g
    + ","
    + base00-rgb-b
    + ","
    + ''            0.55);
      color: #''
    + base07
    + ''
      }

      /* search entry */
      entry {
      background-color: rgba(''
    + base01-rgb-r
    + ","
    + base01-rgb-g
    + ","
    + base01-rgb-b
    + ","
    + ''            0.45);
      }

      button, image {
      background: none;
      border: none
      }

      button:hover {
      background-color: rgba(''
    + base02-rgb-r
    + ","
    + base02-rgb-g
    + ","
    + base02-rgb-b
    + ","
    + ''        0.45);
      }

          /* in case you wanted to give category buttons a different look */
          #category-button {
              margin: 0 10px 0 10px
          }

          #pinned-box {
              padding-bottom: 5px;
              border-bottom: 1px dotted;
              border-color: #''
    + base07
    + ''      ;
        }

        #files-box {
            padding: 5px;
            border: 1px dotted gray;
            border-radius: 15px
            border-color: #''
    + base07
    + ''      ;
        }
    '';
}
