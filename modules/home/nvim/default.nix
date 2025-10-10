{ pkgs, ... }: {
  home.sessionVariables.EDITOR = "nvim";

  programs = {
    neovim.enable = true;

    nixvim = {
      enable = true;
      defaultEditor = true;
      waylandSupport = true;
      globals = { mapleader = " "; };
      opts = {
        number = true;
        relativenumber = true;

        showmode = false;
        cursorline = true;
        signcolumn = "yes";
        virtualedit = "block";

        tabstop = 2;
        shiftwidth = 2;
        expandtab = true;
        shiftround = true;
        breakindent = true;
        smartindent = true;

        undofile = true;
        swapfile = false;
        undodir = "$HOME/.cache/nvim/undodir";

        wrap = false;
        colorcolumn = "80";

        smartcase = true;
        ignorecase = true;

        updatetime = 250;
        timeoutlen = 300;

        scrolloff = 10;
        splitright = true;
        splitbelow = true;
        splitkeep = "screen";

        list = true;
        listchars = {
          tab = "» ";
          nbsp = "␣";
          trail = "·";
        };

        confirm = true;
        termguicolors = true;
        completeopt = "menu,menuone,noselect";

        clipboard = "unnamedplus";
      };
      keymaps = [
        {
          mode = "n";
          key = "<Esc>";
          action = "<cmd>nohlsearch<CR>";
        }

        # better indent
        {
          mode = "v";
          key = "<";
          action = "<gv";
        }
        {
          mode = "v";
          key = ">";
          action = ">gv";
        }

        # buffer keymaps
        {
          mode = "n";
          key = "<S-h>";
          action = "<cmd>bprevious<cr>";
          options.desc = "Prev Buffer";
        }
        {
          mode = "n";
          key = "<S-l>";
          action = "<cmd>bnext<cr>";
          options.desc = "Next Buffer";
        }
        {
          mode = "n";
          key = "bd";
          action = "<cmd>bd<cr>";
          options.desc = "Delete Buffer";
        }
        {
          mode = "n";
          key = "bD";
          action = "<cmd>bufdo bd<cr>";
          options.desc = "Delete All Buffer";
        }

        # quicklist
        {
          mode = "n";
          key = "]q";
          action = ":cnext<CR>";
          options.desc = "Next Quickfix";
        }
        {
          mode = "n";
          key = "[q";
          action = ":cprev<CR>";
          options.desc = "Previous Quickfix";
        }

        # LSP maps
        {
          mode = "n";
          key = "K";
          action = "<cmd>lua vim.lsp.buf.hover()<CR>";
          options.desc = "Hover Documentation";
        }
        {
          mode = "n";
          key = "gd";
          action = "<cmd>lua vim.lsp.buf.definition()<CR>";
          options.desc = "Go to Definition";
        }
        {
          mode = "n";
          key = "<leader>d";
          action = "<cmd>lua vim.diagnostic.open_float()<CR>";
          options.desc = "Show Diagnostics";
        }
      ];
      autoCmd = [{
        event = "TextYankPost";
        group = "highlight_yank";
        desc = "Highlight on yank";
        callback = { __raw = "(vim.hl or vim.highlight).on_yank"; };
      }];
    };
  };

  stylix.targets.nixvim.enable = true;

  home.packages = with pkgs; [ unzip fd ripgrep ];
}
