vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.wrap = false

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.showmatch = true

vim.keymap.set("n", "<leader>e", ":Ex<CR>", { desc = "Open file explorer" })

-- Center screen when jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Move lines up/down
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set('n', '<M-h>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<M-l>', ':vertical resize +2<CR>')
vim.keymap.set('n', '<M-j>', ':resize -2<CR>')
vim.keymap.set('n', '<M-k>', ':resize +2<CR>')

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup,
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

vim.keymap.set("n", "<leader>fl", function() vim.lsp.buf.format() end)

vim.pack.add({
        "https://github.com/rose-pine/neovim.git",
        "https://github.com/neovim/nvim-lspconfig.git",
        "https://github.com/mason-org/mason.nvim.git",
        "https://github.com/mason-org/mason-lspconfig.nvim.git",
        "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim.git",
        "https://github.com/ibhagwan/fzf-lua.git",
        "https://github.com/romus204/tree-sitter-manager.nvim.git",
        "https://github.com/nvim-treesitter/nvim-treesitter-context.git",
        { src="https://github.eom/ThePrimeagen/harpoon.git", branch="harpoon3" },
        "https://github.com/nvim-lua/plenary.nvim.git",
        { src="https://github.com/saghen/blink.cmp.git", version="v1" },
        "https://github.com/rafamadriz/friendly-snippets.git",
        "https://github.com/lewis6991/gitsigns.nvim.git",
        "https://github.com/j-hui/fidget.nvim.git",
        { src="https://github.com/kylechui/nvim-surround.git", version=vim.version.range("4.x")},
        "https://github.com/catgoose/nvim-colorizer.lua.git",
})

require("rose-pine").setup({
    variant = "auto", -- auto, main, moon, or dawn
    dark_variant = "main", -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,
    enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
    },
    styles = {
        bold = false,
        italic = false,
        transparency = false,
    },
    highlight_groups = {
        Macro = { fg = "NONE" },
        Operator = { fg = "NONE" },
        Number = { fg = "NONE" },
        Constant = { fg = "NONE" },
        Include = { fg = "NONE" },
        Boolean = { fg = "NONE" },
        Label = { fg = "#31748f" },

        ["@parameter"] = { fg = "NONE" },
        ["@variable.parameter"] = { fg = "NONE" },
        ["@variable.parameter.builtin"] = { fg = "NONE" },
        ["@variable.builtin"] = { fg = "NONE" },
        ["@variable.member"] = { fg = "NONE" },

        ["@constant.macro"] = { fg = "NONE" },

        ["@property"] = { fg = "NONE" },
        ["@constructor"] = { fg = "NONE" },

        ["@punctuation.delimiter"] = { fg = "NONE" },
        ["@punctuation.bracket"] = { fg = "NONE" },
        ["@punctuation.special"] = { fg = "NONE" },

        ["@keyword.operator"] = { fg = "NONE" },

        BlinkCmpKindTypeParameter = { fg = "NONE" },
    },
})
vim.cmd.colorscheme("rose-pine")

--LSP
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "vtsls",
        "eslint",
        "superhtml",
        "emmet_language_server",
    },
    automatic_enable = true,
})
require('mason-tool-installer').setup({})
vim.diagnostic.config({
    virtual_text = true,
    underline = true,
})
vim.keymap.set("n", "<leader>ql", vim.diagnostic.setloclist, { desc = "Open diagnostic [L]ocal list" })
vim.keymap.set("n", "<leader>qf", vim.diagnostic.setqflist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "Open diagnostic float" })

require("fzf-lua").setup({
    "telescope",
    winopts = {
        preview = {
            hidden = true,
        },
    },
    keymap = {
        fzf = {
            ["ctrl-q"] = "select-all+accept",
        },
    },
})
local fzf = require("fzf-lua")
vim.keymap.set("n", "<leader>ff", fzf.files)
vim.keymap.set("n", "<leader>fg", fzf.live_grep)
vim.keymap.set("n", "<leader>fb", fzf.buffers)
vim.keymap.set("n", "<leader>pg", fzf.git_files)
vim.keymap.set("n", "<leader>fc", function()
    fzf.files({
        cwd = vim.fn.stdpath("config")
    })
end)

require("tree-sitter-manager").setup({
  ensure_installed = {
      "c",
      "lua",
      "javascript",
      "superhtml",
      "json",
  },
})
require("treesitter-context").setup({
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    multiwindow = false, -- Enable multiwindow support.
    max_lines = 1, -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to show for a single context
    trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20, -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})

local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>;", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<M-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<M-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<M-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<M-4>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<M-p>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<M-n>", function() harpoon:list():next() end)

require("blink.cmp").setup({
    keymap = { preset = 'default' },
    appearance = {
        nerd_font_variant = 'mono'
    },
    completion = {
        documentation = { auto_show = false }
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = {
        implementation = "prefer_rust_with_warning"
    }
})

require("gitsigns").setup({
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
    },
})

require("fidget").setup()

require("nvim-surround").setup()

vim.keymap.set('n', '<leader>u', function()
    vim.cmd('packadd nvim.undotree')
    vim.cmd('Undotree')
end, { desc = "Toggle Undotree" })

require("colorizer").setup({
    filetypes = {
        "lua",
        "css",
    },
    options = {
        parsers = {
            names = {
                enable = false,
            },
        },
    },
    user_defaultoions = { mode = "background" },
})
