vim.pack.add({ "https://github.com/mfussenegger/nvim-lint" })

local lint = require("lint")

lint.linters_by_ft = {
	javascript = { "biomejs" },
}

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
			callback = function()
				lint.try_lint()
			end,
		})
		lint.try_lint()
	end,
})
