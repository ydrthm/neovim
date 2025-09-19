return {
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"windwp/nvim-ts-autotag", --html tag
		config = function()
			require("nvim-ts-autotag").setup()
		end,
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
		lazy = true, -- load only when called
		cmd = "UndotreeToggle", -- lazy-load when this command is used
		config = function()
			vim.g.undotree_SetFocusWhenToggle = 1
			vim.g.undotree_HighlightChangedText = 1
			-- vim.g.undotree_TreeNodeShape = "●"
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
                    html = { mode = "foreground" },
                },
                user_default_options = { mode = "background" },
            })
        end,
	},
}
