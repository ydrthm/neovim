return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		ts.install({ "c", "lua", "python", "vim", "vimdoc", "markdown" })

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				-- 1. Check if the current filetype actually has a Treesitter parser
				local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
				if not lang then
					return
				end -- If no language mapping, stop here

				local has_parser, _ = pcall(vim.treesitter.get_parser, args.buf, lang)
				if not has_parser then
					return
				end -- If parser isn't installed, stop here

				-- 2. Only start if the parser exists
				vim.treesitter.start(args.buf)
			end,
		})
	end,
}
