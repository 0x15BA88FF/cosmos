local g = vim.g
local o = vim.g
local map = vim.keymap

g.mapleader = " "

o.number = true
o.showmode = false
o.cursorline = true
o.signcolumn = "yes"
o.virtualedit = "block"
o.relativenumber = true

o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.shiftround = true
o.breakindent = true
o.smartindent = true

o.undofile = true
o.swapfile = false
o.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"

o.wrap = false
o.colorcolumn = "80"

o.smartcase = true
o.ignorecase = true

o.updatetime = 250
o.timeoutlen = 300

o.scrolloff = 10
o.splitright = true
o.splitbelow = true
o.splitkeep = "screen"

o.list = true
o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

o.confirm = true
o.termguicolors = true
o.completeopt = "menu,menuone,noselect"

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- un-highlight
map.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- better indents
map.set("v", "<", "<gv")
map.set("v", ">", ">gv")

-- better movement
map.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })

-- move lines
map.set({ "n", "v" }, "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move Down" })
map.set({ "n", "v" }, "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move Up" })

-- switching windows
map.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
map.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })
map.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
map.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })

-- resize windows
map.set("n", "<C-S-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map.set("n", "<C-S-J>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map.set("n", "<C-S-K>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map.set("n", "<C-S-L>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- buffer control
map.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map.set("n", "<leader>bd", "<cmd>:bd<cr>", { desc = "Delete Buffer" })
map.set("n", "<leader>bD", "<cmd>:bufdo bd<cr>", { desc = "Delete All Buffer" })
map.set("n", "<leader>bn", "<cmd>enew<cr>", { desc = "New File Buffer" })

-- tab control
map.set("n", "<tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map.set("n", "<S-tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map.set("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "New Tab" })
map.set("n", "<leader><tab>$", "<cmd>tablast<cr>", { desc = "Last Tab" })
map.set("n", "<leader><tab>0", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map.set("n", "<leader><tab>D", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })

-- windows
map.set("n", "<leader>\\", "<C-W>s", { desc = "Split Window Below", remap = true })
map.set("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- lists
map.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

map.set("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })
map.set("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })

-- LSP
map.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
map.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)
require("lazy").setup({
  spec = {
    {
      "RRethy/nvim-base16",
      lazy = false,
      priority = 1000,
      config = function() vim.cmd("colorscheme base16-catppuccin-mocha") end,
    },
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {
        options = {
          theme = "auto",
          section_separators = "",
          component_separators = "",
        },
      },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = {
            "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
          },
          sync_install = false,
          auto_install = true,
          ignore_install = {},
          modules = {},
          highlight = {
            enable = true,
            disable = function(_, buf)
              local max_filesize = 100 * 1024
              local ok, stats = pcall(
                vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf)
              )
              if ok and stats and stats.size > max_filesize then
                return true
              end
            end,
          },
        })
      end,
    },
    {
      "saghen/blink.cmp",
      version = "*",
      dependencies = { "rafamadriz/friendly-snippets" },
      opts = {
        keymap = { preset = "default" },
        appearance = {
          use_nvim_cmp_as_default = true,
          nerd_font_variant = "mono",
        },
      },
      opts_extend = { "sources.default" },
    },
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        "saghen/blink.cmp", {
          "folke/lazydev.nvim",
          ft = "lua",
          opts = {
            library = {{ path = "${3rd}/luv/library", words = { "vim%.uv" } }},
          },
        },
      },
      config = function()
        local lsp = vim.lsp.config
        local util = require("lspconfig.util")
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        vim.api.nvim_create_autocmd("FileType", {
          pattern = { "lua" },
          callback = function(args)
            lsp.lua_ls.start({
              capabilities = capabilities,
              root_dir = util.root_pattern(".git", "."),
              settings = {
                Lua = {
                  diagnostics = { globals = { "vim" } },
                  workspace = { checkThirdParty = false },
                },
              },
            }, args.buf)
          end,
        })
        vim.api.nvim_create_autocmd("FileType", {
          pattern = { "python" },
          callback = function(args)
            local venv = os.getenv("VIRTUAL_ENV")
            local pythonPath = venv and (venv .. "/bin/python") or nil

            lsp.pyright.start({
              capabilities = capabilities,
              root_dir = util.root_pattern(
                "pyproject.toml", "requirements.txt", ".git"
              ),
              settings = pythonPath and {
                python = { pythonPath = pythonPath },
              } or {},
            }, args.buf)
          end,
        })
      end,
    },
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
      config = true,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = { "williamboman/mason.nvim" },
      opts = { ensure_installed = { "pyright", "lua_ls", "nil_ls" } },
    },
    {
      "stevearc/conform.nvim",
      event = "BufWritePre",
      config = function()
        require("conform").setup({
          formatters_by_ft = {
            lua = { "stylua" },
            python = { "black" },
            css = { "prettier" },
            json = { "prettier" },
            javascript = { "prettier" },
            typescript = { "prettier" },
          },
          format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
          },
          notify_on_error = true,
        })
        local mason_registry = require("mason-registry")
        local formatters = { "stylua", "black", "prettier", "nixpkgs-fmt" }
        for _, formatter in ipairs(formatters) do
          if not mason_registry.is_installed(formatter) then
            vim.cmd("MasonInstall " .. formatter)
          end
        end
      end,
    },
    {
      "stevearc/oil.nvim",
      dependencies = { "echasnovski/mini.icons" },
      config = function()
        require("oil").setup({
          delete_to_trash = true,
          float = { max_width = 130, max_height = 30 },
        })
        vim.keymap.set("n", "<Leader>e", function()
          local dir = require("oil").get_current_dir()
          require("oil").open_float(dir, { preview = {} })
        end, { desc = "Explore current directory" })
        if pcall(require, "tnew.config") then
          vim.keymap.set("n", "<Leader>et", function()
            local dir = require("tnew.config").options.dir
            require("oil").open_float(vim.fn.fnameescape(dir), { preview = {} })
          end, { desc = "Explore tnew directory" })
        end
      end,
    },
    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.8",
      dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      },
      config = function()
        require("telescope").setup({
          extensions = { fzf = {} },
        })
        require("telescope").load_extension("fzf")

        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<Leader>ff", builtin.find_files, {
          desc = "Find files"
        })
        vim.keymap.set("n", "<Leader>fw", builtin.live_grep, {
          desc = "Live grep"
        })
        vim.keymap.set("n", "<Leader>fb", builtin.buffers, {
          desc = "Find buffers"
        })
        vim.keymap.set("n", "<Leader>fh", builtin.help_tags, {
          desc = "Help tags"
        })
        vim.keymap.set("n", "<Leader>fr", builtin.lsp_references, {
          desc = "LSP references"
        })
        vim.keymap.set("n", "<Leader>fg", builtin.git_files, {
          desc = "Git files"
        })

        if pcall(require, "tnew.config") then
          vim.keymap.set("n", "<leader>ft", function()
            builtin.live_grep({
              disable_coordinates = true,
              prompt_title = "Grep tnew files",
              search_dirs = { require("tnew.config").options.dir },
            })
          end, { desc = "Grep tnew files" })
        end
      end,
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      dependencies = { "echasnovski/mini.icons" },
      opts = {},
    },
    {
      "vyfor/cord.nvim",
      build = ":Cord update",
      opts = {
        buttons = {
          {
            label = "View Repository",
            url = function(opts)
              return opts.repo_url
            end,
          },
        },
      },
    },
    {
      "0x15ba88ff/tnew.nvim",
      opts = {},
      cmd = { "Tnew", "TnewClean" },
    },
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps",
        },
      },
    },
  },
  checker = { enabled = true },
}, {
  defaults = { lazy = true },
  ui = {
    icons = {
      ft = "",
      lazy = "󰂠",
      loaded = "",
      not_loaded = "",
    },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "tar",
        "zip",
        "gzip",
        "netrw",
        "tohtml",
        "optwin",
        "syntax",
        "logipat",
        "matchit",
        "rplugin",
        "vimball",
        "synmenu",
        "ftplugin",
        "compiler",
        "rrhelper",
        "getscript",
        "bugreport",
        "tarPlugin",
        "zipPlugin",
        "netrwPlugin",
        "2html_plugin",
        "vimballPlugin",
        "netrwSettings",
        "getscriptPlugin",
        "spellfile_plugin",
        "netrwFileHandlers",
      },
    },
  },
})
