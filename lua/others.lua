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
        "mbbill/undotree",
        cmd = "UndotreeToggle", -- lazy-load when this command is used
        config = function()
            vim.g.undotree_SetFocusWhenToggle = 1
            vim.g.undotree_HighlightChangedText = 1
            -- vim.g.undotree_TreeNodeShape = "●"
        end,
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "UndotreeToggle" }),
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
}
