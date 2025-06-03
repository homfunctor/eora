{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalLeader = " ";
      floating_window_options.border = "single";
    };

    keymaps = [
      # replace the word under the cursor and enter insert mode
      {
        mode = "n";
        key = "<leader>D";
        action = "ciw";
      }

      {
        mode = "n";
        key = "<leader>R";
        action = ":%s/\<C-r><C-w>//g<Left><Left>";
        options = {
          desc = "Search and replace word under cursor";
        };
      }

      {
        mode = "n";
        key = "<esc>";
        action = "<cmd>nohl<CR>";
        options = {
          desc = "Clear search";
        };
      }

      {
        mode = "n";
        key = "<C-s>";
        action = "<cmd>w<cr><esc>";
        options = {
          silent = true;
          desc = "Save file";
        };
      }

      {
        mode = "n";
        key = "<C-q>";
        action = "<cmd>q<cr><esc>";
        options = {
          silent = true;
          desc = "Exit file";
        };
      }

      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        options = {
          silent = true;
          desc = "Move down when line is highlighted";
        };
      }

      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
        options = {
          silent = true;
          desc = "Move up when line is highlighted";
        };
      }

      {
        mode = "v";
        key = "<";
        action = "<gv";
        options = {
          silent = true;
          desc = "Indent while remaining in visual mode.";
        };
      }

      {
        mode = "v";
        key = ">";
        action = ">gv";
        options = {
          silent = true;
          desc = "Indent while remaining in visual mode.";
        };
      }

      {
        mode = "n";
        key = "n";
        action = "nzzzv";
        options = {
          desc = "Allow search terms to stay in the middle";
        };
      }

      {
        mode = "n";
        key = "N";
        action = "Nzzzv";
        options = {
          desc = "Allow search terms to stay in the middle";
        };
      }

      {
        mode = "n";
        key = "<leader>wj";
        action = "<C-W>s";
        options = {
          silent = true;
          desc = "Split window below";
        };
      }

      {
        mode = "n";
        key = "<leader>wl";
        action = "<C-W>v";
        options = {
          silent = true;
          desc = "Split window right";
        };
      }
    ];
  };
}
