return {
    {
        "j-hui/fidget.nvim",
        opts = {},
    },
    {
        "kylechui/nvim-surround",
        version = "^3.0.0",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    },
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        config = function()
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
        end,
    },
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                javascript = { "biome" },
                c = { "clang-format" },
            },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
        keys = {
            {
                "<leader>fl",
                function()
                    require("conform").format({
                        async = true,
                        lsp_format = "fallback",
                    })
                end,
                mode = "",
                desc = "Format buffer",
            },
        },
    },
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lint = require("lint")
            lint.linters_by_ft = {
                javascript = { "biomejs" },
            }
            local lint_augroup = vim.api.nvim_create_augroup("nvim-lint", { clear = true })
            vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
                group = lint_augroup,
                callback = function()
                    lint.try_lint()
                end,
            })

            vim.keymap.set("n", "<leader>ln", function()
                lint.try_lint()
            end, { desc = "Trigger linting" })
        end,
    }

}
