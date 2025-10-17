{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.modules.shell.nvim.enable = lib.mkEnableOption "Enable nvim";

  config = lib.mkIf config.modules.shell.nvim.enable {
    programs = {
      nixvim = {
        enable = true;
        defaultEditor = true;
        globals.mapleader = " ";
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
          undodir = "${config.xdg.cacheHome}/nvim/undo";

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
          winborder = "rounded";
          termguicolors = true;

          completeopt = [
            "menu"
            "menuone"
            "noselect"
          ];

          spell = true;
          spelllang = "en_us";
          clipboard = "unnamedplus";
        };
        keymaps = [
          {
            mode = "n";
            key = "<Esc>";
            action = "<cmd>nohlsearch<CR>";
          }
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
          {
            mode = "n";
            key = "]q";
            action = "<cmd>cnext<CR>";
            options.desc = "Next quickfix item";
          }
          {
            mode = "n";
            key = "[q";
            action = "<cmd>cprev<CR>";
            options.desc = "Previous quickfix item";
          }
          {
            mode = "n";
            key = "<leader>e";
            action = "<cmd>Oil<CR>";
            options.desc = "Explore current directory";
          }
          {
            mode = "n";
            key = "<leader>d";
            action = "<cmd>lua vim.diagnostic.open_float()<CR>";
            options.desc = "Show LSP diagnostics";
          }
          {
            mode = "n";
            key = "<leader>bd";
            action = "<cmd>bd<CR>";
            options.desc = "Delete buffer";
          }
          {
            mode = "n";
            key = "<leader>bD";
            action = "<cmd>bd<CR>";
            options.desc = "Delete all buffer";
          }
        ];

        plugins = {
          lsp = {
            enable = true;
            keymaps.lspBuf = {
              K = "hover";
              gd = "definition";
              gr = "references";
              gi = "implementation";
              gt = "type_definition";
            };
            servers = {
              ts_ls.enable = true;
              nil_ls.enable = true;
              lua_ls.enable = true;
              pyright.enable = true;
              rust_analyzer = {
                enable = true;
                installCargo = true;
                installRustc = true;
              };
            };
          };

          luasnip.enable = true;

          cmp = {
            autoEnableSources = true;
            settings.sources = [
              { name = "path"; }
              { name = "buffer"; }
              { name = "luasnip"; }
              { name = "nvim_lsp"; }
            ];
          };

          blink-cmp = {
            enable = true;
            settings.appearance = {
              nerd_font_variant = "mono";
              use_nvim_cmp_as_default = true;
            };
          };

          conform-nvim = {
            enable = true;
            autoInstall.enable = true;
            luaConfig.pre = "slow_format_filetypes = slow_format_filetypes or {}";
            settings = {
              formatters_by_ft = {
                lua = [ "stylua" ];
                nix = [ "nixfmt" ];
                python = [ "black" ];
                css = [ "prettier" ];
                json = [ "prettier" ];
                cpp = [ "clang_format" ];
                javascript = [ "prettier" ];
                typescript = [ "prettier" ];
                bash = [
                  "shellcheck"
                  "shellharden"
                  "shfmt"
                ];
                "_" = [
                  "trim_whitespace"
                  "trim_newlines"
                ];
              };
              format_on_save = ''
                function(bufnr)
                  if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end
                  if slow_format_filetypes[vim.bo[bufnr].filetype] then return end
                  local function on_format(err) if err and err:match("timeout$") then slow_format_filetypes[vim.bo[bufnr].filetype] = true end end
                  return { timeout_ms = 200, lsp_fallback = true }, on_format
                end
              '';
              format_after_save = ''
                function(bufnr)
                  if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end
                  if not slow_format_filetypes[vim.bo[bufnr].filetype] then return end
                  return { lsp_fallback = true }
                end
              '';
              log_level = "warn";
              notify_on_error = true;
              notify_no_formatters = false;
            };
          };

          telescope = {
            enable = true;
            keymaps = {
              "<leader>ff" = "find_files";
              "<leader>fw" = "live_grep";
              "<leader>fb" = "buffers";
              "<leader>fc" = "command_history";
              "<leader>fd" = "diagnostics";
              "<leader>fh" = "help_tags";
              "<leader>fs" = "builtin";
              "<leader>fk" = "keymaps";

              "<leader>fgf" = "git_files";
              "<leader>fgc" = "git_commits";
              "<leader>fgb" = "git_branches";
            };
          };

          oil = {
            enable = true;
            settings = {
              columns = [ "icon" ];
              keymaps = {
                "<C-r>" = "actions.refresh";
              };
              delete_to_trash = true;
              float = {
                max_width = 130;
                max_height = 30;
              };
            };
          };

          undotree.enable = true;

          nvim-autopairs.enable = true;

          treesitter = {
            enable = true;
            settings.auto_install = true;
          };

          lualine = {
            enable = true;
            settings = {
              options = {
                component_separators = {
                  left = "";
                  right = "";
                };
                section_separators = {
                  left = "";
                  right = "";
                };
              };
            };
          };
          render-markdown.enable = true;
          web-devicons.enable = true;
          colorizer = {
            enable = true;
            settings.user_default_options.tailwind = "both";
          };
          cord.enable = true;
        };
      };
    };
    home.packages = [
      pkgs.ripgrep
      pkgs.git
      pkgs.gcc
    ];
  };
}
