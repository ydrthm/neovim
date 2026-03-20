return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },
    opts = {
        ensure_installed = {
            "lua_ls",
            "clangd",
            "vtsls",
            "eslint",
            "superhtml",
        },
        automatic_enable = true,
    },
    config = function(_, opts)
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })
        require("mason-lspconfig").setup(opts)

        vim.diagnostic.config({
            virtual_text = true,
            underline = true,
        })

        vim.keymap.set("n", "<leader>ql", vim.diagnostic.setloclist, { desc = "Open diagnostic [L]ocal list" })
        vim.keymap.set("n", "<leader>qf", vim.diagnostic.setqflist, { desc = "Open diagnostic [Q]uickfix list" })
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
    end
}
