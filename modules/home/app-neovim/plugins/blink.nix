# todo: evaluate how convenient the keymaps are
{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.opts.home.nvim.blink;
in {
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      wordnet
    ];

    programs.nixvim.plugins = {
      blink-cmp-dictionary.enable = true;
      blink-cmp-spell.enable = true;
      blink-compat.enable = true;
      blink-emoji.enable = true;
      blink-ripgrep.enable = true;

      blink-cmp = {
        enable = true;
        setupLspCapabilities = true;

        settings = {
          appearance = {
            nerd_font_variant = "mono";
            use_nvim_cmp_as_default = true;

            kind_icons = {
              Class = "󱡠";
              Color = "󰏘";
              Constant = "󰏿";
              Constructor = "󰒓";
              Emoji = "";
              Enum = "󰦨";
              EnumMember = "󰦨";
              Error = "󰏭";
              Event = "󱐋";
              Field = "󰜢";
              File = "󰈔";
              Folder = "󰉋";
              Function = "󰊕";
              Hint = "󰏭";
              Information = "󰏮";
              Interface = "󱡠";
              Keyword = "󰻾";
              Method = "";
              Module = "󰅩";
              Operator = "󰪚";
              Property = "󰖷";
              Reference = "󰬲";
              Snippet = "󱄽";
              Struct = "󱡠";
              Text = "󰉿";
              TypeParameter = "󰬛";
              Unit = "󰪚";
              Value = "󰦨";
              Variable = "󰆦";
              Warning = "󰏯";
            };
          };

          cmdline.keymap = {
            "<C-CR>" = [
              "select_and_accept"
              "fallback"
            ];
            "<C-u>" = [
              "scroll_documentation_up"
              "fallback"
            ];
            "<C-d>" = [
              "scroll_documentation_down"
              "fallback"
            ];
            "<C-n>" = [
              "select_next"
              "fallback"
            ];
            "<C-p>" = [
              "select_prev"
              "fallback"
            ];
            "<A-q>" = [
              "hide"
              "fallback"
            ];
            "<C-j>" = [
              "snippet_forward"
              "fallback"
            ];
            "<C-k>" = [
              "snippet_backward"
              "fallback"
            ];
          };

          keymap = {
            "<C-CR>" = [
              "select_and_accept"
              "fallback"
            ];
            "<C-b>" = [
              "scroll_documentation_up"
              "fallback"
            ];
            "<C-f>" = [
              "scroll_documentation_down"
              "fallback"
            ];
            "<C-n>" = [
              "select_next"
              "fallback"
            ];
            "<C-p>" = [
              "select_prev"
              "fallback"
            ];
            "<A-q>" = [
              "hide"
              "fallback"
            ];
          };

          completion = {
            documentation = {
              auto_show = true;
              window.border = "single";
            };

            ghost_text.enabled = true;

            list.selection = {
              auto_insert = false;
              preselect = false;
            };

            menu = {
              border = "single";
              draw = {
                columns = [
                  {
                    __unkeyed-1 = "label";
                  }

                  {
                    __unkeyed-1 = "kind_icon";
                    __unkeyed-2 = "kind";
                    gap = 1;
                  }

                  {
                    __unkeyed-1 = "source_name";
                  }
                ];

                gap = 1;
                treesitter = ["lsp"];
              };
            };
          };

          fuzzy = {
            implementation = "rust";
            prebuilt_binaries.download = false;
          };

          signature = {
            enabled = true;
            window.border = "single";
          };

          snippets.preset = "mini_snippets";

          sources = {
            default = [
              "buffer"
              "lsp"
              "path"
              "snippets"
              "dictionary"
              "emoji"
              "spell"
              "ripgrep"
            ];

            providers = {
              ripgrep = {
                name = "Ripgrep";
                module = "blink-ripgrep";
                score_offset = 100;
                opts = {
                  prefix_min_len = 3;
                  context_size = 5;
                  max_filesize = "1M";
                  project_root_marker = ".git";
                  project_root_fallback = true;
                  search_casing = "--ignore-case";
                  additional_rg_options = {};
                  fallback_to_regex_highlighting = true;
                  ignore_paths = {};
                  additional_paths = {};
                  debug = false;
                };
              };

              dictionary = {
                name = "Dict";
                module = "blink-cmp-dictionary";
                min_keyword_length = 3;
              };

              emoji = {
                name = "Emoji";
                module = "blink-emoji";
                score_offset = 15;
              };

              lsp.score_offset = 4;

              spell = {
                name = "Spell";
                module = "blink-cmp-spell";
                score_offset = 1;
              };

              vimtex = {
                name = "vimtex";
                module = "blink.compat.source";
              };
            };
          };
        };
      };
    };
  };
}
