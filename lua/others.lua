return {
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	-- {
	-- 	"windwp/nvim-autopairs",
	-- 	event = "InsertEnter",
	-- 	config = true,
	-- 	opts = {},
	-- },
	-- {
	--   "windwp/nvim-ts-autotag", --html tag
	--   config = function()
	--     require("nvim-ts-autotag").setup()
	--   end,
	-- },
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
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	-- {
	-- 	"nvim-lualine/lualine.nvim",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	config = function()
	-- 		require("lualine").setup({
	-- 			options = {
	-- 				theme = "solarized_dark",
	--                    section_separators  = '',
	--                    component_separators = '',
	-- 			},
	-- 		})
	-- 	end,
	-- },
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local conform = require("conform")
            conform.setup({
                formatters_by_ft = {
                    python = { "ruff_organize_imports", "ruff_format" },
                    c = { "clang-format" },
                    html = { "superhtml" },
                    javascript = { "biome" },
                },
                formatters = {
                    ["clang-format"] = {
                        prepend_args = { "--style={IndentWidth: 4, BasedOnStyle: LLVM}" },
                    },
                },
            })

            -- FIX: The keymap MUST be inside the config function or outside the table
            vim.keymap.set("n", "<leader>fl", function()
                conform.format({
                    timeout_ms = 500,
                    lsp_fallback = true, -- This allows clangd to handle C files
                })
            end, { desc = "Format Language/Code" })
        end,
    }
}
