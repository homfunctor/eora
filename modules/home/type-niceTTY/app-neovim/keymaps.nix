{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalLeader = " ";
      floating_window_options.border = "none";
    };

    keymaps = [
      # sort
      {
        action = ":sort<ESC>";
        key = "<A-s>";
        mode = "v";
      }
      # replace the word under the cursor and enter insert mode
      {
        action = "ciw";
        key = "<leader>D";
        mode = "n";
      }

      {
        action = ":%s/\<C-r><C-w>//g<Left><Left>";
        key = "<leader>R";
        mode = "n";
        options.desc = "Search and replace word under cursor";
      }

      {
        action = "<cmd>nohl<CR>";
        key = "<esc>";
        mode = "n";
        options.desc = "Clear search";
      }

      {
        action = "<cmd>w<cr><esc>";
        key = "<C-s>";
        mode = "n";
        options = {
          desc = "Save file";
          silent = true;
        };
      }

      {
        action = "<cmd>q<cr><esc>";
        key = "<C-q>";
        mode = "n";
        options = {
          desc = "Exit file";
          silent = true;
        };
      }

      {
        action = ":m '>+1<CR>gv=gv";
        key = "J";
        mode = "v";
        options = {
          desc = "Move down when line is highlighted";
          silent = true;
        };
      }

      {
        action = ":m '<-2<CR>gv=gv";
        key = "K";
        mode = "v";
        options = {
          desc = "Move up when line is highlighted";
          silent = true;
        };
      }

      {
        action = "gg=G";
        key = "<leader>if";
        mode = "n";
        options = {
          desc = "Indent file";
          silent = true;
        };
      }

      # todo: replace with something that always works
      # {
      #   action = "gg0VGy";
      #   key = "<leader>cb";
      #   mode = "n";
      #   options = {
      #     desc = "Copy buffer";
      #     silent = true;
      #   };
      # }

      {
        action = "<gv";
        key = "<";
        mode = "v";
        options = {
          desc = "Indent while remaining in visual mode.";
          silent = true;
        };
      }

      {
        action = ">gv";
        key = ">";
        mode = "v";
        options = {
          desc = "Indent while remaining in visual mode.";
          silent = true;
        };
      }

      {
        action = "nzzzv";
        key = "n";
        mode = "n";
        options.desc = "Allow search terms to stay in the middle";
      }

      {
        action = "Nzzzv";
        key = "N";
        mode = "n";
        options.desc = "Allow search terms to stay in the middle";
      }

      {
        action = "<C-W>s";
        key = "<leader>wj";
        mode = "n";
        options = {
          desc = "Split window below";
          silent = true;
        };
      }

      {
        action = "<C-W>v";
        key = "<leader>wl";
        mode = "n";
        options = {
          desc = "Split window right";
          silent = true;
        };
      }
    ];
  };
}
