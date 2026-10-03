vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "biome" },
        c = { "clang-format" },
	},
})

vim.keymap.set("n", "<leader>gq", function()
	require("conform").format({
		async = true,
		lsp_format = "fallback",
	})
end, { desc = "Format buffer" })
