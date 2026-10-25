local hooks = function(ev)
	local name, kind = ev.data.spec.name, ev.data.kind
	if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
		vim.system({ "make" }, { cwd = ev.data.path }):wait()
	end
end
vim.api.nvim_create_autocmd("PackChanged", { callback = hooks })

vim.pack.add({
	{
		src = "https://github.com/nvim-telescope/telescope.nvim",
		version = vim.version.range("*"),
	},
	-- dependencies
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
})

require("telescope").setup({
    defaults = require("telescope.themes").get_ivy({
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<esc>"] = require("telescope.actions").close,
                ["<C-d>"] = require("telescope.actions").delete_buffer,
            },
        },
    }),
})

require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fd', builtin.find_files, { desc = 'Telescope find files (current)' })
vim.keymap.set('n', '<leader>fc', function() builtin.find_files({ cwd = vim.fn.stdpath('config') }) end, { desc = 'Telescope find config' })
vim.keymap.set('n', '<leader>fr', function() builtin.find_files({ cwd = os.getenv('HOME') }) end, { desc = 'Telescope find files (HOME)' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fo', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope keymaps' })
vim.keymap.set('n', '<leader>pg', builtin.git_commits, { desc = 'Telescope git commits' })
vim.keymap.set('n', '<leader>mp', builtin.man_pages, { desc = 'Telescope man pages' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Telescope grep strings' })


