vim.opt.guicursor = "n-v-c:block-MyCursor,i-ci-ve:block-MyCursor,r-cr:block-MyCursor"
vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes:1"
vim.opt.ignorecase = true
vim.opt.swapfile = false
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.clipboard = "unnamedplus"
vim.opt.winborder = "single"
vim.opt.foldmethod = "manual"

vim.opt.completeopt = "fuzzy,menuone,popup"
vim.opt.complete = "o,.,w,b"
vim.opt.pumheight = 10
vim.opt.pummaxwidth = 80
vim.opt.autocomplete = false

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.g.mapleader = " "
vim.keymap.set("n", "<space>", "<Nop>")
vim.keymap.set("n", "<leader>;", ":Ex<CR>", { desc = "Go to directory" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Navigate search word (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Navigate search word (centered)" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })

-- Helper function for wrapping around quickfix list
local function quickfix_nav(cmd)
    return function()
        local status, _ = pcall(function() vim.cmd(cmd) end)
        if not status then
            if cmd == "cnext" then
                vim.cmd("cfirst")
            elseif cmd == "cprev" then
                vim.cmd("clast")
            end
        end
        vim.cmd("normal! zz")
    end
end

vim.keymap.set("n", "<M-j>", quickfix_nav("cnext"), { desc = "Next Quickfix Item" })
vim.keymap.set("n", "<M-k>", quickfix_nav("cprev"), { desc = "Previous Quickfix Item" })

vim.keymap.set("n", "<leader>gq", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format current buffer" })

vim.api.nvim_set_hl(0, "MyCursor", { fg = "#3f3f3f", bg = "#dcdccc" })

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({
            timeout = 180,
        })
    end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup("restore-last-cursor", { clear = true }),
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Disable semantic tokens globally for a cleaner, snappier UI
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
            client.server_capabilities.semanticTokensProvider = nil
        end
    end,
})

-- vim.api.nvim_create_user_command("PrettierFormat", function()
--     local file = vim.api.nvim_buf_get_name(0)
--
--     if file == "" then
--         vim.notify("Save the file before formatting", vim.log.levels.WARN)
--         return
--     end
--
--     vim.fn.jobstart({ "prettier", "--write", file }, {
--         on_exit = function(_, code)
--             if code == 0 then
--                 vim.schedule(function()
--                     vim.cmd("checktime")
--                     vim.notify("Formatted with Prettier")
--                 end)
--             else
--                 vim.schedule(function()
--                     vim.notify("Prettier formatting failed", vim.log.levels.ERROR)
--                 end)
--             end
--         end,
--     })
-- end, { desc = "Format current file with Prettier" })
--
-- vim.keymap.set("n", "<leader>fl", "<cmd>PrettierFormat<cr>", {
--     desc = "Format with Prettier",
-- })

require("plugins.telescope")
require("plugins.miniharp")
require("plugins.lsp")
require("plugins.treesitter")
require("plugins.colorscheme")
require("plugins.luasnip")

vim.pack.add({
    {
        src = "https://github.com/kylechui/nvim-surround",
        version = vim.version.range("4.x"),
    },
    "https://github.com/j-hui/fidget.nvim",
    "https://github.com/jiaoshijie/undotree",
    "https://github.com/catgoose/nvim-colorizer.lua",
    "https://github.com/lewis6991/gitsigns.nvim",
})

require("nvim-surround").setup()
require("fidget").setup()
require("undotree").setup()
vim.keymap.set("n", "<leader>u", require("undotree").toggle, { silent = true })

require("colorizer").setup({
    filetypes = {
        "lua",
        "css",
        -- html = { mode = "foreground" },
    },
    options = {
        parsers = {
            names = {
                enable = false,
                lowercase = false, -- match lowercase names
                camelcase = false, -- match CamelCase names (e.g. "LightBlue")
                uppercase = false, -- match UPPERCASE names
            },
        },
    },
    user_defaultoions = { mode = "background" },
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
