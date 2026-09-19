return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },
    opts = {
        ensure_installed = {
            "lua_ls",
            "clangd",
            "clang-format",
            "vtsls",
            "biome",
            "superhtml",
            "emmet_language_server",
        },
        auto_update = false,
        run_on_start = true,
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
        require("mason-tool-installer").setup(opts)
        require("mason-lspconfig").setup()

        vim.diagnostic.config({
            virtual_text = true,
            underline = true,
        })

        vim.keymap.set("n", "<leader>ql", vim.diagnostic.setloclist, { desc = "Open diagnostic [L]ocal list" })
        vim.keymap.set("n", "<leader>qf", vim.diagnostic.setqflist, { desc = "Open diagnostic [Q]uickfix list" })
    end
}
