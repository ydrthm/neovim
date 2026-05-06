return {
    {
    	"ibhagwan/fzf-lua",
        -- dependencies = { "nvim-tree/nvim-web-devicons" },
    	opts = {
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
    	},
    	keys = {
    		{ "<leader>ff", function() require("fzf-lua").files() end, desc = "FuzzyFind files", },
    		{ "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Fuzzyfind grep", },
    		{ "<leader>fb", function() require("fzf-lua").buffers() end, desc = "FuzzyFind buffers", },
    		{ "<leader>fk", function() require("fzf-lua").keymaps() end, desc = "Find keymaps", },
    		{ "<leader>sf", function() require("fzf-lua").builtin() end, desc = "Select builtin finders", },
    		{ "<leader>fc", function() require("fzf-lua").files({ cwd = vim.fn.stdpath("config") }) end, desc = "Open nvim config", },
    		{ "<leader>pg", function() require("fzf-lua").git_files() end, desc = "Search Git Files", },
    	},
    },
}
