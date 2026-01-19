return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			keymap = {
				fzf = {
					["ctrl-q"] = "select-all+accept",
				},
			},
		},
		keys = {
			{
				"<leader>ff",
				function()
					require("fzf-lua").files()
				end,
				desc = "Find files",
			},
			{
				"<leader>fg",
				function()
					require("fzf-lua").live_grep()
				end,
				desc = "Find grep at current directory",
			},
			{
				"<leader>fb",
				function()
					require("fzf-lua").buffers()
				end,
				desc = "Find buffers",
			},
			{
				"<leader>fd",
				function()
					require("fzf-lua").zoxide()
				end,
				desc = "Open zoxide",
			},
			{
				"<leader>fk",
				function()
					require("fzf-lua").keymaps()
				end,
				desc = "Find keymaps",
			},
			{
				"<leader>sf",
				function()
					require("fzf-lua").builtin()
				end,
				desc = "Select builtin finders",
			},

			{
				"<leader>fc",
				function()
					require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find nvim config",
			},
		},
	},
	-- {
	--   "ThePrimeagen/harpoon",
	--   branch = "harpoon2",
	--   dependencies = { "nvim-lua/plenary.nvim" },
	--   config = function()
	--     local harpoon = require("harpoon")
	--     harpoon:setup()
	--     vim.keymap.set("n", "<leader>z", function()
	--       harpoon:list():add()
	--     end)
	--     vim.keymap.set("n", "<C-e>", function()
	--       harpoon.ui:toggle_quick_menu(harpoon:list())
	--     end)
	--
	--     vim.keymap.set("n", "<leader>1", function()
	--       harpoon:list():select(1)
	--     end)
	--     vim.keymap.set("n", "<leader>2", function()
	--       harpoon:list():select(2)
	--     end)
	--     vim.keymap.set("n", "<leader>3", function()
	--       harpoon:list():select(3)
	--     end)
	--     vim.keymap.set("n", "<leader>4", function()
	--       harpoon:list():select(4)
	--     end)
	--   end,
	-- },
}
