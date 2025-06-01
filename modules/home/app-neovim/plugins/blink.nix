{pkgs, ...}: {
  home.packages = with pkgs; [
    wordnet
  ];

  programs.nixvim.plugins = {
    blink-cmp-dictionary.enable = true;
    blink-cmp-spell.enable = true;
    blink-emoji.enable = true;
    blink-ripgrep.enable = true;

    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;

      settings = {
        cmdline = {
          completion = {
            list.selection.preselect = false;
            menu.auto_show = true;
          };
          keymap = {
            preset = "super-tab";
            "<CR>" = [
              "accept_and_enter"
              "fallback"
            ];
            "<C-b>" = [
              "scroll_documentation_up"
              "fallback"
            ];
            "<C-e>" = [
              "hide"
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
            "<C-space>" = [
              "show"
              "show_documentation"
              "hide_documentation"
            ];
            "<Down>" = [
              "select_next"
              "fallback"
            ];
            "<S-Tab>" = [
              "snippet_backward"
              "fallback"
            ];
            "<Tab>" = [
              "snippet_forward"
              "fallback"
            ];
            "<Up>" = [
              "select_prev"
              "fallback"
            ];
          };
        };
        completion = {
          ghost_text.enabled = true;
          documentation = {
            auto_show = true;
            window.border = "rounded";
          };
          list.selection = {
            auto_insert = false;
            preselect = false;
          };
          menu = {
            border = "rounded";
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
                {__unkeyed-1 = "source_name";}
              ];
              components = {
                kind_icon = {
                  ellipsis = false;
                  text.__raw = ''
                    function(ctx)
                      local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                      -- Check for both nil and the default fallback icon
                      if not kind_icon or kind_icon == '󰞋' then
                        -- Use our configured kind_icons
                        return require('blink.cmp.config').appearance.kind_icons[ctx.kind] or ""
                      end
                      return kind_icon
                    end,
                    -- Optionally, you may also use the highlights from mini.icons
                    highlight = function(ctx)
                      local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                      return hl
                    end
                  '';
                };
              };
            };
          };
        };

        fuzzy = {
          implementation = "rust";
          prebuilt_binaries.download = false;
        };

        keymap.preset = "enter";
        signature = {
          enabled = true;
          window.border = "rounded";
        };

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
              score_offset = 1;
            };
            dictionary = {
              name = "Dict";
              module = "blink-cmp-dictionary";
              min_keyword_length = 3;
            };
            emoji = {
              name = "Emoji";
              module = "blink-emoji";
              score_offset = 1;
            };
            lsp.score_offset = 4;
            spell = {
              name = "Spell";
              module = "blink-cmp-spell";
              score_offset = 1;
            };
          };
        };

        appearance = {
          nerd_font_variant = "mono";
          kind_icons = {
            Text = "󰉿";
            Method = "";
            Function = "󰊕";
            Constructor = "󰒓";

            Field = "󰜢";
            Variable = "󰆦";
            Property = "󰖷";

            Class = "󱡠";
            Interface = "󱡠";
            Struct = "󱡠";
            Module = "󰅩";

            Unit = "󰪚";
            Value = "󰦨";
            Enum = "󰦨";
            EnumMember = "󰦨";

            Keyword = "󰻾";
            Constant = "󰏿";

            Snippet = "󱄽";
            Color = "󰏘";
            File = "󰈔";
            Reference = "󰬲";
            Folder = "󰉋";
            Event = "󱐋";
            Operator = "󰪚";
            TypeParameter = "󰬛";
            Error = "󰏭";
            Warning = "󰏯";
            Information = "󰏮";
            Hint = "󰏭";

            Emoji = "";
          };
        };
      };
    };
  };
}
